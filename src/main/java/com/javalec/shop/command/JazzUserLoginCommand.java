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
 * Servlet implementation class JazzUserLoginCommand
 */
@WebServlet("/JazzUserLoginCommand")
public class JazzUserLoginCommand extends HttpServlet implements JazzCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JazzUserLoginCommand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
     * @see JazzCommand#execute(HttpServletRequest, HttpServletResponse)
     */
    public void execute(HttpServletRequest request, HttpServletResponse response)  { 
         // TODO Auto-generated method stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String uPassword = request.getParameter("uPassword");
		System.out.println("uid : " + uid);
		System.out.println("uPassword : " + uPassword);
		UserDao userDao = new UserDao();
		HttpSession session = request.getSession();
		int result = userDao.login(uid, uPassword);
		if(result == 1) {
			session.setAttribute("SUID", uid);
			response.getWriter().write(result + "");
			System.out.println("회원 탈퇴 성공");
		} else {
			response.getWriter().write(result + "");
		}
		
	}

}
