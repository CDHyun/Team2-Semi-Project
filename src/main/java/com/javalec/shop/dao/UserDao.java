package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDao {

	/* Field */
	String uid;
	String uPassword;
	String uName;
	String uPhone;
	String uAddress;
	String uEmail;
	String uInsertDate;
	String uUpdateDate;
	boolean uSecessionStatus;

	DataSource dataSource;

	public UserDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/jazz");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int signUp(String uid, String uPassword, String uName, String uPhone, String uAddress, String uEmail) {
		int count = 0;
		int result = 0;

		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = dataSource.getConnection();

			String query = "insert into user(uid, uPassword, uName, uPhone, uAddress, uEmail, uInsertDate) values(?, ?, ?, ?, ?, ?, now())";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			ps.setString(2, uPassword);
			ps.setString(3, uName);
			ps.setString(4, uPhone);
			ps.setString(5, uAddress);
			ps.setString(6, uEmail);

			count = ps.executeUpdate();

			if (count > 0) {
				/* 회원가입 성공 */
				result = 1;
			}
			/* Slack Test */

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public int checkDuplicateId(String uid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int rowCount = 0;

		try {
			con = dataSource.getConnection();

			String query = "select count(*) from user where uid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			if (rs.next()) {
				rowCount = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR");
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rowCount;
	} // checkDuplicateId

	public int login(String uid, String uPassword) {
		Connection con = null;
		PreparedStatement statusCheckPs = null;
		PreparedStatement accordCheckPs = null;
		PreparedStatement existCheckPs = null;
		ResultSet statusRs = null;
		ResultSet accordRs = null;
		ResultSet existRs = null;
		int existUserCount = 0;
		boolean statusCheck = false;
		int accordCount = 0;
		int result = 0;

		try {
			con = dataSource.getConnection();
			String query2 = "select uSecessionStatus from user where uid = ?";
			statusCheckPs = con.prepareStatement(query2);
			statusCheckPs.setString(1, uid);
			statusRs = statusCheckPs.executeQuery();
			if (statusRs.next()) {
				statusCheck = statusRs.getBoolean(1);
			}
			if(statusCheck) {
				result = -1;	// 탈퇴함
			} else {
				String query1 = "select count(*) from user where uid = ?";
				existCheckPs = con.prepareStatement(query1);
				existCheckPs.setString(1, uid);
				existRs = existCheckPs.executeQuery();
				if(existRs.next()) {
					existUserCount = existRs.getInt(1);
				}
				
				if(existUserCount == 0) {
					result = -2;	//존재하지 않음
				} else {
					String query3 = "select count(*) from user where uid = ? and uPassword = ?";
					accordCheckPs = con.prepareStatement(query3);
					accordCheckPs.setString(1, uid);
					accordCheckPs.setString(2, uPassword);
					accordRs = accordCheckPs.executeQuery();
					if (accordRs.next()) {
					    accordCount = accordRs.getInt(1);
					}
					if(accordCount == 0) {
						result = 0;	// 틀림
					}
					if(accordCount > 0) {
						result = 1;	// 맞음
					}
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (statusCheckPs != null) statusCheckPs.close();
				if (accordCheckPs != null) accordCheckPs.close();
				if (existCheckPs != null) existCheckPs.close();
				if (statusRs != null) statusRs.close();
				if (accordRs != null) accordRs.close();
				if (existRs != null) existRs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}	// login

} // End Class
