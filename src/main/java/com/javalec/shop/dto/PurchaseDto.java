package com.javalec.shop.dto;

public class PurchaseDto {
	
	String uid;
	String uPhone;
	String uName;
	String uAddress;
	String pcNo;
	String pImage;
	String pCode;
	String pBrandName;
	String pPrice;
	String pSize;
	String pcQty;
	String pcInsertDate;
	
	
	
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


	


	public PurchaseDto(String pcNo, String pImage, String pCode, String pBrandName, String pPrice, String pSize,
			String pcQty, String pcInsertDate) {
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


	public String getPcNo() {
		return pcNo;
	}


	public void setPcNo(String pcNo) {
		this.pcNo = pcNo;
	}


	public String getpImage() {
		return pImage;
	}


	public void setpImage(String pImage) {
		this.pImage = pImage;
	}


	public String getpCode() {
		return pCode;
	}


	public void setpCode(String pCode) {
		this.pCode = pCode;
	}


	public String getpBrandName() {
		return pBrandName;
	}


	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}


	public String getpPrice() {
		return pPrice;
	}


	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
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


	public String getPcInsertDate() {
		return pcInsertDate;
	}


	public void setPcInsertDate(String pcInsertDate) {
		this.pcInsertDate = pcInsertDate;
	}


	

	
	
	
	
	
}//END
