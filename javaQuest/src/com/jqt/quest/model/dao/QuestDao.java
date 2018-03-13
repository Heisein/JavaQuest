package com.jqt.quest.model.dao;

import static com.jqt.common.JDBCTemplet.close;

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

import com.jqt.member.model.vo.Member;
import com.jqt.quest.model.vo.Quest;

public class QuestDao {
private Properties prop = new Properties();
	
	public QuestDao(){
		String fileName = QuestDao.class.getResource("/sql/quest/quest-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Quest> selectList(Connection con) {
		ArrayList<Quest> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectQuestAll");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Quest>();
			
			while(rset.next()){
				Quest q = new Quest();
				q.setQuestId(rset.getInt("quest_id"));
				q.setQuestType(rset.getInt("quest_type"));
				q.setQuestNo(rset.getInt("quest_no"));
				q.setQuestName(rset.getString("quest_name"));
				q.setQuestLevel(rset.getInt("quest_level"));
				q.setQuestContents(rset.getString("quest_contents"));
				q.setQuestWriter(rset.getString("user_nickname"));
				q.setDefaultCode(rset.getString("default_code"));
				q.setRewardExp(rset.getInt("reward_exp"));
				q.setUploadDate(rset.getDate("upload_date"));
				q.setQuestName(rset.getString("quest_name"));
				q.setColor(rset.getString("color"));
				
				list.add(q);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	public Quest selectOne(Connection con, int qid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Quest q = null;

		String query = prop.getProperty("selectQuestOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qid);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				q = new Quest();
				
				q.setQuestId(rset.getInt("quest_id"));
				q.setQuestType(rset.getInt("quest_type"));
				q.setQuestNo(rset.getInt("quest_no"));
				q.setQuestName(rset.getString("quest_name"));
				q.setQuestLevel(rset.getInt("quest_level"));
				q.setQuestContents(rset.getString("quest_contents"));
				q.setQuestWriter(rset.getString("user_nickname"));
				q.setDefaultCode(rset.getString("default_code"));
				q.setRewardExp(rset.getInt("reward_exp"));
				q.setUploadDate(rset.getDate("upload_date"));
				q.setQuestAnswer(rset.getString("quest_answer"));
				q.setColor(rset.getString("color"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return q;
	}

	public int insertRequest(Connection con, Quest q) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertRequest");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(q.getQuestWriter()));
			pstmt.setString(2, q.getQuestName());
			pstmt.setInt(3, 1);
			pstmt.setString(4, q.getQuestContents());
			pstmt.setString(5, q.getDefaultCode());
			pstmt.setString(6, q.getQuestAnswer());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Quest> selectRequestList(Connection con) {
		ArrayList<Quest> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectRequestAll");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Quest>();
			
			while(rset.next()){
				Quest q = new Quest();

				q.setQuestId(rset.getInt("request_num"));
				q.setQuestName(rset.getString("quest_name"));
				q.setQuestLevel(rset.getInt("quest_level"));
				q.setQuestContents(rset.getString("quest_contents"));
				q.setQuestWriter(rset.getString("user_nickname"));
				q.setDefaultCode(rset.getString("default_code"));
				q.setQuestAnswer(rset.getString("quest_answer"));
				q.setUploadDate(rset.getDate("request_date"));
				q.setColor(rset.getString("color"));
				
				list.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		return list;
	}

	public int insertRequestToQuest(Connection con, int rnum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("insertRequestToQuest");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, rnum);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public int deleteRequest(Connection con, int rnum) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = prop.getProperty("deleteRequest");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, rnum);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}

	public Quest selectRequestOne(Connection con, int rnum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Quest q = null;

		String query = prop.getProperty("selectRequestOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, rnum);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				q = new Quest();
				
				q.setQuestId(rset.getInt("request_num"));
				q.setQuestName(rset.getString("quest_name"));
				q.setQuestLevel(rset.getInt("quest_level"));
				q.setQuestContents(rset.getString("quest_contents"));
				q.setQuestWriter(rset.getString("user_nickname"));
				q.setDefaultCode(rset.getString("default_code"));
				q.setQuestAnswer(rset.getString("quest_answer"));
				q.setUploadDate(rset.getDate("request_date"));
				q.setColor(rset.getString("color"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return q;
	}
	
	public int questResult(Connection con, Quest q, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		//먼저 퀘스트 이력부터 추가한다
		String query = prop.getProperty("insertQuestResume");
		//유저 경험치도 증가시켜준다
		String query2 = prop.getProperty("updateUserExp");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, q.getQuestId());
			pstmt.setInt(2, q.getQuestType());
			pstmt.setInt(3, m.getUserNum());
			
			result = pstmt.executeUpdate();
			
			close(pstmt);
			
			if(result > 0){
				pstmt = con.prepareStatement(query2);
				
				pstmt.setInt(1, q.getRewardExp());
				pstmt.setInt(2, m.getUserNum());
				pstmt.setInt(3, m.getUserNum());
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}
		
		return result;
	}
}
