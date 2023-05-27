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

	public ArrayList<PurchaseDto> selectUser(String uid) {
		ArrayList<PurchaseDto> beanList = new ArrayList<PurchaseDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();
			String query = "select uName, uPhone, uAddress from user where uid = ?";
			preparedStatement = connection.prepareStatement(query); //ps에 쿼리문 넣기
			preparedStatement.setString(1, uid);//위에 물음표를 ()안에 데이터 채워 넣기
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				String uName = resultSet.getString(1);
				String uPhone = resultSet.getString(2);
				String uAddress = resultSet.getString(3);
				PurchaseDto dto = new PurchaseDto(uPhone, uName, uAddress);
				beanList.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return beanList;
	}

} // END
