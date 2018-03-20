package com.jqt.ranking.model.vo;

public class Ranking implements java.io.Serializable {
	private int rNum;
	private int userNum;
	private String userNickName;
	private int userLevel;
	private int userType;
	private String userMsg;
	private String isWithDraw;
	private int timeAttack;
	private int winRate;
	private int userExp;
	private int clearQuest;
	private int oxWin;
	private int quizTime;

	public Ranking() {
	}

	public Ranking(int rNum, int userNum, String userNickName, int userLevel, int userType, String userMsg,
			String isWithDraw, int timeAttack, int winRate, int userExp, int clearQuest, int oxWin, int quizTime) {
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
		this.userExp = userExp;
		this.clearQuest = clearQuest;
		this.oxWin = oxWin;
		this.quizTime = quizTime;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}

	public String getUserMsg() {
		return userMsg;
	}

	public void setUserMsg(String userMsg) {
		this.userMsg = userMsg;
	}

	public String getIsWithDraw() {
		return isWithDraw;
	}

	public void setIsWithDraw(String isWithDraw) {
		this.isWithDraw = isWithDraw;
	}

	public int getTimeAttack() {
		return timeAttack;
	}

	public void setTimeAttack(int timeAttack) {
		this.timeAttack = timeAttack;
	}

	public int getWinRate() {
		return winRate;
	}

	public void setWinRate(int winRate) {
		this.winRate = winRate;
	}

	public int getUserExp() {
		return userExp;
	}

	public void setUserExp(int userExp) {
		this.userExp = userExp;
	}

	public int getClearQuest() {
		return clearQuest;
	}

	public void setClearQuest(int clearQuest) {
		this.clearQuest = clearQuest;
	}

	public int getOxWin() {
		return oxWin;
	}

	public void setOxWin(int oxWin) {
		this.oxWin = oxWin;
	}

	public int getQuizTime() {
		return quizTime;
	}

	public void setQuizTime(int quizTime) {
		this.quizTime = quizTime;
	}

	@Override
	public String toString() {
		return "Ranking [rNum=" + rNum + ", userNum=" + userNum + ", userNickName=" + userNickName + ", userLevel="
				+ userLevel + ", userType=" + userType + ", userMsg=" + userMsg + ", isWithDraw=" + isWithDraw
				+ ", timeAttack=" + timeAttack + ", winRate=" + winRate + ", userExp=" + userExp + ", clearQuest="
				+ clearQuest + ", oxWin=" + oxWin + ", quizTime=" + quizTime + "]";
	}

}
