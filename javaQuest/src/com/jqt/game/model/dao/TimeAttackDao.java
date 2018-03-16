package com.jqt.game.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.jqt.common.JDBCTemplet.*;

public class TimeAttackDao {

	private Properties prop = new Properties();
	
	public TimeAttackDao(){
		String fileName = TimeAttackDao.class.getResource("/sql/game/timeAttackGame.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//기록 등록 메소드.
	public int insertRecord(Connection con, int record, int userNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRecord");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, userNum);
			pstmt.setInt(3, record);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int checkUser(Connection con, int quizId, int userNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, quizId);
			pstmt.setInt(2, userNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = 1;
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
