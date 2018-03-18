package com.jqt.store.model.service;

import static com.jqt.common.JDBCTemplet.close;
import static com.jqt.common.JDBCTemplet.commit;
import static com.jqt.common.JDBCTemplet.getConnection;
import static com.jqt.common.JDBCTemplet.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.quest.model.dao.QuestDao;
import com.jqt.store.model.dao.StoreDao;
import com.jqt.store.model.vo.PayedResume;
import com.jqt.store.model.vo.PointProduct;

public class StoreService {

	public ArrayList<PointProduct> selectPointList() {
		Connection con = getConnection();

		ArrayList<PointProduct> list = new StoreDao().selectPointList(con);

		close(con);

		return list;
	}

	public PointProduct selectOne(int productCode) {
		Connection con = getConnection();
		
		PointProduct pp = new StoreDao().selectOne(con, productCode);
		
		close(con);
		
		return pp;
	}

	public int insertResume(PayedResume ps) {
		Connection con = getConnection();
		
		int result = new StoreDao().insertResume(con, ps);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<PayedResume> selectResumeList(int unum) {
		Connection con = getConnection();

		ArrayList<PayedResume> list = new StoreDao().selectPointList(con, unum);

		close(con);

		return list;
	}

	//ox 참여시 포인트 감소용 메소드
	public void joinPay(int userNum) {
		Connection con = getConnection();
		
		int result = new StoreDao().joinPay(con, userNum);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
	}

	//ox 우승시 보상 지급용 메소드
	public void reward(int userNum, int point) {
		Connection con = getConnection();
	
		int result = new StoreDao().reward(con, userNum, point);
		
		if(result > 0){
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
	}
	
	//ox 참여를 위한 point확인용 메소드
	public int pointCheck(int userNum) {
		Connection con = getConnection();
		
		int result = new StoreDao().pointCheck(con, userNum);
		
		close(con);
		
		return result;
	}

}
