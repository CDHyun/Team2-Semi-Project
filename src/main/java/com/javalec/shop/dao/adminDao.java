package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.shop.dto.ProductDto;
import com.javalec.shop.dto.adminDto;

public class adminDao {
	
	DataSource dataSource;

	public adminDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jazz");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductDto> productList(){
		ArrayList<ProductDto> dtos = new ArrayList<ProductDto>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "SELECT p.pImage, p.pCode, p.pBrandName, p.pName, p.pPrice, po.pSize "
	                + "FROM product p "
	                + "JOIN productOption po ON p.pCode = po.pCode";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				String pImage = resultSet.getString("pImage");
				int pCode = resultSet.getInt("pCode");
				String pBrandName = resultSet.getString("pBrandName");
				String pName = resultSet.getString("pName");
				int pPrice = resultSet.getInt("pPrice");
				int pSize = resultSet.getInt("pSize");
				
				ProductDto dto = new ProductDto(pImage, pCode, pBrandName, pName, pPrice);
				dtos.add(dto);
				
			}
		}catch (Exception e) {
			
		}
		return dtos;
	}
	
	
	
	public void write(String pImage, int pCode, String pBrandName, String pName, int pPrice, int pSize) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into product (pCode, pName, pBrandName, pPrice, pImage) values (?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, pCode);
			preparedStatement.setString(2, pName);
			preparedStatement.setString(3, pBrandName);
			preparedStatement.setInt(4, pPrice);
			preparedStatement.setString(5, pImage);
			
			preparedStatement.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				
			}
		}
	}
	
	
	
	public void modify(String pImage, int pCode ,String pBrandName, String pName, int pPrice, int pSize) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update product pName=?, pBrandName=?, pPrice=?, pImage=? where pCode";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, pName);
			preparedStatement.setString(2, pBrandName);
			preparedStatement.setInt(3, pPrice);
			preparedStatement.setString(4, pImage);
			preparedStatement.setInt(4, pCode);
			
			preparedStatement.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
				
			}
		}
	}
	
	
	public void delete(int pCode) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String qyery = "delete from product where pCode = ?";
			preparedStatement = connection.prepareStatement(qyery);
			preparedStatement.setInt(1, pCode);
		}catch (Exception e) {
			
		}finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
		}catch (Exception e) {
			
		}
		}
	}
	
	
	
}//End
