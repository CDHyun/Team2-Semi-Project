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
		int pcNo = Integer.parseInt(request.getParameter("pcNo"));
		
	

        // 주문 정보 조회
//        PurchaseDao dao = new PurchaseDao();
//        PurchaseDto purchaseDto = dao.getPurchaseByPcNo(pcNo);
//
//        // 삭제 전에 전달할 데이터를 request 객체에 저장
//        request.setAttribute("PurchaseInfo", purchaseDto);
//
//        // 주문 삭제
//        dao.purchase_delete(pcNo);
    }

	}


