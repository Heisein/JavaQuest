package com.jqt.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.board.model.dao.boardDao;
import com.jqt.board.model.vo.board;

import static com.jqt.common.JDBCTemplet.*;
public class boardService {
	//공지사항 셀렉트
	public ArrayList<board> selectqaa(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<board> list = new boardDao().selectqaa(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertqaa(board m) {
		Connection con = getConnection();
		
		int result = new boardDao().insertqaa(con,m);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public board selectOne(String num) {
		Connection con = getConnection();
		
		board n = new boardDao().selectOne(con,num);
		
		if(n != null) {
			
			int result = new boardDao().updateCount(con, n.getBno());
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		return n;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new boardDao().getListCount(con);
		
		return listCount;
	}

	public ArrayList<board> insertReply(board b) {
		Connection con = getConnection();
		ArrayList<board> replyList = null;
		
		int result = new boardDao().insertReply(con,b);
		
		if(result>0) {
			commit(con);
			replyList = new boardDao().selectReply(con,b.getBid());
		}else {
			rollback(con);
		}
		close(con);
		return replyList;
	}

	public ArrayList<board> selectFb(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<board> list = new boardDao().selectFb(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertFb(board m) {
		Connection con = getConnection();
		
		int result = new boardDao().insertFb(con,m);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;

	}

	public board selectOnebd(String num) {
		Connection con = getConnection();
		board n = new boardDao().selectOnebd(con,num);
		
		if(n != null) {
			int result = new boardDao().updateCount(con, n.getBno());
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		return n;
	}

	public ArrayList<board> selectReply(board b) {
		Connection con = getConnection();
		ArrayList<board> list = new boardDao().selectReply(con, b.getBid());
		
		close(con);
		
		return list;
	}

	public ArrayList<board> selectQuestion(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<board> list = new boardDao().selectQuestion(con,currentPage,limit);
		
		close(con);
		
		return list;
	}

	public int inserquestion(board m) {
		Connection con = getConnection();
		int result = new boardDao().insertquestion(con,m);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public board selectOneQuestion(String num) {
		Connection con = getConnection();
		board n = new boardDao().selectOneQuestion(con,num);
		if(n != null) {
			int result = new boardDao().updateCount(con, n.getBno());
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		return n;
	}

}
