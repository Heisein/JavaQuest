package com.jqt.store.model.dao;

import static com.jqt.common.JDBCTemplet.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.jqt.store.model.vo.PointProduct;
import com.sun.jndi.url.corbaname.corbanameURLContextFactory;

public class StoreDao {
	private Properties prop = new Properties();
	
	public StoreDao(){
		String fileName = StoreDao.class.getResource("/sql/store/store-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PointProduct> selectPointList(Connection con) {
		ArrayList<PointProduct> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPointList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<PointProduct>();

			while(rset.next()){
				PointProduct p = new PointProduct();
				
				p.setProductCode(rset.getInt("product_code"));
				p.setPrice(rset.getInt("price"));
				p.setGivePoint(rset.getInt("give_point"));

				list.add(p);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		
		return list;
	}

	public PointProduct selectOne(Connection con, int productCode) {
		PointProduct p = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectPointOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, productCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				p = new PointProduct();
				
				p.setProductCode(rset.getInt("product_code"));
				p.setPrice(rset.getInt("price"));
				p.setGivePoint(rset.getInt("give_point"));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
		}
		
		
		return p;
	}

}
