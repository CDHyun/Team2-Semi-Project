package com.javalec.shop.homecotroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.shop.command.CartCommand;
import com.javalec.shop.command.JazzCommand;
import com.javalec.shop.command.JazzIndexCommand;
import com.javalec.shop.command.JazzProductCommand;
import com.javalec.shop.command.JazzPurchaseCheckCommand;
import com.javalec.shop.command.JazzPurchaseCommand;
import com.javalec.shop.command.JazzPurchaseInfoCommand;
import com.javalec.shop.command.JazzUserLogOutCommand;


/**
 * Servlet implementation class JazzHomeController
 */
@WebServlet("*.do")
public class JazzHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JazzHomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionDo(request, response);
	}

	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		JazzCommand command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch(com) {
		case("/register.do"):
			/* ajax로 검사하고 페이지 반환해서 다른 코드 필요 없음. */
			viewPage = "login_form.jsp";
			break;
		case("/login.do"):
			/* ajax로 검사하고 페이지 반환해서 다른 코드 필요 없음. */
			viewPage = "index.do";
			break;
		case("/logOut.do"):
			command = new JazzUserLogOutCommand();
			command.execute(request, response);
			viewPage = "index.do";
			break;
		case("/my_account.do"):
			command = new JazzUserLogOutCommand();
			command.execute(request, response);
			viewPage = "index.do";
			break;
		case("/index.do"):
			command = new JazzIndexCommand();
			command.execute(request, response);
			viewPage = "index.jsp";
			break;
		case("/product_details.do"):
	         command = new JazzProductCommand();
	         command.execute(request, response);
	         viewPage = "product_details.jsp";
	         break;
		case("/purchase.do"):
			command = new JazzPurchaseCommand();
			command.execute(request, response);
			viewPage = "purchase.jsp";
			break;
		case("/purchase_info.do"):
			command = new JazzPurchaseInfoCommand();
			command.execute(request, response);
			viewPage = "purchase.jsp";
			break;
		case("/purchase_Check.do"):
			command = new JazzPurchaseCheckCommand();
			command.execute(request, response);
			viewPage = "purchase_check.jsp";
			break;
		case("/cart.do"):
			command = new CartCommand();
			command.execute(request, response);
			viewPage = "cart.jsp";
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}	// End actionDo
	
	
}	// End Class
