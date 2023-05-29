package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


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
	
	public ArrayList<adminDto> productList(){
		ArrayList<adminDto> dtos = new ArrayList<adminDto>();
		
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
				String pSize = resultSet.getString("pSize");
				
				adminDto dto = new adminDto(pImage, pCode, pBrandName, pName, pPrice, pSize);
				dtos.add(dto);
				
			}
		}catch (Exception e) {
			
		}
		return dtos;
	}
	
	
	
	public void write(String pImage, int pCode, String pBrandName, String pName, int pPrice, String pSize) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "INSERT INTO product (pImage, pCode, pBrandName, pName, pPrice, pSize) VALUES (?, ?, ?, ?, ?, ?)";
			
			String query1 = "INSERT INTO productOption(pSize) VALUES (?)";
			preparedStatement = connection.prepareStatement(query + query1);
			
			preparedStatement.setString(1, pImage);
			preparedStatement.setInt(2, pCode);
			preparedStatement.setString(3, pName);
			preparedStatement.setString(4, pBrandName);
			preparedStatement.setInt(5, pPrice);
			
			
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
	
	
	
	public void modify(String pImage, int pCode ,String pBrandName, String pName, int pPrice, String pSize) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update product SET pName=?, pBrandName=?, pPrice=?, pImage=? where pCode=?";
			String query1 = "update productOption SET pSize=? where pCode=?";
			preparedStatement = connection.prepareStatement(query + query1);
			preparedStatement.setString(1, pName);
			preparedStatement.setString(2, pBrandName);
			preparedStatement.setInt(3, pPrice);
			preparedStatement.setString(4, pImage);
			preparedStatement.setInt(5, pCode);
			preparedStatement.setString(6, pSize);
			
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
			String query = "delete from product where pCode = ?";
			String query1 = "delete from productOption where pCode = ?";
			preparedStatement = connection.prepareStatement(query + query1);
			preparedStatement.setInt(1, pCode);
			preparedStatement.setInt(2, pCode);
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
