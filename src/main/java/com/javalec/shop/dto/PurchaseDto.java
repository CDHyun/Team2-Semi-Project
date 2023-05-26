package com.javalec.shop.dto;

public class PurchaseDto {
	
	String uid;
	String uPhone;
	String uName;
	String uAddress;
	String pBrandName;
	String pSize;
	String pcQty;
	String pPrice;

	
	public PurchaseDto() {
		// TODO Auto-generated constructor stub
	}


	public PurchaseDto(String uid, String uPhone, String uName, String uAddress, String pBrandName, String pSize,
			String pcQty, String pPrice) {
		super();
		this.uid = uid;
		this.uPhone = uPhone;
		this.uName = uName;
		this.uAddress = uAddress;
		this.pBrandName = pBrandName;
		this.pSize = pSize;
		this.pcQty = pcQty;
		this.pPrice = pPrice;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getuPhone() {
		return uPhone;
	}


	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}


	public String getuName() {
		return uName;
	}


	public void setuName(String uName) {
		this.uName = uName;
	}


	public String getuAddress() {
		return uAddress;
	}


	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}


	public String getpBrandName() {
		return pBrandName;
	}


	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}


	public String getpSize() {
		return pSize;
	}


	public void setpSize(String pSize) {
		this.pSize = pSize;
	}


	public String getPcQty() {
		return pcQty;
	}


	public void setPcQty(String pcQty) {
		this.pcQty = pcQty;
	}


	public String getpPrice() {
		return pPrice;
	}


	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//END
