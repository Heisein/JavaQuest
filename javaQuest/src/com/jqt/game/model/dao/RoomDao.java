package com.jqt.game.model.dao;

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

import com.jqt.game.model.vo.Room;

import static com.jqt.common.JDBCTemplet.*;

public class RoomDao {

	private Properties prop = new Properties();
	
	public RoomDao(){
		String fileName = RoomDao.class.getResource("/sql/game/oxGame.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//방 생성 메소드
	public int insertRoom(Connection con, String title) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRoom");
		System.out.println("insertRoom query : " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//생성된 방 번호 리턴용 메소드
	public int selectRoomNumber(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectRoomNumber");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				result = rset.getInt(1);
				
				System.out.println("Dao RoomNumber : " + result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	
	//생성 된 방정보 리턴용 메소드
	public Room selectRoomInfo(Connection con, int roomNumber) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Room room = null;
		
		String query = prop.getProperty("selectRoomInfo");
		System.out.println("selectRoomInfo query : " + query);
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, roomNumber);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				room = new Room();
				room.setRoomNo(String.valueOf(rset.getInt("ROOM_NO")));
				room.setRoomTitle(rset.getString("ROOM_TITLE"));
				room.setPresentNo(String.valueOf(rset.getInt("PRESENT_NO")));
				room.setTotal(String.valueOf(rset.getInt("TOTAL")));
				
				System.out.println("생성된 방 정보 : " + room);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		return room;
	}

	//방 전체 조회용 메소드
	public ArrayList<Room> allList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Room> list = null;
		
		String query = prop.getProperty("allList");
		System.out.println("allList query : " + query);
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Room>();
			while(rset.next()){
				Room r = new Room();
				
				r.setRoomNo(String.valueOf(rset.getInt("room_no")));
				r.setRoomTitle(rset.getString("room_title"));
				r.setPresentNo(String.valueOf(rset.getInt("PRESENT_NO")));
				r.setTotal(String.valueOf(rset.getInt("TOTAL")));
				r.setStarted(String.valueOf(rset.getInt("STARTED")));
				
				list.add(r);
			}
			System.out.println("allList : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	
	//방 인원 조회
	public int personnelCheck(Connection con, String roomNumber) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int presentPersonnel = 0;
		
		String query = prop.getProperty("personnelCheck");
		System.out.println("personnelCheck roomNumber : " + roomNumber);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(roomNumber));
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				//해당방의 인원수를 받아옴
				presentPersonnel = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return presentPersonnel;
	}
	

	//방 인원 증가용 메소드
	public int upCount(Connection con, String roomNumber) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("upCount");
		System.out.println("upCount query : " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(roomNumber));
			pstmt.setInt(2, Integer.parseInt(roomNumber));
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//방 삭제용 메소드
	public int deleteRoom(Connection con, String roomNumber) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteRoom");
		
		System.out.println("deleteRoom query : " + query);
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(roomNumber));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//방 인원 감소
	public int minusCount(Connection con, int minus) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("downCount");
		System.out.println("downCount query : " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, minus);
			pstmt.setInt(2, minus);
		
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int roomStart(Connection con, String roomNumber) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("roomStart");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(roomNumber));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	


	
	
}