package com.jqt.game.model.service;

import static com.jqt.common.JDBCTemplet.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.jqt.game.model.dao.RoomDao;
import com.jqt.game.model.vo.Room;
public class RoomService {

	//방 생성 메소드
	public Room insertRoom(String title) {
		Connection con = getConnection();
		Room room = null;
		int result = new RoomDao().insertRoom(con, title);
		
		if(result > 0){
			commit(con);
			//방 번호를 가져오기위해 한번더 dao로 ㄱㄱ
			result = new RoomDao().selectRoomNumber(con);
			
			System.out.println("생성된 방 번호 : " + result);

			room = new RoomDao().selectRoomInfo(con, result);
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return room;
	}

	//방 전체 조회 메소드
	public ArrayList<Room> allList() {
		Connection con = getConnection();
		
		ArrayList<Room> list = new RoomDao().allList(con);
			
		close(con);
		
		return list;
	}

	//방 인원 증가용 메소드
	public int upCount(String roomNumber) {
		Connection con = getConnection();
		int result = 0;
		System.out.println("roomService upCount roomNumber : " + roomNumber);
		
		//해당방의 인원수를 받음
		result = new RoomDao().personnelCheck(con, roomNumber);
		
		//해당 방 카운트 증가
		result = new RoomDao().upCount(con, roomNumber);
		
		if(result > 0){
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	
	//방 인원 감소용 메소드
	public int minusCount(String roomNumber) {
		Connection con = getConnection();
		int present = 0;
		int result = new RoomDao().minusCount(con, Integer.parseInt(roomNumber));
		
		if(result > 0){
			commit(con);
			present = new RoomDao().personnelCheck(con, roomNumber);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return present;
	}
	
	//방 삭제용 메소드
	public void deleteRoom(String roomNumber) {
		Connection con = getConnection();
		
		System.out.println("deleteRoom roomNumber : " + roomNumber);
		
		int result = new RoomDao().deleteRoom(con, roomNumber);
		
		if(result > 0){
			commit(con);
			System.out.println("삭제 성공");
		}else {
			rollback(con);
		}
		
		close(con);
	
	}

	public int roomStart(String roomNumber) {
		Connection con = getConnection();
		
		int result = new RoomDao().roomStart(con, roomNumber);
		
		if(result > 0){
			commit(con);
			System.out.println("게임 시작됨.");
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	

}
