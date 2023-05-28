package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.shop.dto.CartDto;


public class CartDao {
	DataSource dataSource;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public CartDao(String code) {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jazz");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<CartDto> cart(){
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

	
		try {
			connection = dataSource.getConnection();
			String query = " select c.cNo, p.pCode, p.pNmae, p.pBrandName ,p.pPrice ,c.cQty from cart c, user u, product p where u.uid = c.uid and c.pCode = p.pCode and u.uid =?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(code));
			resultSet = preparedStatement.executeQuery(query);
		
			
			while(resultSet.next()) {
			int cNo = resultSet.getInt("cNo");
			String uid = resultSet.getString("uid");
			int pCode = resultSet.getInt("pCode");
			int cQty = resultSet.getInt("cQty");
			String pName = resultSet.getString("pName");
			String pBrandName =resultSet.getString("pBrandName");
			int pPrice = resultSet.getInt("pPrice");
			
			
			
			CartDto dto = new CartDto(cNo, uid, pCode, cQty, pName, pBrandName,pPrice);
			dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) 	{
				e.printStackTrace();
			}
		}
		return dtos;
	}
}
