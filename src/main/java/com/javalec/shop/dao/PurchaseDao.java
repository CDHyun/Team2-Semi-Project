package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
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
			preparedStatement = connection.prepareStatement(query); // ps에 쿼리문 넣기
			preparedStatement.setString(1, uid);// 위에 물음표를 ()안에 데이터 채워 넣기
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
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

	public ArrayList<PurchaseDto> purchaseList(String uid) {
		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = dataSource.getConnection();
			String query = "SELECT u.uid, pcNo, pImage, p.pCode, pBrandName, pPrice, po.pSize, pcQty, pcInsertDate "
							+ "FROM purchase pc, product p, productoption po , user u " 
							+ "WHERE pc.pCode = p.pCode and u.uid = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				int PcNo = resultSet.getInt("PcNo");
				String pImage = resultSet.getString("pImage");
				int pCode = resultSet.getInt("pCode");
				String pBrandName = resultSet.getString("pBrandName");
				int pPrice = resultSet.getInt("pPrice");
				String pSize = resultSet.getString("pSize");
				int pcQty = resultSet.getInt("pcQty");
				Timestamp pcInsertDate = resultSet.getTimestamp("pcInsertDate");
				PurchaseDto purchaseDto = new PurchaseDto(PcNo, pImage, pCode, pBrandName, pPrice, pSize, pPrice,
						pcInsertDate);
				dtos.add(purchaseDto);
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

		return dtos;

	}

	public void payment(String pSize, int pcQty, String pBrandName) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			/* create connection */; // 데이터베이스 연결 설정
			String updateQuery = "UPDATE productOption SET pStock = pStock - ? WHERE pCode = ? AND pSize = ?";
			preparedStatement = connection.prepareStatement(updateQuery);
			preparedStatement.setInt(1, pcQty);
			preparedStatement.setString(2, pBrandName);
			preparedStatement.setString(3, pSize);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public void purchase(String uid, int pCode, int pcQty) { // BwriteCommand에서 부른걸 받는애.
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			String query = "insert into purchase(uid, pCode, pcInsertDate, pcQty) values(?, ?, now(), ?);";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			preparedStatement.setInt(2, pCode);
			preparedStatement.setInt(3, pcQty);
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

} // END
