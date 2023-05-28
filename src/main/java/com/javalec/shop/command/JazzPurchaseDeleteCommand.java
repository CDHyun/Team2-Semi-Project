package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.PurchaseDao;

public class JazzPurchaseDeleteCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int pcNo = Integer.parseInt(request.getParameter("pcNo"));
		
		
		PurchaseDao dao = new PurchaseDao();
		dao.purchase_delete(pcNo); //write method 부르는 애 (순서주의)
		

	}

}
