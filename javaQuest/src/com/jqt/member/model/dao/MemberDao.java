package com.jqt.member.model.dao;

import static com.jqt.common.JDBCTemplet.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
		ArrayList<Member> list = new ArrayList<Member>();
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			
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

}
