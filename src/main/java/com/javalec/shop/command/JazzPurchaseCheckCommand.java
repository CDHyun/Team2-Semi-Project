package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.PurchaseDao;
import com.javalec.shop.dto.PurchaseDto;

public class JazzPurchaseCheckCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		PurchaseDao dao = new PurchaseDao();
		/* dao 메소드를 이용(일을 시킴)해서 dtos에 데이터를 넣어줌. */
		ArrayList<PurchaseDto> dtos = dao.purchaseList();
		/* 만들어진 ArrayList 객체를 어트리뷰트로 만듬. 커맨드 받은 일 끝. */
		request.setAttribute("PurchaseList", dtos);//java에서 jsp로 data 바꿔주는거  
	}

	
	
	
	
	
	
	
	}


