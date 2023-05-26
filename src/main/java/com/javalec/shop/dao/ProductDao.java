package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.shop.dto.ProductDto;

public class ProductDao {
	DataSource dataSource;
	

	
	
	
	
	
	
	
	
	
	
	
	
	public ProductDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jazz");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<ProductDto> searchAction() {
//		if(queryName == null){ // 첫화면인 경우
//			queryName = "address";
//			queryContent = "";
//		}

		ArrayList<ProductDto> dtos = new ArrayList<ProductDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String WhereDefault = "select  pName, pBrandName, pPrice,pImage  from product";
			//String WhereDefault2 = " where " + queryName + " like '%" +queryContent + "%'";
			preparedStatement = connection.prepareStatement(WhereDefault);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String pName = resultSet.getString(1);
				String pBrandName = resultSet.getString(2);
				int pPrice = resultSet.getInt(3);
				String pImage = resultSet.getString(4);
			
				
			
				ProductDto dto = new ProductDto(pName, pBrandName, pPrice, pImage);
				dtos.add(dto);

			}
			
		}catch(Exception e) {

			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null){ // 무언가 들어가 있으면close
					resultSet.close();
				}
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		return dtos;
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
}
