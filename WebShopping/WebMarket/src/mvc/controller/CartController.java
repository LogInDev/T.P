package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MVCCartDAO;
import dto.CartDTO;
import mvc.model.MemberDAO;
@WebServlet("*.go")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("goGet()");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("goPost()");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		MemberDAO memberdao = new MemberDAO();
		
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("sessionId");
		
		if (command.equals("/cartList.go")) {
			System.out.println("cartList.go");
			
			MVCCartDAO cDao = new MVCCartDAO();
			int resultSet;
			System.out.println("cartConfimation 전");
			resultSet = cDao.cartConfirmation(memberId);
			System.out.println("resultSet : " + resultSet);
			if(resultSet == 0) {
				System.out.println("if문 들어옴");
				/* request.getRequestDispatcher("/noCart.jsp").forward(request, response); */
				response.sendRedirect("/WebMarket/noCart.jsp");
			} else {	
			
			requestCartList(request);
			request.getRequestDispatcher("/cart.jsp").forward(request, response);
			
			}
			
		}else if (command.equals("/addCart.go")) {
			System.out.println("addCart.go");
			requestAddCart(request);
			System.out.println("B");
			request.getRequestDispatcher("/Bcontrollercart.po").forward(request, response); // 占쎈연疫뀐옙 雅뚯눘�꺖�몴占� .do嚥∽옙
		}else if (command.equals("/deleteCart.go")) {
			System.out.println("deleteCart.go");
			
			int resultSet = requestDeleteCart(request);
			if(resultSet == 1) {
				response.getWriter().write("success");
			}else if(resultSet == 0) {
				response.getWriter().write("fail");
			}
			
			request.getRequestDispatcher("/cartList.go").forward(request, response);
		}else if (command.equals("/removeCart.go")) {
			System.out.println("removeCart.go");
			requestRemoveCart(request);
			request.getRequestDispatcher("/cartList.go").forward(request, response);
		}
			
	}

	public void requestCartList(HttpServletRequest request){

		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("sessionId");
		
		MVCCartDAO dao = new MVCCartDAO();
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		
		int pageNum=1;

		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt(request.getParameter("pageNum"));

		System.out.println(memberId);
		int total_record = dao.getListCount(memberId); // �룯占� 野껊슣�뻻�눧占� 占쎈땾
		cartList = dao.getCartList(memberId); // �룯占� 野껊슣�뻻�눧占�(List)
		request.setAttribute("cartList", cartList);
		dao.close();
		
		
	}

	public void requestAddCart(HttpServletRequest request){
		MVCCartDAO dao = new MVCCartDAO();
		String p_id = request.getParameter("p_id");
		String productSize = request.getParameter("size"); // color.p_color
		String productColor = request.getParameter("color"); // size.p_size
		System.out.println("燁삳똾�뱜�빊遺쏙옙 : " + p_id);
		System.out.println("燁삳똾�뱜�빊遺쏙옙 : " + productSize);
		System.out.println("燁삳똾�뱜�빊遺쏙옙 : " + productColor);
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("sessionId");
		System.out.println(memberId);
		
		CartDTO cart = new CartDTO();
		dao.addCart(memberId, p_id, productSize, productColor);
		System.out.println("A");
		dao.close();
	}
	
	public int requestDeleteCart(HttpServletRequest request){
		MVCCartDAO dao = new MVCCartDAO();
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("sessionId");
		int rs = 0;
		
		rs = dao.deleteCart(memberId);
//		System.out.println(rs);
//		if(rs > 0) System.out.println("占쎄텣占쎌젫 占쎌끏�뙴占�");
//		else System.out.println("占쎈뼄占쎈솭~~^^");
		dao.close();
		return rs;
	}
	
	public void requestRemoveCart(HttpServletRequest request){
		MVCCartDAO dao = new MVCCartDAO();
		int cartId = Integer.parseInt(request.getParameter("cartId"));
		System.out.println(cartId);
		int rs = 0;
		
		rs = dao.removeCart(cartId);
		System.out.println(rs);
		if(rs == 1) System.out.println("占쎄텣占쎌젫 占쎌끏�뙴占�");
		else System.out.println("占쎈뼄占쎈솭~~^^");
		dao.close();
	}
	
//	public void checkForm(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		String sessionId = (String) session.getAttribute("sessionId");
//		if (sessionId == null) {
//			alert("嚥≪뮄�젃占쎌뵥 占쎈퉸雅뚯눘苑�占쎌뒄.");
//			return false;
//		}
//
//		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
//	}

}



	