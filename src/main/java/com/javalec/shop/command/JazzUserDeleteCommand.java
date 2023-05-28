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
 * Servlet implementation class JazzUserDeleteCommand
 */
@WebServlet("/JazzUserDeleteCommand")
public class JazzUserDeleteCommand extends HttpServlet implements JazzCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JazzUserDeleteCommand() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uid = request.getParameter("uid");
		UserDao userDao = new UserDao();
		int result = userDao.userSecede(uid);
		if(result == 1) {
			session.invalidate();
			response.getWriter().write(result + "");
		} else {
			response.getWriter().write(result + "");
		}
		
	}

}
