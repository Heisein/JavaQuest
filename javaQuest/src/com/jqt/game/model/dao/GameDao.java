package com.jqt.game.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Properties;

import com.jqt.game.model.vo.SelectGame;

import static com.jqt.common.JDBCTemplet.*;
public class GameDao {
	private Properties prop = new Properties();
	
	public GameDao(){
		String fileName = GameDao.class.getResource("/sql/game/game.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//사지선다 게임 문제 뽑기
	public HashSet<SelectGame> selectGame(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		HashSet<SelectGame> list = null;
		
		String query = prop.getProperty("selectGame");
		
		System.out.println(query);
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new HashSet<SelectGame>();
				while(rset.next()){
					SelectGame sg = new SelectGame();
					sg.setQuizNo(rset.getInt("quiz_no"));
					sg.setQuizContent(rset.getString("quiz_content"));
					sg.setQuizChoice(rset.getString("quiz_choice"));
					sg.setQuizAnswer(rset.getString("quiz_answer"));
					
					System.out.println("GameDao sg : " + sg);
					list.add(sg);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	//ox게임 문제 추출용
	public ArrayList<SelectGame> oxGameList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<SelectGame> list = null;
		
		String query = prop.getProperty("oxGameList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			list = new ArrayList<SelectGame>();
			while(rset.next()){
				SelectGame sg = new SelectGame();
				sg.setQuizNo(rset.getInt("QUIZ_NO"));
				sg.setQuizContent(rset.getString("QUIZ_CONTENT"));
				sg.setQuizAnswer(rset.getString("QUIZ_ANSWER"));
				
				list.add(sg);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	
	//ox 우승자 추가
	public int insertWinner(Connection con, int userNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWinner");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNum);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
