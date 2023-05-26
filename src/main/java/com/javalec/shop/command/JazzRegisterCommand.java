package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.UserDao;

public class JazzRegisterCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String uid = request.getParameter("uid");
		String uPassword = request.getParameter("uPassword");
		String uName = request.getParameter("uName");
		String uPhone = request.getParameter("uPhone");
		String uAddress = request.getParameter("uAddress");
		String uEmail = request.getParameter("uEmail");
		
		UserDao userDao = new UserDao();
		boolean result = userDao.signUp(uid, uPassword, uName, uPhone, uAddress, uEmail);
		
		
	}
		
	
	
	
}	// End Class