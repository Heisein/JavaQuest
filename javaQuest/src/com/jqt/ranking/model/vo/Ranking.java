package com.jqt.ranking.model.vo;

public class Ranking implements java.io.Serializable{
	private int rNum;
	private int userNum;
	private String userNickName;
	private int userLevel;
	private int userType;
	private String userMsg;
	private String isWithDraw;
	private int timeAttack;
	private int winRate;
	
	public Ranking(){}

	public Ranking(int rNum, int userNum, String userNickName, int userLevel, int userType, String userMsg,
			String isWithDraw, int timeAttack, int winRate) {
		super();
		this.rNum = rNum;
		this.userNum = userNum;
		this.userNickName = userNickName;
		this.userLevel = userLevel;
		this.userType = userType;
		this.userMsg = userMsg;
		this.isWithDraw = isWithDraw;
		this.timeAttack = timeAttack;
		this.winRate = winRate;
	}
	
	

	public Ranking(int rNum, int userNum, String userNickName, int userLevel, int userType, String userMsg,
			String isWithDraw) {
		super();
		this.rNum = rNum;
		this.userNum = userNum;
		this.userNickName = userNickName;
		this.userLevel = userLevel;
		this.userType = userType;
		this.userMsg = userMsg;
		this.isWithDraw = isWithDraw;
	}
	

	public Ranking(int rNum, int userNum, String userNickName, int userType, String userMsg, String isWithDraw,
			int timeAttack) {
		super();
		this.rNum = rNum;
		this.userNum = userNum;
		this.userNickName = userNickName;
		this.userType = userType;
		this.userMsg = userMsg;
		this.isWithDraw = isWithDraw;
		this.timeAttack = timeAttack;
	}
	

	public Ranking(int rNum, int userNum, String userNickName, String userMsg, int winRate) {
		super();
		this.rNum = rNum;
		this.userNum = userNum;
		this.userNickName = userNickName;
		this.userMsg = userMsg;
		this.winRate = winRate;
	}

	public int getrNum() {
		return rNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public int getUserType() {
		return userType;
	}

	public String getUserMsg() {
		return userMsg;
	}

	public String getIsWithDraw() {
		return isWithDraw;
	}

	public int getTimeAttack() {
		return timeAttack;
	}

	public int getWinRate() {
		return winRate;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public void setUserMsg(String userMsg) {
		this.userMsg = userMsg;
	}

	public void setIsWithDraw(String isWithDraw) {
		this.isWithDraw = isWithDraw;
	}

	public void setTimeAttack(int timeAttack) {
		this.timeAttack = timeAttack;
	}

	public void setWinRate(int winRate) {
		this.winRate = winRate;
	}

	@Override
	public String toString() {
		return "Ranking [rNum=" + rNum + ", userNum=" + userNum + ", userNickName=" + userNickName + ", userLever="
				+ userLevel + ", userType=" + userType + ", userMsg=" + userMsg + ", isWithDraw=" + isWithDraw
				+ ", timeAttack=" + timeAttack + ", winRate=" + winRate + "]";
	}
	
	
	
}
