package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.adminDao;

public class JazzAdminDelete implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pCode = Integer.parseInt("pCode");
		
		adminDao dao = new adminDao();
		dao.delete(pCode);
	}

}
