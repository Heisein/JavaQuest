package com.jqt.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.board.model.dao.BoardDao;
import com.jqt.board.model.vo.Board;

import static com.jqt.common.JDBCTemplet.*;
public class BoardService {
	//공지사항 셀렉트
	public ArrayList<Board> selectqaa(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectqaa(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertqaa(Board m) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertqaa(con,m);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
	
	public Board selectOne(String num) {
		Connection con = getConnection();
		
		Board n = new BoardDao().selectOne(con,num);
		
		ArrayList<String> list = new BoardDao().likeList(con,num,n.getBtype());
		System.out.println("like리스트:" +list);
		n.setBcount3(list);
		
		if(n != null) {
			int result = new BoardDao().updateCount(con, n.getBno());
			
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
		
		int listCount = new BoardDao().getListCount(con);
		
		return listCount;
	}
	public int getListCount1() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount1(con);
		
		return listCount;
	}
	public int getListCount2() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount2(con);
		
		return listCount;
	}

	public ArrayList<Board> insertReply(Board b) {
		Connection con = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().insertReply(con,b);
		
		if(result>0) {
			commit(con);
			replyList = new BoardDao().selectReply(con,b.getBid());
		}else {
			rollback(con);
		}
		close(con);
		return replyList;
	}

	public ArrayList<Board> selectFb(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectFb(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int insertFb(Board m) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertFb(con,m);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;

	}

	public Board selectOnebd(String num) {
		Connection con = getConnection();
		Board n = new BoardDao().selectOnebd(con,num);
		
		if(n != null) {
			int result = new BoardDao().updateCount(con, n.getBno());
			
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		return n;
	}

	public ArrayList<Board> selectReply(Board b) {
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectReply(con, b.getBid());
		
		close(con);
		
		return list;
	}

	public int selectCountReply(int ref_bid) {
		Connection con = getConnection();
		int result = new BoardDao().selectCountReply(con, ref_bid);
		
		close(con);
		
		return result;
	}
	
	public ArrayList<Board> selectQuestion(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectQuestion(con,currentPage,limit);
		
		close(con);
		
		return list;
	}

	public int inserquestion(Board m) {
		Connection con = getConnection();
		int result = new BoardDao().insertquestion(con,m);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Board selectOneQuestion(String num) {
		Connection con = getConnection();
		Board n = new BoardDao().selectOneQuestion(con,num);
		if(n != null) {
			int result = new BoardDao().updateCount(con, n.getBno());
			if(result>0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		
		return n;
	}

	public int insertreported(Board n) {
		Connection con = getConnection();
		int result = new BoardDao().insertreported(con,n);
		System.out.println("서비스:"+result);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}




}
