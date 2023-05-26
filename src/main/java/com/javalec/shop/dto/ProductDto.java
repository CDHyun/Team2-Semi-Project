package com.javalec.shop.dto;

import java.sql.Timestamp;

public class ProductDto {
	
	int pCode;
	String pName;
	String pBrandName;
	int pPrice;
	Timestamp pInsertDate;
	Timestamp pUpdateDate;
	Timestamp pDeleteDate;
	String pImage;
	
	
	
	
	
	
	
	public ProductDto() {
		// TODO Auto-generated constructor stub
	}





	
	
	


	public ProductDto(String pImage, int pCode, String pBrandName, String pName,int pPrice) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
		this.pImage = pImage;
	}










	public ProductDto(int pCode, String pName, String pBrandName, int pPrice, String pImage) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
		this.pImage = pImage;
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







	public String getpImage() {
		return pImage;
	}







	public void setpImage(String pImage) {
		this.pImage = pImage;
	}




	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}