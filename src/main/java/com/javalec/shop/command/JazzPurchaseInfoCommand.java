package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.ProductDao;
import com.javalec.shop.dao.PurchaseDao;
import com.javalec.shop.dto.ProductDto;
import com.javalec.shop.dto.PurchaseDto;

public class JazzPurchaseInfoCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String code = request.getParameter("pCode");
		System.out.println("JazzPurchaseInfoCommand pCode" + code);
		String uid = (String)session.getAttribute("SUID");
		PurchaseDao dao = new PurchaseDao();
		
		
		
		ProductDao dao1 = new ProductDao(); 
		ProductDto dto = dao1.showDetail(code);
		request.setAttribute("content_view", dto);
		
		
		
		/* dao 메소드를 이용(일을 시킴)해서 dtos에 데이터를 넣어줌. */
		ArrayList<PurchaseDto> dtos = dao.selectUser(uid);
		/* 만들어진 ArrayList 객체를 어트리뷰트로 만듬. 커맨드 받은 일 끝. */
		request.setAttribute("selectUser", dtos);//java에서 jsp로 data 바꿔주는거  
		request.setAttribute("purchaseList", dtos);//java에서 jsp로 data 바꿔주는거  

	}

}
