package com.jqt.quest.model.vo;

import java.sql.Date;

public class Quest {
	private int questId;
	private int questType;
	private int questNo;
	private String questName;
	private int questLevel;
	private String questContents;
	private String questWriter;
	private String defaultCode;
	private int rewardExp;
	private Date uploadDate;
	private String questAnswer;
	private String color;
	private int cleared;

	public Quest() {
	}

	public Quest(int questId, int questType, int questNo, String questName, int questLevel, String questContents,
			String questWriter, String defaultCode, int rewardExp, Date uploadDate, String questAnswer, String color, int cleared) {
		super();
		this.questId = questId;
		this.questType = questType;
		this.questNo = questNo;
		this.questName = questName;
		this.questLevel = questLevel;
		this.questContents = questContents;
		this.questWriter = questWriter;
		this.defaultCode = defaultCode;
		this.rewardExp = rewardExp;
		this.uploadDate = uploadDate;
		this.questAnswer = questAnswer;
		this.color = color;
		this.cleared = cleared;
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

	public int getQuestNo() {
		return questNo;
	}

	public void setQuestNo(int questNo) {
		this.questNo = questNo;
	}

	public String getQuestName() {
		return questName;
	}

	public void setQuestName(String questName) {
		this.questName = questName;
	}

	public int getQuestLevel() {
		return questLevel;
	}

	public void setQuestLevel(int questLevel) {
		this.questLevel = questLevel;
	}

	public String getQuestContents() {
		return questContents;
	}

	public void setQuestContents(String questContents) {
		this.questContents = questContents;
	}

	public String getQuestWriter() {
		return questWriter;
	}

	public void setQuestWriter(String questWriter) {
		this.questWriter = questWriter;
	}

	public String getDefaultCode() {
		return defaultCode;
	}

	public void setDefaultCode(String defaultCode) {
		this.defaultCode = defaultCode;
	}

	public int getRewardExp() {
		return rewardExp;
	}

	public void setRewardExp(int rewardExp) {
		this.rewardExp = rewardExp;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getQuestAnswer() {
		return questAnswer;
	}

	public void setQuestAnswer(String questAnswer) {
		this.questAnswer = questAnswer;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	public int getCleared() {
		return cleared;
	}

	public void setCleared(int cleared) {
		this.cleared = cleared;
	}

	@Override
	public String toString() {
		return "Quest [questId=" + questId + ", questType=" + questType + ", questNo=" + questNo + ", questName="
				+ questName + ", questLevel=" + questLevel + ", questContents=" + questContents + ", questWriter="
				+ questWriter + ", defaultCode=" + defaultCode + ", rewardExp=" + rewardExp + ", uploadDate="
				+ uploadDate + ", questAnswer=" + questAnswer + ", color=" + color + ", cleared=" + cleared + "]";
	}
	
}
