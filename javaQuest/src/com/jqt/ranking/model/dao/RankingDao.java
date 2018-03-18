package com.jqt.ranking.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.jqt.ranking.model.vo.Ranking;

import static com.jqt.common.JDBCTemplet.*;

public class RankingDao {
	private Properties prop = new Properties();
	
	public RankingDao(){
		String fileName = RankingDao.class.getResource("/sql/ranking/ranking-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Ranking> RankingList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> list = null;
		
		String query = prop.getProperty("levelRanking");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Ranking>();
			
			while(rset.next()){
				Ranking r = new Ranking();
				
				r.setrNum(rset.getInt("rnum"));
				r.setUserNum(rset.getInt("user_num"));
				r.setUserNickName(rset.getString("user_nickname"));
				r.setUserExp(rset.getInt("user_exp"));
				r.setUserType(rset.getInt("user_type"));
				r.setUserMsg(rset.getString("user_msg"));
				r.setIsWithDraw(rset.getString("is_withdraw"));
				r.setClearQuest(rset.getInt("clear_quest"));
				
				// 레벨 설정
				int exp = r.getUserExp();
				
				if(exp >= 6400) r.setUserLevel(10);
				else if(exp >= 3200) r.setUserLevel(9);
				else if(exp >= 1600) r.setUserLevel(8);
				else if(exp >= 800) r.setUserLevel(7);
				else if(exp >= 400) r.setUserLevel(6);
				else if(exp >= 200) r.setUserLevel(5);
				else if(exp >= 100) r.setUserLevel(4);
				else if(exp >= 50) r.setUserLevel(3);
				else if(exp >= 10) r.setUserLevel(2);
				else r.setUserLevel(1);
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<Ranking> TimeAttackRanking(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> list = null;
		
		String query = prop.getProperty("timeAttackRanking");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				list = new ArrayList<Ranking>();
				Ranking r = new Ranking();
				
				r.setrNum(rset.getInt("rnum"));
				r.setUserNum(rset.getInt("user_num"));
				r.setUserNickName(rset.getString("user_nickname"));
				r.setUserType(rset.getInt("user_type"));
				r.setUserMsg(rset.getString("user_msg"));
				r.setIsWithDraw(rset.getString("is_withdraw"));
				
				list.add(r);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<Ranking> QuizRanking(Connection con, int code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ranking> list = null;
		
		String query = prop.getProperty("quizRanking");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, code);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				list = new ArrayList<Ranking>();
				Ranking r = new Ranking();
				
				r.setrNum(rset.getInt("rnum"));
				r.setUserNum(rset.getInt("user_num"));
				r.setUserNickName(rset.getString("user_nickname"));
				r.setUserMsg(rset.getString("user_msg"));
				r.setWinRate(rset.getInt("win"));
				
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public Ranking SearchNickName(Connection con, String nickName, String order) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Ranking list = null;
		
		String query = prop.getProperty("searchNickName");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, nickName);
			pstmt.setString(2, order);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				list = new Ranking();
				
				list.setrNum(rset.getInt("rnum"));
				list.setUserNum(rset.getInt("user_num"));
				list.setUserNickName(rset.getString("user_nickname"));
				list.setUserLevel(rset.getInt("user_level"));
				list.setUserType(rset.getInt("user_type"));
				list.setUserMsg(rset.getString("user_msg"));
				list.setIsWithDraw(rset.getString("is_withdraw"));
				list.setTimeAttack(rset.getInt("quiz_time"));
				list.setWinRate(rset.getInt("win"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}


}
