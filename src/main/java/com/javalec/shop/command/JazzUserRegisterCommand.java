package com.javalec.shop.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.UserDao;

/**
 * Servlet implementation class JazzUserRegisterCommand
 */
@WebServlet("/JazzUserRegisterCommand")
public class JazzUserRegisterCommand extends HttpServlet implements JazzCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JazzUserRegisterCommand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
     * @see JazzCommand#execute(HttpServletRequest, HttpServletResponse)
     */
    public void execute(HttpServletRequest request, HttpServletResponse response)  { 
 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String msg = "";
		String view = "";
		int result = userDao.signUp(uid, uPassword, uName, uPhone, uAddress, uEmail);
		if(result > 0) {
			msg = "회원가입을 축하합니다!";
			response.getWriter().write(result + "");
			request.setAttribute("result", result);
			request.setAttribute("msg", msg);
		} else {
			msg = "중복되는 아이디입니다.";
			response.getWriter().write(result + "");
			request.setAttribute("result", result);
			request.setAttribute("msg", msg);
		}

		
		
		
	}

}
