package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.PurchaseDao;
import com.javalec.shop.dto.PurchaseDto;

public class JazzPaymentCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		

		
		String pStock = request.getParameter("pStock"); //write_view에 있는 jsp데이터("")를 가져오는것 
		String pSize = request.getParameter("pSize"); //write_view에 있는 jsp데이터("")를 가져오는것 
		
		
		PurchaseDao dao = new PurchaseDao();
		dao.payment(pSize, 0, pSize);//write method 부르는 애 (순서주의)
		
		
	}
		
		
		
	}


