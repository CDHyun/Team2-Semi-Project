package com.javalec.shop.dto;

public class adminDto {

	String aid;
	String aPassword;
	
	String pImage;
	int pCode;
	String pBrandName;
	String pName;
	int pPrice;
	String pSize;
	
	
	
	
	public adminDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	public adminDto(String aid, String aPassword) {
		super();
		this.aid = aid;
		this.aPassword = aPassword;
	}




	public adminDto(String pImage, int pCode, String pBrandName, String pName, int pPrice,
			String pSize) {
		super();
		this.pImage = pImage;
		this.pCode = pCode;
		this.pBrandName = pBrandName;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pSize = pSize;
	}



	public String getpImage() {
		return pImage;
	}



	public void setpImage(String pImage) {
		this.pImage = pImage;
	}



	public int getpCode() {
		return pCode;
	}



	public void setpCode(int pCode) {
		this.pCode = pCode;
	}



	public String getpBrandName() {
		return pBrandName;
	}



	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}



	public String getpName() {
		return pName;
	}



	public void setpName(String pName) {
		this.pName = pName;
	}



	public int getpPrice() {
		return pPrice;
	}



	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}



	public String getpSize() {
		return pSize;
	}



	public void setpSize(String pSize) {
		this.pSize = pSize;
	}



	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getaPassword() {
		return aPassword;
	}

	public void setaPassword(String aPassword) {
		this.aPassword = aPassword;
	}
	
	
}
