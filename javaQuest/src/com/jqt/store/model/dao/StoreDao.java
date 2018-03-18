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

import com.jqt.store.model.vo.PayedResume;
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
			close(pstmt);
			close(rset);
		}
		
		
		return p;
	}

	public int insertResume(Connection con, PayedResume ps) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = prop.getProperty("insertResume");
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, ps.getUserNum());
				pstmt.setString(2, ps.getPayUid());
				pstmt.setInt(3, 1); // 결제성공여부 true
				pstmt.setString(4, ps.getPayMsg());
				pstmt.setInt(5, ps.getProductCode());
				pstmt.setInt(6, 1); // 1포인트 2상품
				pstmt.setInt(7, ps.getPointUpdown());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(pstmt);
			}
			
			return result;
		}

	public ArrayList<PayedResume> selectPointList(Connection con, int unum) {
			PayedResume pr = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<PayedResume> list = new ArrayList<PayedResume>();
			
			String query = prop.getProperty("selectResume");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, unum);
				pstmt.setInt(2, unum);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()){
					pr = new PayedResume();
					
					pr.setPayDay(rset.getDate("pay_day"));
					pr.setPayUid(rset.getString("pay_uid"));
					pr.setPointUpdown(rset.getInt("point_updown"));
					pr.setProductCode(rset.getInt("product_code"));
					pr.setProductType(rset.getInt("product_type"));
					pr.setPayMsg(rset.getString("product_name"));
					pr.setPrice(rset.getInt("price"));
					pr.setIsSuccess(rset.getInt("is_success"));
					pr.setUserNum(rset.getInt("user_num"));
					
					list.add(pr);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(pstmt);
				close(rset);
			}
			
			
			return list;
		}

	public int joinPay(Connection con, int userNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("joinPay");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNum);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int reward(Connection con, int userNum, int point) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("reward");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, point);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int pointCheck(Connection con, int userNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("pointCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				result = rset.getInt(1);
			} 
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
