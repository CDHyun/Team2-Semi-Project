package com.javalec.shop.dto;

public class CartDto {
	int cNo;
	String uid;
	String pName;
	String pBrand;
	int pPrice;
	int pCode;
	int cQty;
	String pSize;
	
	public CartDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	
	
	
	
	
	
	public CartDto(int cNo, String pName, String pBrand, int pPrice, int pCode,String pSize) {
		super();
		this.cNo = cNo;
		this.pName = pName;
		this.pBrand = pBrand;
		this.pPrice = pPrice;
		this.pCode = pCode;
	}









	public CartDto(int cNo, String uid, int pCode, int cQty, String pName, String pBrand ,int pPrice) {
		super();
		this.cNo = cNo;
		this.uid = uid;
		this.pName = pName;
		this.pBrand = pBrand;
		this.pPrice = pPrice;
		this.pCode = pCode;
		this.cQty = cQty;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpBrand() {
		return pBrand;
	}

	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public int getcQty() {
		return cQty;
	}

	public void setcQty(int cQty) {
		this.cQty = cQty;
	}









	public String getpSize() {
		return pSize;
	}









	public void setpSize(String pSize) {
		this.pSize = pSize;
	}
	
	
}
	