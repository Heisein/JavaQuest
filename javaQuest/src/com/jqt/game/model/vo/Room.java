package com.jqt.game.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.Session;

public class Room implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1788551581014500820L;
	
	String roomNo;
	String roomTitle;
	String presentNo;
	String total;
	String started;
	
	public Room(){}
	
	public Room(String roomNo, String roomTitle, String presentNo, String total, String started){
		this.roomNo = roomNo;
		this.roomTitle = roomTitle;
		this.presentNo = presentNo;
		this.total = total;
		this.started = started;
	}
	
	public void setRoomNo(String roomNo){
		this.roomNo = roomNo;
	}
	
	public void setRoomTitle(String roomTitle){
		this.roomTitle = roomTitle;
	}
	
	public void setPresentNo(String presentNo){
		this.presentNo = presentNo;
	}
	
	public void setTotal(String total){
		this.total = total;
	}
	
	public void setStarted(String started){
		this.started = started;
	}
	
	public String getRoomNo(){
		return roomNo;
	}
	
	public String getRoomTitle(){
		return roomTitle;
	}
	
	public String getPresentNo(){
		return presentNo;
	}
	
	public String getTotal(){
		return total;
	}
	
	public String getStarted(){
		return started;
	}

	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", roomTitle=" + roomTitle + ", presentNo=" + presentNo + ", total=" + total + ", started=" + started
				+ "]";
	}
	
	
	
}
