package com.jqt.company.model.service;

import static com.jqt.common.JDBCTemplet.close;
import static com.jqt.common.JDBCTemplet.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.company.model.dao.CompanyDao;
import com.jqt.company.model.vo.Company;

public class CompanyService {

	public ArrayList<Company> selectList() {
		Connection con = getConnection();
		
		ArrayList<Company> list = new CompanyDao().selectList(con);
		
		close(con);
		
		return list;
	}

}
