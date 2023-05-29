package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.ProductDao;
import com.javalec.shop.dao.adminDao;

public class JazzAdminWrite implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String pImage = request.getParameter("pImage");
		int pCode = Integer.parseInt("pCode");
		String pBrandName = request.getParameter("pBrandName");
		String pName = request.getParameter("pName");
		int pPrice = Integer.parseInt("pPrice");
		int pSize = Integer.parseInt("pSize");
		
		adminDao dao = new adminDao();
		dao.write(pImage, pCode, pBrandName, pName, pPrice, pSize);
	}

}
