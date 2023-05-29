package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.adminDao;
import com.javalec.shop.dto.ProductDto;
import com.javalec.shop.dto.adminDto;

public class JazzAdminProductCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		adminDao dao = new adminDao();
		ArrayList<adminDto> dtos = dao.productList();
		request.setAttribute("productList", dtos);

	}

}
