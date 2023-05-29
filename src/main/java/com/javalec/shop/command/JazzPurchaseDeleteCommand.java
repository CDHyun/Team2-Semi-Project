package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.PurchaseDao;
import com.javalec.shop.dto.PurchaseDto;

public class JazzPurchaseDeleteCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		int pcNo = Integer.parseInt(request.getParameter("pcNo"));
		
        PurchaseDao dao = new PurchaseDao();
        dao.purchase_delete(pcNo, uid);
        // 삭제 전에 전달할 데이터를 request 객체에 저장
    }

	}


