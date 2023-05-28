package com.javalec.shop.dto;

public class UserDto {
	
	String uid;
	String uPassword;
	String uName;
	String uPhone;
	String uAddress;
	String uEmail;
	String uInsertDate;
	String uUpdateDate;
	boolean uSecessionStatus; 
	
	public UserDto() {
		// TODO Auto-generated constructor stub
	}
	
	public UserDto(String uid, String uPassword, String uName, String uPhone, String uAddress, String uEmail,
			String uInsertDate) {
		super();
		this.uid = uid;
		this.uPassword = uPassword;
		this.uName = uName;
		this.uPhone = uPhone;
		this.uAddress = uAddress;
		this.uEmail = uEmail;
		this.uInsertDate = uInsertDate;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuInsertDate() {
		return uInsertDate;
	}

	public void setuInsertDate(String uInsertDate) {
		this.uInsertDate = uInsertDate;
	}

	public String getuUpdateDate() {
		return uUpdateDate;
	}

	public void setuUpdateDate(String uUpdateDate) {
		this.uUpdateDate = uUpdateDate;
	}

	public boolean isuSecessionStatus() {
		return uSecessionStatus;
	}

	public void setuSecessionStatus(boolean uSecessionStatus) {
		this.uSecessionStatus = uSecessionStatus;
	}
	
	

}
