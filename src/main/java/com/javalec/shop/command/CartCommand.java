package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.CartDao;
import com.javalec.shop.dao.ProductDao;
import com.javalec.shop.dto.CartDto;
import com.javalec.shop.dto.ProductDto;

public class CartCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String code = request.getParameter("pCode");
		String uid = (String)session.getAttribute("SUID");
		
		
		CartDao dao = new CartDao();
		
		ProductDao dao1 = new ProductDao(); 
		ProductDto dto = dao1.showDetail(code);
		request.setAttribute("content_view", dto);
		
		
		ArrayList<CartDto> dtos= dao.cart(uid);

		request.setAttribute("cart", dtos);
	}

}
