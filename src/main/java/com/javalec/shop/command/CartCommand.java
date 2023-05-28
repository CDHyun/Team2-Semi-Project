package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javalec.shop.dao.CartDao;
import com.javalec.shop.dao.ProductDao;
import com.javalec.shop.dto.CartDto;
import com.javalec.shop.dto.ProductDto;

public class CartCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String code = request.getParameter("pCode");
		
		
		
		ProductDao dao1 = new ProductDao(); 
		ProductDto dto = dao1.showDetail(code);
		request.setAttribute("content_view", dto);
		
		
		CartDao dao = new CartDao();
		ArrayList<CartDto> dtos= dao.cart();

		request.setAttribute("cart", dtos);
	}

}
