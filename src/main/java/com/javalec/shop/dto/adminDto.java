package com.javalec.shop.dto;

public class adminDto {

	String aid;
	String aPassword;
	
	public adminDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	public adminDto(String aid, String aPassword) {
		super();
		this.aid = aid;
		this.aPassword = aPassword;
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
