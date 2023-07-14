package mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MVCBoardDAO;

@WebServlet("/controller/DeleteOrder.do")
public class DeleteOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("/DeleteOrder.do//doGet()");
		System.out.println("/DeleteOrder.do//doGet()//memberId : " + request.getAttribute("memberId"));
		
		String memberId = request.getParameter("memberId");		
		
		MVCBoardDAO dao = new MVCBoardDAO();
		
		dao.deletePost(memberId);
		dao.close();
		response.sendRedirect("/WebMarket/allview.po?pageNum=1");		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		System.out.println("/DeleteOrder.do//doPost()");
		System.out.println("/DeleteOrder.do//doGet()//memberId : " + request.getAttribute("memberId"));
		
		String memberId = request.getParameter("memberId");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		
		dao.deleteCart(memberId);
		dao.close();
		response.sendRedirect("/WebMarket/thankCustomer.jsp");
	}

}
