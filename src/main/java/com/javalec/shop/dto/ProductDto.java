package com.javalec.shop.dto;

import java.io.FileInputStream;
import java.sql.Timestamp;

public class ProductDto {
	
	int pCode;
	String pName;
	String pBrandName;
	int pPrice;
	Timestamp pInsertDate;
	Timestamp pUpdateDate;
	Timestamp pDeleteDate;
	String pImageName = "";
	
	FileInputStream pimage;
	
	
	
	
	
	
	
	public ProductDto() {
		// TODO Auto-generated constructor stub
	}




	
	



	public ProductDto(String pImageName, String pName, String pBrandName, int pPrice) {
		super();
		this.pImageName = pImageName;
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
	}
	public ProductDto( String pName, String pBrandName, int pPrice) {
		super();
		
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
	}




	




	public int getpCode() {
		return pCode;
	}







	public void setpCode(int pCode) {
		this.pCode = pCode;
	}







	public String getpName() {
		return pName;
	}







	public void setpName(String pName) {
		this.pName = pName;
	}







	public String getpBrandName() {
		return pBrandName;
	}







	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}







	public int getpPrice() {
		return pPrice;
	}







	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}







	public Timestamp getpInsertDate() {
		return pInsertDate;
	}







	public void setpInsertDate(Timestamp pInsertDate) {
		this.pInsertDate = pInsertDate;
	}







	public Timestamp getpUpdateDate() {
		return pUpdateDate;
	}







	public void setpUpdateDate(Timestamp pUpdateDate) {
		this.pUpdateDate = pUpdateDate;
	}







	public Timestamp getpDeleteDate() {
		return pDeleteDate;
	}







	public void setpDeleteDate(Timestamp pDeleteDate) {
		this.pDeleteDate = pDeleteDate;
	}







	public String getpImageName() {
		return pImageName;
	}







	public void setpImageName(String pImageName) {
		this.pImageName = pImageName;
	}







	public FileInputStream getPimage() {
		return pimage;
	}







	public void setPimage(FileInputStream pimage) {
		this.pimage = pimage;
	}
	
	

}
