package com.jqt.company.model.dao;

import static com.jqt.common.JDBCTemplet.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.jqt.company.model.vo.Company;
import com.jqt.quest.model.dao.QuestDao;
import com.jqt.quest.model.vo.Quest;

public class CompanyDao {
	private Properties prop = new Properties();
	
	public CompanyDao(){
		String fileName = QuestDao.class.getResource("/sql/company/company-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Company> selectList(Connection con) {
		ArrayList<Company> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectCompanyAll");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Company>();
			
			while(rset.next()){
				Company c = new Company();
				c.setCompanyCode(rset.getString("COMPANY_CODE"));
				c.setCompanyname(rset.getString("COMPANY_NAME"));
				c.setCeoName(rset.getString("CEO_NAME"));
				c.setAddress(rset.getString("ADDRESS"));
				c.setImformation(rset.getString("INFORMATION"));
				c.setCategory(rset.getString("category"));
				c.setContantAddress(rset.getString("CONTACT_ADDRESS"));
				c.setEmployeeNumber(rset.getInt("EMPLOYEE_NUMBER"));
				c.setUserNum(rset.getInt("USER_NUM"));
				
				list.add(c);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

}
