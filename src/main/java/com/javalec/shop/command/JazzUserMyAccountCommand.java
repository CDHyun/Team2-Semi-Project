package com.javalec.shop.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.UserDao;
import com.javalec.shop.dto.UserDto;

public class JazzUserMyAccountCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		UserDao userDao = new UserDao();
		ArrayList<UserDto> beanList = new ArrayList<UserDto>();
		beanList = userDao.userinfo(uid);
		
		request.setAttribute("UserInfo", beanList);
		
	}

}
