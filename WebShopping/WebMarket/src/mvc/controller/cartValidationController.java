package mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MVCCartDAO;


@WebServlet("/controller/cartValidation.do")
public class cartValidationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public cartValidationController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		System.out.println("cartValidation.do//memberId :"+ memberId);
		
		MVCCartDAO dao = new MVCCartDAO();
		
		int resultSet = dao.cartConfirmation(memberId);
		if(resultSet == 1) {
			response.getWriter().write("success");
		}else if(resultSet == 0) {
			response.getWriter().write("fail");
		}
	}

}
