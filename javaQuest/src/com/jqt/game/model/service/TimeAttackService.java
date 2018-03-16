package com.jqt.game.model.service;

import java.sql.Connection;

import com.jqt.game.model.dao.TimeAttackDao;

import static com.jqt.common.JDBCTemplet.*;

public class TimeAttackService {
	
	//기록 등록하는 메소드
	public int insertRecord(int record, int userNum) {
		Connection con = getConnection();
		
		int result = new TimeAttackDao().insertRecord(con, record, userNum);
		
		if(result > 0){
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//그 주에 게임을 했는지 체크하는 메소드
	public int checkUser(int quizId, int userNum) {
		Connection con = getConnection();
		
		int result = new TimeAttackDao().checkUser(con, quizId, userNum);
		
		close(con);
		
		return result;
	}


}
