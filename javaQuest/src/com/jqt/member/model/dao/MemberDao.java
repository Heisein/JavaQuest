package com.jqt.member.model.dao;

import static com.jqt.common.JDBCTemplet.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.jqt.member.model.vo.Member;
public class MemberDao {
	//모든 메소드에서 쓸 Properties 초기화
	private Properties prop = new Properties();
	
	//MemberDao객체가 실행될때마다 아래 로직 수행
	public MemberDao(){
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public Member loginCheck(Connection con, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				loginUser = new Member();
			
				loginUser.setUserNum(rset.getInt("user_num"));
				loginUser.setUserId(rset.getString("user_id"));
				loginUser.setUserPwd(rset.getString("user_pwd"));
				loginUser.setNickName(rset.getString("user_nickName"));
				loginUser.setEmail(rset.getString("email")); 
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setExp(rset.getInt("user_exp"));
				loginUser.setType(rset.getInt("user_type"));
				loginUser.setMsg(rset.getString("user_msg"));
				loginUser.setIsIdentified(rset.getString("is_identified"));
				loginUser.setLastIp(rset.getString("last_ip"));
				loginUser.setEnrollDate(rset.getDate("enroll_date"));
				loginUser.setIsWithdraw(rset.getString("is_withdraw"));
				
				// 레벨 설정
				int exp = loginUser.getExp();
				
				if(exp >= 6400) loginUser.setLevel(10);
				else if(exp >= 3200) loginUser.setLevel(9);
				else if(exp >= 1600) loginUser.setLevel(8);
				else if(exp >= 800) loginUser.setLevel(7);
				else if(exp >= 400) loginUser.setLevel(6);
				else if(exp >= 200) loginUser.setLevel(5);
				else if(exp >= 100) loginUser.setLevel(4);
				else if(exp >= 50) loginUser.setLevel(3);
				else if(exp >= 10) loginUser.setLevel(2);
				else  loginUser.setLevel(1);
				
				System.out.println("MemberDao loginCheck(loginUser) : " + loginUser);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
		
	}
	
	public ArrayList<Member> selectList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ResultSet rset2 = null;
		ArrayList<Member> list = new ArrayList<Member>();
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
			pstmt = con.prepareStatement(query);
			
			rset2 = pstmt.executeQuery();
			
			while(rset.next()){
				Member m = new Member();
				
				m.setUserNum(rset.getInt("user_num"));
				m.setUserId(rset.getString("user_id"));
				m.setNickName(rset.getString("user_nickname"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setExp(rset.getInt("user_exp"));
				m.setType(rset.getInt("user_type"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setMsg(rset.getString("user_msg"));
				m.setIsIdentified(rset.getString("is_identified"));
				m.setIsWithdraw(rset.getString("is_withdraw"));
				
				// 레벨 설정
				int exp = m.getExp();
				
				if(exp >= 6400) m.setLevel(10);
				else if(exp >= 3200) m.setLevel(9);
				else if(exp >= 1600) m.setLevel(8);
				else if(exp >= 800) m.setLevel(7);
				else if(exp >= 400) m.setLevel(6);
				else if(exp >= 200) m.setLevel(5);
				else if(exp >= 100) m.setLevel(4);
				else if(exp >= 50) m.setLevel(3);
				else if(exp >= 10) m.setLevel(2);
				else  m.setLevel(1);
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int deleteMember(Connection con, int num) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, num);

				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
				close(pstmt);
			}

		return result;
	}

	//마이페이지 내에 회원정보 수정용 메소드 
	
		public int updateMember(Connection con, Member m) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("updateMember");
			
			try {
				pstmt = con.prepareStatement(query);
				
				//pstmt.setString(1, m.getUserPwd());
				pstmt.setString(1, m.getNickName());
				pstmt.setString(2, m.getEmail());
				pstmt.setString(3, m.getPhone());
				pstmt.setString(4, m.getUserId());
				
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(pstmt);
			}
			
			return result;
		}

	public int insertMember(Connection con, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getNickName());
			pstmt.setString(4, m.getEmail());
			pstmt.setString(5, m.getPhone());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(con);
		}
		return result;
	}

	public int idcheck(Connection con, String userId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public int nickcheck(Connection con, String user_nickname) {
		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String query = prop.getProperty("nickCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, user_nickname);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	public Member searchId(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = prop.getProperty("searchId");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				m.setUserNum(rset.getInt("user_num"));
				m.setUserId(rset.getString("user_id"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setNickName(rset.getString("user_nickname"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setExp(rset.getInt("user_exp"));
				m.setType(rset.getInt("user_type"));
				m.setMsg(rset.getString("user_msg"));
				m.setIsIdentified(rset.getString("is_identified"));
				m.setLastIp(rset.getString("last_ip"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setIsWithdraw(rset.getString("is_withdraw"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return m;
	}

	public Member searchPwd(Connection con, String id, String email) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchPwd");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();
				m.setUserNum(rset.getInt("user_num"));
				m.setUserId(rset.getString("user_id"));
				m.setUserPwd(rset.getString("user_pwd"));
				m.setNickName(rset.getString("user_nickname"));
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));
				m.setExp(rset.getInt("user_exp"));
				m.setType(rset.getInt("user_type"));
				m.setMsg(rset.getString("user_msg"));
				m.setIsIdentified(rset.getString("is_identified"));
				m.setLastIp(rset.getString("last_ip"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				m.setIsWithdraw(rset.getString("is_withdraw"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

}
