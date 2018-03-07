package com.jqt.board.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.jqt.board.model.vo.board;

public class boardDao {
	Properties prop = new Properties();
	
	public boardDao() {
		String fileName = boardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//공지사항 셀렉트~
	public ArrayList<board> selectqaa(Connection con) {
		ArrayList<board> list = null;
		Statement stmt =null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectqaa");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<board>();
			
			while(rset.next()) {
				board n = new board();
				n.setBno(rset.getInt("bno"));
				n.setBtitle(rset.getString("btitle"));
				n.setBwriter(rset.getInt("bwriter"));
				n.setBcount(rset.getInt("bcount"));
				n.setBdate(rset.getDate("bdate"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
