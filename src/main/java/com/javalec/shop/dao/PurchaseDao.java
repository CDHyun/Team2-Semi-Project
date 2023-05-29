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
	int pcQty;
	int pPrice;

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
							+ "WHERE pc.pCode = p.pCode and po.pSize = pc.pSize and po.pCode = p.pCode and u.uid = pc.uid and u.uid = ? ";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				int pcNo = resultSet.getInt("PcNo");
				String pImage = resultSet.getString("pImage");
				int pCode = resultSet.getInt("pCode");
				String pBrandName = resultSet.getString("pBrandName");
				int pPrice = resultSet.getInt("pPrice");
				String pSize = resultSet.getString("pSize");
				int pcQty = resultSet.getInt("pcQty");
				Timestamp pcInsertDate = resultSet.getTimestamp("pcInsertDate");
				PurchaseDto purchaseDto = new PurchaseDto(pcNo, pImage, pCode, pBrandName, pPrice, pSize, pcQty, pcInsertDate);
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

	public int payment(String pSize, int pcQty, int pCode, String uid) {
		int result = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement2 = null;
		PreparedStatement insertPs = null;
		ResultSet checkRs = null;
		int wkStock = 0;

		try {
			String checkQuery = "select pStock from productOption where pCode = ? and pSize = ?";
			connection = dataSource.getConnection();
			preparedStatement2 = connection.prepareStatement(checkQuery);
			preparedStatement2.setInt(1, pCode);
			preparedStatement2.setString(2, pSize);
			checkRs = preparedStatement2.executeQuery();
			if(checkRs.next()) {
				wkStock = checkRs.getInt(1);
			}
			
			if(pcQty > wkStock) {
				result = 1; // 실패
			} else {
				/* create connection */; // 데이터베이스 연결 설정
				String updateQuery = "UPDATE productOption po, purchase p SET po.pStock = po.pStock - ?  \n"
						+ " WHERE p.pCode = po.pCode \n"
						+ " and p.pCode = ?  AND po.pSize = ?";
				preparedStatement = connection.prepareStatement(updateQuery);
				preparedStatement.setInt(1, pcQty);
				preparedStatement.setInt(2, pCode);
				preparedStatement.setString(3, pSize);
				preparedStatement.executeUpdate();
				
				String insertQuery = "insert into purchase (uid, pCode, pcInsertDate, pcQty, pSize) values(?, ?, now(), ?, ?);";
				insertPs = connection.prepareStatement(insertQuery);
				insertPs.setString(1, uid);
				insertPs.setInt(2, pCode);
				insertPs.setInt(3, pcQty);
				insertPs.setString(4, pSize);
				insertPs.executeUpdate();
				result = 0;
			}
			
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
		return result;
	}

	public void purchase(String uid, int pCode, int pcQty, String pSize) { 
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			String query = "insert into purchase (uid, pCode, pcInsertDate, pcQty, pSize) values(?, ?, now(), ?, ?);";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			preparedStatement.setInt(2, pCode);
			preparedStatement.setInt(3, pcQty);
			preparedStatement.setString(4, pSize);
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
	
	public void purchase_delete(int pcNo, String uid) { //BwriteCommand에서 부른걸 받는애.
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "delete from purchase where pcNo = ? and uid = ?";
			preparedStatement = connection.prepareStatement(query); //sql문을 쓰려고 준비.
			preparedStatement.setInt(1, pcNo);
			preparedStatement.setString(2, uid);
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(preparedStatement !=null)preparedStatement.close();
				if(connection != null) connection.close();
			}catch (Exception e) {
			e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	

} // END
