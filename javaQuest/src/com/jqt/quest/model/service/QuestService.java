package com.jqt.quest.model.service;

import static com.jqt.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.quest.model.dao.QuestDao;
import com.jqt.quest.model.vo.Quest;

public class QuestService {

	public ArrayList<Quest> selectList() {
		Connection con = getConnection();
		
		ArrayList<Quest> list = new QuestDao().selectList(con);
		
		close(con);
		
		return list;
	}

	public Quest selectOne(int qid) {
		Connection con = getConnection();
		Quest b = null;

		b = new QuestDao().selectOne(con, qid);
		
		close(con);

		return b;
	}

	public int insertRequest(Quest q) {
		Connection con = getConnection();
		
		int result = new QuestDao().insertRequest(con, q);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Quest> selectRequestList() {
		Connection con = getConnection();
		
		ArrayList<Quest> list = new QuestDao().selectRequestList(con);
		
		close(con);
		
		return list;
	}

	public int insertRequestToQuest(int rnum) {
		Connection con = getConnection();
		
		int result = new QuestDao().insertRequestToQuest(con, rnum);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteRequest(int rnum) {
		Connection con = getConnection();
		
		int result = new QuestDao().deleteRequest(con, rnum);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
