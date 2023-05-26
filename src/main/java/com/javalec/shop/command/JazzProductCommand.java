package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.ProductDao;
import com.javalec.shop.dto.ProductDto;

public class JazzProductCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String code = request.getParameter("pCode");
		
		ProductDao dao = new ProductDao(); 
		ProductDto dto = dao.showDetail(code);
		
		request.setAttribute("content_view", dto);
	}

}
