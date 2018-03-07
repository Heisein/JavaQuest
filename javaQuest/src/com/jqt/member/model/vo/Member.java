package com.jqt.member.model.vo;

import java.sql.Date;

public class Member {
	private int userNum;
	private String userId;
	private String userPwd;
	private String nickName;
	private String email;
	private String phone;
	private int exp;
	private int type;
	private String msg;
	private String isIdentified;
	private String lastIp;
	private Date enrollDate;
	private String isWithdraw;

	public Member() {
	}

	public Member(int userNum, String userId, String userPwd, String nickName, String email, String phone, int exp,
			int type, String msg, String isIdentified, String lastIp, Date enrollDate, String isWithdraw) {
		super();
		this.userNum = userNum;
		this.userId = userId;
		this.userPwd = userPwd;
		this.nickName = nickName;
		this.email = email;
		this.phone = phone;
		this.exp = exp;
		this.type = type;
		this.msg = msg;
		this.isIdentified = isIdentified;
		this.lastIp = lastIp;
		this.enrollDate = enrollDate;
		this.isWithdraw = isWithdraw;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getIsIdentified() {
		return isIdentified;
	}

	public void setIsIdentified(String isIdentified) {
		this.isIdentified = isIdentified;
	}

	public String getLastIp() {
		return lastIp;
	}

	public void setLastIp(String lastIp) {
		this.lastIp = lastIp;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getIsWithdraw() {
		return isWithdraw;
	}

	public void setIsWithdraw(String isWithdraw) {
		this.isWithdraw = isWithdraw;
	}

	@Override
	public String toString() {
		return "Member [userNum=" + userNum + ", userId=" + userId + ", userPwd=" + userPwd + ", nickName=" + nickName
				+ ", email=" + email + ", phone=" + phone + ", exp=" + exp + ", type=" + type + ", msg=" + msg
				+ ", isIdentified=" + isIdentified + ", lastIp=" + lastIp + ", enrollDate=" + enrollDate
				+ ", isWithdraw=" + isWithdraw + "]";
	}

}