package com.jqt.company.model.vo;

public class Company {
	private String companyCode;
	private String companyname;
	private String ceoName;
	private int employeeNumber;
	private String address;
	private String category;
	private String imformation;
	private String contantAddress;
	private int userNum;

	public Company() {
	}

	public Company(String companyCode, String companyname, String ceoName, int employeeNumber, String address,
			String category, String imformation, String contantAddress, int userNum) {
		super();
		this.companyCode = companyCode;
		this.companyname = companyname;
		this.ceoName = ceoName;
		this.employeeNumber = employeeNumber;
		this.address = address;
		this.category = category;
		this.imformation = imformation;
		this.contantAddress = contantAddress;
		this.userNum = userNum;
	}

	public String getCompanyCode() {
		return companyCode;
	}

	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getCeoName() {
		return ceoName;
	}

	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}

	public int getEmployeeNumber() {
		return employeeNumber;
	}

	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImformation() {
		return imformation;
	}

	public void setImformation(String imformation) {
		this.imformation = imformation;
	}

	public String getContantAddress() {
		return contantAddress;
	}

	public void setContantAddress(String contantAddress) {
		this.contantAddress = contantAddress;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

}
