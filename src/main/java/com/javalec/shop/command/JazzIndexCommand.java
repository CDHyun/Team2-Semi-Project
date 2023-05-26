package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.dao.ProductDao;
import com.javalec.shop.dto.ProductDto;

public class JazzIndexCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
//		String queryName = request.getParameter("query");
//		String queryContent = request.getParameter("content");
		
		
		ProductDao dao = new ProductDao();  // BDao의 생성자로가서 dB연결해주기
		ArrayList<ProductDto> dtos = dao.searchAction();
		request.setAttribute("list", dtos);   // jsp로 가져온 dtos데이터를 가져다주기 위함
	}

}
