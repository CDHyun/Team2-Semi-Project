package com.javalec.shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			System.err.println("로그인 메소드에서 문제 발생");
		}
		return result;
	}
	
	
	

}	// End Class
