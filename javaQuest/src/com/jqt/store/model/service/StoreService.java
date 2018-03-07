package com.jqt.store.model.service;

import static com.jqt.common.JDBCTemplet.close;
import static com.jqt.common.JDBCTemplet.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.store.model.dao.StoreDao;
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

}
