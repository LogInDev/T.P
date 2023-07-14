package mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MVCBoardDAO;
import dto.MemberOrder;

@WebServlet("/controller/OrderConfirmation.do")
public class OrderConfirmationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderConfirmationController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("OrderConfirmation.do ����");
		MVCBoardDAO dao = new MVCBoardDAO();
		MemberOrder memo = new MemberOrder();
		
		memo = (MemberOrder) dao.selectView(request.getParameter("orderId"));
		
		request.setAttribute("memo", memo);
		dao.close();
//		�������Ĵ� ��Ʈ��θ� ���� �ȵȴ�.��Ʈ��θ� �����ϰ� ��θ� ������� �Ѵ�. ����
//		������� �������� ����ΰ� �ִٸ� �� ����� �������� ������� �������� �ƴ϶�, �����ĸ� ������ �������� �Ǿ, ����� �����Ҷ� �����ؾ� �Ѵ�.
		request.getRequestDispatcher("/orderConfirmation.jsp").forward(request, response);
	}

}
