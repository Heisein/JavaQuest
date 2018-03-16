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

}
