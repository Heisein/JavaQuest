package com.jqt.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.board.model.dao.boardDao;
import com.jqt.board.model.vo.board;

import static com.jqt.common.JDBCTemplet.*;
public class boardService {
	//공지사항 셀렉트
	public ArrayList<board> selectqaa() {
		Connection con = getConnection();
		
		ArrayList<board> list = new boardDao().selectqaa(con);
		
		close(con);
		
		return list;
	}

}
