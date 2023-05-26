package com.javalec.shop.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
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
	
	String pImageName="";

	
	// File
	FileInputStream pImage;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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
			String WhereDefault = "select  pName, pBrandName, pPrice , pImageName, pImage from product";
			//String WhereDefault2 = " where " + queryName + " like '%" +queryContent + "%'";
			preparedStatement = connection.prepareStatement(WhereDefault);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String pName = resultSet.getString(1);
				String pBrandName = resultSet.getString(2);
				int pPrice = resultSet.getInt(3);
				String pImageName = resultSet.getString(4);
				
				File file = new File("./" + pImageName);
				FileOutputStream output = new FileOutputStream(file);     //outputstream 은 select
				
				InputStream input = resultSet.getBinaryStream(5);
				
				
				byte[] buffer = new byte[1024];
				while(input.read(buffer) > 0) {
					output.write(buffer);
				}
				
			
				
				
				
			
				ProductDto dto = new ProductDto(pImageName, pName, pBrandName, pPrice);
				dtos.add(dto);

				output.close();
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
