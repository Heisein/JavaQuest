package com.jqt.store.model.vo;

public class PointProduct {
	private int productCode;
	private int price;
	private int givePoint;
	
	public PointProduct(){}

	public PointProduct(int productCode, int price, int givePoint) {
		super();
		this.productCode = productCode;
		this.price = price;
		this.givePoint = givePoint;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getGivePoint() {
		return givePoint;
	}

	public void setGivePoint(int givePoint) {
		this.givePoint = givePoint;
	}
	
	
}
