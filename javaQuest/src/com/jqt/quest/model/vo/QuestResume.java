package com.jqt.quest.model.vo;

import java.sql.Date;

public class QuestResume {
	private int questId;
	private int questType;
	private int userNum;
	private Date clearDate;
	
	public QuestResume(){}
	
	
	public QuestResume(int questId, int questType, int userNum, Date clearDate) {
		super();
		this.questId = questId;
		this.questType = questType;
		this.userNum = userNum;
		this.clearDate = clearDate;
	}

	public int getQuestId() {
		return questId;
	}

	public void setQuestId(int questId) {
		this.questId = questId;
	}

	public int getQuestType() {
		return questType;
	}

	public void setQuestType(int questType) {
		this.questType = questType;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public Date getClearDate() {
		return clearDate;
	}

	public void setClearDate(Date clearDate) {
		this.clearDate = clearDate;
	}
	
	
}
