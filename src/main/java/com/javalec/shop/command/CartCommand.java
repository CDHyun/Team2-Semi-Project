package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javalec.shop.dao.CartDao;
import com.javalec.shop.dto.CartDto;

public class CartCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CartDao dao = new CartDao();
		ArrayList<CartDto> dtos= dao.cart();

		request.setAttribute("cart", dtos);
	}

}
