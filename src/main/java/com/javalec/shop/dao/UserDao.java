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
	
	public boolean signUp(String uid, String uPassword, String uName, String uPhone, String uAddress, String uEmail) {
		int count = 0;
		boolean result = false;
		
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
			
			if(count>0) {
				result = true;
			}
			/* Slack Test */
			
		}catch (Exception e) {
			e.printStackTrace();
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
			if(rs.next()) {
				rowCount = rs.getInt(1);
			}
			
			/* Slack Test */
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR");
		} finally {
			try {
				if(con != null) con.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return rowCount;
	}
	
	
	

}	// End Class
