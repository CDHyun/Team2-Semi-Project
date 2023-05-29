package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.PurchaseDao;
import com.javalec.shop.dto.PurchaseDto;

public class JazzPurchaseDetailCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		 String pcNo = request.getParameter("pcNo");
	        PurchaseDao dao = new PurchaseDao();
//	        PurchaseDto purchaseDto = dao.purchaseDetail(Integer.parseInt(pcNo));
//	        request.setAttribute("PurchaseDetail", purchaseDto);
	}

}
