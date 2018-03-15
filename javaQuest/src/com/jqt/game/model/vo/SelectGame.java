package com.jqt.game.model.vo;

public class SelectGame {
	//사지선다 게임과, Ox퀴즈 게임용 vo
	private int quizNo;
	private String quizContent;
	private String quizChoice;
	private String quizAnswer;
	
	public SelectGame(){}
	
	public SelectGame(int quizNo, String quizContent, String quizChoice, String quizAnswer) {
		super();
		this.quizNo = quizNo;
		this.quizContent = quizContent;
		this.quizChoice = quizChoice;
		this.quizAnswer = quizAnswer;
	}

	public int getQuizNo() {
		return quizNo;
	}

	public String getQuizContent() {
		return quizContent;
	}

	public String getQuizChoice() {
		return quizChoice;
	}

	public String getQuizAnswer() {
		return quizAnswer;
	}

	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
	}

	public void setQuizContent(String quizContent) {
		this.quizContent = quizContent;
	}

	public void setQuizChoice(String quizChoice) {
		this.quizChoice = quizChoice;
	}

	public void setQuizAnswer(String quizAnswer) {
		this.quizAnswer = quizAnswer;
	}

	@Override
	public String toString() {
		return "SelectGame [quizNo=" + quizNo + ", quizContent=" + quizContent + ", quizChoice=" + quizChoice
				+ ", quizAnswer=" + quizAnswer + "]";
	}
	
	
	
	
	
}
