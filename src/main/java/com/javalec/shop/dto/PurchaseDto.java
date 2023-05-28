package com.javalec.shop.dto;

import java.sql.Timestamp;

public class PurchaseDto {
	
	String uid;
	String uPhone;
	String uName;
	String uAddress;
	int pcNo;
	String pImage;
	int pCode;
	String pBrandName;
	int pPrice;
	String pSize;
	int pcQty;
	Timestamp pcInsertDate;
	int pStock;
	
	
	
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




	public PurchaseDto(int pcNo, String pImage, int pCode, String pBrandName, int pPrice, String pSize, int pcQty,
			Timestamp pcInsertDate) {
		super();
		this.pcNo = pcNo;
		this.pImage = pImage;
		this.pCode = pCode;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
		this.pSize = pSize;
		this.pcQty = pcQty;
		this.pcInsertDate = pcInsertDate;
	}


	public PurchaseDto(int pStock) {
		super();
		this.pStock = pStock;
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


	public int getPcNo() {
		return pcNo;
	}


	public void setPcNo(int pcNo) {
		this.pcNo = pcNo;
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


	public int getPcQty() {
		return pcQty;
	}


	public void setPcQty(int pcQty) {
		this.pcQty = pcQty;
	}


	public Timestamp getPcInsertDate() {
		return pcInsertDate;
	}


	public void setPcInsertDate(Timestamp pcInsertDate) {
		this.pcInsertDate = pcInsertDate;
	}


	public int getpStock() {
		return pStock;
	}


	public void setpStock(int pStock) {
		this.pStock = pStock;
	}
	
	
	


	

	
	
}//END
