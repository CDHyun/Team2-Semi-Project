package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.PurchaseDao;

public class JazzPurchaseCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		String strPCode = request.getParameter("pCode");
		String pSize = request.getParameter("pSize");
		int pCode = Integer.parseInt(strPCode);
		String strPcQty = request.getParameter("pcQty");
		int pcQty = Integer.parseInt(strPcQty);
		
		PurchaseDao dao = new PurchaseDao();
		dao.purchase(uid, pCode, pcQty, pSize);//write method 부르는 애 (순서주의)

	}

}
