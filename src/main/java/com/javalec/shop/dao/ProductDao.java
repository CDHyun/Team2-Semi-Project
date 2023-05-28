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
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<ProductDto> searchAction(String queryName, String queryContent) {
		if(queryName == null){ // 첫화면인 경우
			queryName = "pName";
			queryContent = "";
		}

		ArrayList<ProductDto> dtos = new ArrayList<ProductDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String WhereDefault = "select  pCode, pName, pBrandName, pPrice,pImage  from product";
			String WhereDefault2 = " where " + queryName + " like '%" +queryContent + "%'";
			preparedStatement = connection.prepareStatement(WhereDefault + WhereDefault2);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int pCode = resultSet.getInt(1);
				String pName = resultSet.getString(2);
				String pBrandName = resultSet.getString(3);
				int pPrice = resultSet.getInt(4);
				String pImage = resultSet.getString(5);
			
				
			
				ProductDto dto = new ProductDto(pCode, pName, pBrandName, pPrice, pImage);
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
	
	
	
	public ProductDto showDetail(String code) {
		
		ProductDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select pImage, pCode, pBrandName, pName, pPrice from product where pCode = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(code));
			resultSet = preparedStatement.executeQuery();
			if(resultSet.next()) {
				String pImage = resultSet.getString(1);
				int pCode = Integer.parseInt(resultSet.getString(2));
				String pBrandName = resultSet.getString(3);
				String pName = resultSet.getString(4);
				int pPrice = Integer.parseInt(resultSet.getString(5));
				
				dto = new ProductDto(pImage, pCode, pBrandName, pName, pPrice);
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
		
		return dto;
		
	}// contentView
	
	
	public ArrayList<ProductDto> searchSize(String code) {
		ArrayList<ProductDto> dtos = new ArrayList<ProductDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select pSize from productoption po, product p where p.pCode = po.pCode and p.pCode = ? order by pSize asc";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(code));
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String pSize = resultSet.getString(1);
				
				
				ProductDto dto = new ProductDto(pSize);
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
