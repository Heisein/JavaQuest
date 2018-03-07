package com.jqt.store.model.vo;

import java.sql.Date;

public class PayedResume {
	private int payNum;
	private int userNum;
	private String payUid;
	private int isSuccess;
	private String payMsg;
	private int productCode;
	private int productType;
	private int pointUpdown;
	private Date payDay;

	public PayedResume() {
	}

	public PayedResume(int payNum, int userNum, String payUid, int isSuccess, String payMsg, int productCode,
			int productType, int pointUpdown, Date payDay) {
		super();
		this.payNum = payNum;
		this.userNum = userNum;
		this.payUid = payUid;
		this.isSuccess = isSuccess;
		this.payMsg = payMsg;
		this.productCode = productCode;
		this.productType = productType;
		this.pointUpdown = pointUpdown;
		this.payDay = payDay;
	}

	public int getPayNum() {
		return payNum;
	}

	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getPayUid() {
		return payUid;
	}

	public void setPayUid(String payUid) {
		this.payUid = payUid;
	}

	public int getIsSuccess() {
		return isSuccess;
	}

	public void setIsSuccess(int isSuccess) {
		this.isSuccess = isSuccess;
	}

	public String getPayMsg() {
		return payMsg;
	}

	public void setPayMsg(String payMsg) {
		this.payMsg = payMsg;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	public int getPointUpdown() {
		return pointUpdown;
	}

	public void setPointUpdown(int pointUpdown) {
		this.pointUpdown = pointUpdown;
	}

	public Date getPayDay() {
		return payDay;
	}

	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}

}
