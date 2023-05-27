package com.javalec.shop.dto;

public class PurchaseDto {
	
	String uid;
	String uPhone;
	String uName;
	String uAddress;
	

	
	public PurchaseDto() {
		// TODO Auto-generated constructor stub
	}


	public PurchaseDto(String uid, String uPhone, String uName, String uAddress) {
		super();
		this.uid = uid;
		this.uPhone = uPhone;
		this.uName = uName;
		this.uAddress = uAddress;
	
	}

	public PurchaseDto(String uPhone, String uName, String uAddress) {
		super();
		this.uPhone = uPhone;
		this.uName = uName;
		this.uAddress = uAddress;
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


	
	
	
	
	
	
	
	
	
	
	
	
}//END
