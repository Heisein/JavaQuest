package com.jqt.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.jqt.board.model.vo.board;

import static com.jqt.common.JDBCTemplet.*;

public class boardDao {
	Properties prop = new Properties();
	
	public boardDao() {
		String fileName = boardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//공지사항 셀렉트~
	public ArrayList<board> selectqaa(Connection con, int currentPage, int limit) {
		ArrayList<board> list = null;
		//Statement stmt =null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectqaa");
		
		try {
			/*stmt = con.createStatement();
			rset = stmt.executeQuery(query);*/
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<board>();
			
			while(rset.next()) {
				board n = new board();
				
				//n.setBno(rset.getInt("bno"));
				n.setBid(rset.getInt("bid"));
				n.setBno(rset.getInt("bn"));
				n.setBtitle(rset.getString("bt"));
				//n.setBwriter(rset.getString("bwriter"));
				n.setBwriter(rset.getString("un"));
				n.setBcount(rset.getInt("bc"));
				n.setBdate(rset.getDate("de"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return list;
	}

	public int insertqaa(Connection con, board m) {
		PreparedStatement pstmt = null;
		int result= 0;
		
		String query = prop.getProperty("insertqaa");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, m.getBtitle());
			pstmt.setString(2, m.getBcontext());
			pstmt.setString(3, m.getBwriter());
			
			result=pstmt.executeUpdate();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(con);
		}
		return result;
	}

	public board selectOne(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		board n = null;
		
		String query = prop.getProperty("selectQaa");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new board();
				
				n.setBid(rset.getInt("bid"));
				n.setBno(rset.getInt("bno"));
				n.setBtitle(rset.getString("btitle"));
				n.setBwriter(rset.getString("user_nickname"));
				n.setBcount(rset.getInt("bcount"));
				n.setBdate(rset.getDate("bdate"));
				n.setBcontext(rset.getString("bcontent"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return n;
	}

	public int updateCount(Connection con, int bno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, bno);
			
			result= pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount =0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt= con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);	//첫번째 컬럼값을 가져옴
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	public int insertReply(Connection con, board b) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBcontext());
			pstmt.setString(2, b.getBwriter());
			pstmt.setInt(3, b.getBcount2());
			pstmt.setInt(4, b.getBid());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<board> selectReply(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<board> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bid);
			
			list = new ArrayList<board>();
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				board b = new board();
				
				b.setBid(rset.getInt("bid"));
				b.setBcontext(rset.getString("bcontent"));
				b.setBwriter(rset.getString("user_nickname"));
				b.setBcount2(rset.getInt("bcount2"));
				b.setRef_bid(rset.getInt("ref_bid"));
				b.setReply_level(rset.getInt("reply_level"));
				b.setBdate(rset.getDate("bdate"));
				
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<board> selectFb(Connection con, int currentPage, int limit) {
		ArrayList<board> list = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectFb");
		
		try {
			pstmt=con.prepareStatement(query);
			
			int startRow = (currentPage -1) * limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<board>();
			
			while(rset.next()) {
				board n = new board();
				
				n.setBid(rset.getInt("bid"));
				n.setBno(rset.getInt("bn"));
				n.setBtitle(rset.getString("bt"));
				n.setBwriter(rset.getString("un"));
				n.setBcount(rset.getInt("bc"));
				n.setBdate(rset.getDate("de"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return list;
	}

	public int insertFb(Connection con, board m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertFb");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, m.getBtitle());
			pstmt.setString(2, m.getBcontext());
			pstmt.setString(3, m.getBwriter());
			
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

	public board selectOnebd(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		board n = null;
		String query = prop.getProperty("selectOneFd");
		
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1, num);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new board();
			
				n.setBid(rset.getInt("bid"));
				n.setBno(rset.getInt("bno"));
				n.setBtitle(rset.getString("btitle"));
				n.setBwriter(rset.getString("user_nickname"));
				n.setBcount(rset.getInt("bcount"));
				n.setBdate(rset.getDate("bdate"));
				n.setBcontext(rset.getString("bcontent"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return n;
	}

	public ArrayList<board> selectQuestion(Connection con, int currentPage, int limit) {
		ArrayList<board> list = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("selectQuestion");
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (currentPage -1) * limit +1;
			int endRow = startRow + limit -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<board>();
			
			while(rset.next()) {
				board n = new board();
				n.setBid(rset.getInt("bid"));
				n.setBno(rset.getInt("bn"));
				n.setBtitle(rset.getString("bt"));
				n.setBwriter(rset.getString("un"));
				n.setBcount(rset.getInt("bc"));
				n.setBdate(rset.getDate("de"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return list;
	}

	public int insertquestion(Connection con, board m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertquestion");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, m.getBtitle());
			pstmt.setString(2, m.getBcontext());
			pstmt.setString(3, m.getBwriter());
			
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

	public board selectOneQuestion(Connection con, String num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		board n = null;
		String query = prop.getProperty("selectOneQuestion");
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1, num);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new board();
			
				n.setBid(rset.getInt("bid"));
				n.setBno(rset.getInt("bno"));
				n.setBtitle(rset.getString("btitle"));
				n.setBwriter(rset.getString("user_nickname"));
				n.setBcount(rset.getInt("bcount"));
				n.setBdate(rset.getDate("bdate"));
				n.setBcontext(rset.getString("bcontent"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return n;
	}

}
