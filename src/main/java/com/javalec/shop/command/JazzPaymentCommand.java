package com.javalec.shop.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.shop.dao.PurchaseDao;

/**
 * Servlet implementation class JazzPaymentCommand
 */
@WebServlet("/JazzPaymentCommand")
public class JazzPaymentCommand extends HttpServlet implements JazzCommand {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JazzPaymentCommand() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see JazzCommand#execute(HttpServletRequest, HttpServletResponse)
	 */
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		int pcQty = Integer.parseInt(request.getParameter("pcQty"));
		String pSize = request.getParameter("pSize");
		System.out.println("pCode :"+pCode + " pcQty:"+pcQty+ " pSize:" + pSize);
		PurchaseDao purchaseDao = new PurchaseDao();
		int result = purchaseDao.payment(pSize, pcQty, pCode, uid);
		System.out.println("결과값 : " + result);
		response.getWriter().write(result + "");

	}

}
