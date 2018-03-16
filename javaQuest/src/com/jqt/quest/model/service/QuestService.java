package com.jqt.quest.model.service;

import static com.jqt.common.JDBCTemplet.close;
import static com.jqt.common.JDBCTemplet.commit;
import static com.jqt.common.JDBCTemplet.getConnection;
import static com.jqt.common.JDBCTemplet.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.member.model.vo.Member;
import com.jqt.quest.model.dao.QuestDao;
import com.jqt.quest.model.vo.Quest;

public class QuestService {

	public ArrayList<Quest> selectList(int unum) {
		Connection con = getConnection();
		
		ArrayList<Quest> list = new QuestDao().selectList(con, unum);
		
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

	public Quest selectRequestOne(int rnum) {
		Connection con = getConnection();
		Quest q = null;

		q = new QuestDao().selectRequestOne(con, rnum);
		
		close(con);

		return q;
	}
	
	public int questResult(Quest q, Member m) {
		Connection con = getConnection();
		
		int result = new QuestDao().questResult(con, q, m);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
