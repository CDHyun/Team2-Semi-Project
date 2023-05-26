package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.shop.dto.PurchaseDto;

public class PurchaseDao {

//Field
	String uid;
	String uPhone;
	String uName;
	String uAddress;
	String pBrandName;
	String pSize;
	String pcQty;
	String pPrice;
	
	DataSource dataSource;
	
	public PurchaseDao() {
		// TODO Auto-generated constructor stub
	
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jazz");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<PurchaseDto> purchase(){
		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultset = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select uid, uPhone, uName, uAddress, pBrandName, pSize, pcQty, pPrice from jazz";
			preparedStatement = connection.prepareStatement(query);
			resultset = preparedStatement.executeQuery();
			
			while (resultset.next()) {
				int uid = resultset.getInt("uid");
				String uPhone = resultset.getString("uPhone");
				String uName = resultset.getString("uName");
				String uAddress = resultset.getString("uAddress");
				String pBrandName = resultset.getString("pBrandName");
				String pSize = resultset.getString("pSize");
				String pcQty = resultset.getString("pcQty");
				String pPrice = resultset.getString("pPrice");
				
				
				PurchaseDto dto = new PurchaseDto(query, uPhone, uName, uAddress, pBrandName, pSize, pcQty, pPrice);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultset != null) resultset.close();
				if(preparedStatement !=null)preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
			e.printStackTrace();
			}
		}
		
		return dtos;

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	} //END

