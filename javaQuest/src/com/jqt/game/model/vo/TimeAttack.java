package com.jqt.game.model.vo;

public class TimeAttack implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1909862952501061206L;
	
	private int recordNo;
	private int quizId;
	private int userNum;
	private int quizTime;
	
	public TimeAttack(){}

	public TimeAttack(int recordNo, int quizId, int userNum, int quizTime) {
		super();
		this.recordNo = recordNo;
		this.quizId = quizId;
		this.userNum = userNum;
		this.quizTime = quizTime;
	}

	public int getRecordNo() {
		return recordNo;
	}

	public int getQuizId() {
		return quizId;
	}

	public int getUserNum() {
		return userNum;
	}

	public int getQuizTime() {
		return quizTime;
	}

	public void setRecordNo(int recordNo) {
		this.recordNo = recordNo;
	}

	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public void setQuizTime(int quizTime) {
		this.quizTime = quizTime;
	}

	@Override
	public String toString() {
		return "TimeAttack [recordNo=" + recordNo + ", quizId=" + quizId + ", userNum=" + userNum + ", quizTime="
				+ quizTime + "]";
	}
	
	
}
