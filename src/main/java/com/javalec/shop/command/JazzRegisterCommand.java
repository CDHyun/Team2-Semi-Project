package com.javalec.shop.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.UserDao;

public class JazzRegisterCommand implements JazzCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String uid = request.getParameter("uid");
		String uPassword = request.getParameter("uPassword");
		String uName = request.getParameter("uName");
		String uPhone = request.getParameter("uPhone");
		String uAddress = request.getParameter("uAddress");
		String uEmail = request.getParameter("uEmail");
		HttpSession session = request.getSession();
		session.setAttribute("UID", uid);
		session.setAttribute("UPASSWORD", uPassword);
		session.setAttribute("UNAME", uName);
		session.setAttribute("UPHONE", uPhone);
		session.setAttribute("UADDRESS", uAddress);
		session.setAttribute("UEMAIL", uEmail);
		
		UserDao userDao = new UserDao();
		boolean result = userDao.signUp(uid, uPassword, uName, uPhone, uAddress, uEmail);
		System.out.println(result);
		String msg = "";
		String view = "";
		if(result) {
			msg = "회원가입을 축하합니다!";
			view = "login_from.jsp";
			request.setAttribute("result", result);
			session.setAttribute("view", view);
			request.setAttribute("msg", msg);
		} else {
			msg = "중복되는 아이디입니다.";
			view = "sign_up.jsp";
			System.out.println("view : " + view);
			request.setAttribute("result", result);
			request.setAttribute("view", view);
			request.setAttribute("msg", msg);
		}
		
		
	}
		
	
	
	
}	// End Class