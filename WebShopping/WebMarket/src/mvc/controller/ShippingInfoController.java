package mvc.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MVCBoardDAO;
import dao.MVCCartDAO;
import dto.MemberOrder;

@WebServlet("/controller/ShippingInfo.do")
public class ShippingInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ShippingInfo.do/doGet()");
//		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		String memberId = session.getAttribute("sessionId").toString();
		System.out.println("ShippingInfo.do/memberId : "+memberId);
		
//		request.setAttribute("cartId",cartId);
		
//		占쌈시뤄옙 占쏙옙占쏙옙 cartId		
//		String memberId = "whang"; 
		
//		cartId占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싶억옙 占싹댐옙 占쏙옙占쏙옙占쏙옙 member 占쏙옙占싱븝옙占쏙옙 name, address, phone -> db占쏙옙占쏙옙 占쌨아쇽옙 MemberOrder class占쏙옙 占쏙옙占쏙옙
//		cartId占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싶억옙 占싹댐옙 占쏙옙占쏙옙占쏙옙 product 占쏙옙占싱뱄옙占쏙옙 p_fileName,p_description
		List<MemberOrder> productMember = new ArrayList<MemberOrder>();
		MVCBoardDAO dao = new MVCBoardDAO();
		
//		cart table에 담긴 instance가 있는지 없는지 검사.
		MVCCartDAO cDao = new MVCCartDAO();
		int resultSet;
		System.out.println("cartConfimation 전");
		resultSet = cDao.cartConfirmation(memberId);
		System.out.println("resultSet : " + resultSet);
		if(resultSet == 0) {
			System.out.println("if문 들어옴");
			request.getRequestDispatcher("/cartList.go?memberId=${sessionId}").forward(request, response);
		}else {
		
		System.out.println("if문 통과");
		productMember = dao.selectView(memberId);
		
				
		dao.close();
		System.out.println("productMember :" + productMember);
		request.setAttribute("productMember", productMember);
		request.getRequestDispatcher("/NewFile.jsp").forward(request, response);
		
		}
		
	}
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("ShippingInfo.do/doPost()");
    	
//    	/WebMarket/processShippingInfo.jsp 占쏙옙占쏙옙
//    	request.setCharacterEncoding("UTF-8");
    	
//    	shippingInfo.jsp占쏙옙占쏙옙 post占쏙옙 cartId,addressee(占쏙옙占쏙옙占쏙옙),addressName(占쏙옙占쏙옙美占�),extraAddr(占쏙옙占쏙옙占쏙옙玲占�) 占쏙옙 占쌨는댐옙.
    	request.setCharacterEncoding("UTF-8");
    	String extraAddr = request.getParameter("extraAddr");
    	
    	String phone1 = request.getParameter("phone1");
    	String phone2 = request.getParameter("phone2");
    	String phone3 = request.getParameter("phone3");
    	String phone = phone1 + phone2 + phone3;
    	
    	String email1 = request.getParameter("email1");
    	String domainName = request.getParameter("domainName");
    	String email = email1 +"@"+ domainName;
    	
    	String status = "占쏙옙蚌占시�";
    	
    	String memberId = request.getParameter("memberId");
    	String totalPrice = request.getParameter("totalPrice");
    	System.out.println("ShippingInfo.doPost()//memberId :"+memberId);
    	System.out.println("ShippingInfo.doPost()//totalPrice :"+totalPrice);
    	System.out.println("ShippingInfo.doPost()//phone :"+phone);
    	System.out.println("ShippingInfo.doPost()//extraAddr :"+extraAddr);
    	
    	List<MemberOrder> productMember = new ArrayList<MemberOrder>();
    	MemberOrder orders = new MemberOrder();
    	MemberOrder user = new MemberOrder();
    	MVCBoardDAO dao = new MVCBoardDAO();
    	
//		shippingInfo.jsp 占쏙옙占쏙옙 占쏙옙占쏙옙微占� 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌨아온댐옙.
    	user.setAddressee(request.getParameter("addressee"));
    	user.setTotalPrice(request.getParameter("totalPrice"));
    	user.setOrderMsg(request.getParameter("orderMsg"));
    	user.setExtraAddr(request.getParameter("extraAddr"));
    	user.setEmail(email);
    	user.setPhone(phone);
    	user.setMemberId(memberId);
    	user.setStatus(status);
    	
//		orders table占쏙옙 占쏙옙占쏙옙占쏙옙트 占싹깍옙占쏙옙占쏙옙 cartId占쏙옙 확占쏙옙占쌔쇽옙 占싱뱄옙 占쏙옙溝占� 카트占쏙옙占쏙옙 확占쏙옙占싼댐옙.
    	int resultSet;
    	resultSet = dao.memberIdConfirmation(memberId);
//    	占쏙옙占쏙옙 1 : 占싱뱄옙 占쏙옙溝퓸占� 占쌍댐옙 cartId 占쏙옙占� 占쏙옙占쌜듸옙 占쏙옙占쏙옙占쏙옙 update占싼댐옙.
//    	占쏙옙占쏙옙 0 : 占쏙옙占쏙옙 占쏙옙占쏙옙求占� cartId 占쏙옙占� 占쏙옙占쌜듸옙 占쏙옙占쏙옙占쏙옙 insert 占싼댐옙.
    	if(resultSet == 1) {
    		dao.updateWrite(user);
    	}else if(resultSet == 0) {
    		dao.insertWrite(user);
    	}

//      MemberOrders class占쏙옙 address,phone,name,p_fileName,p_description,p_name,p_unitPrice 占쏙옙占쏙옙
    	productMember = dao.selectView(memberId);
    	
// 	   	orders table占쏙옙占쏙옙 占쏙옙占� culumn(orderId,cart_id,status,extraAddr,addressee,addressName,create_timestamp)占쏙옙 占쏙옙占쏙옙占쏙옙 MemberOrder class占쏙옙 占쏙옙占쏙옙占싼댐옙.
    	orders = dao.orderSelectView(memberId);
 
     	System.out.println("ShippingInfo.do//user :" + user);
     	System.out.println("ShippingInfo.do//orders :" + orders);
     	System.out.println("ShippingInfo.do//productMember :" + productMember);
     	dao.close();
     	request.setAttribute("orders", orders);
     	request.setAttribute("productMember", productMember);
    	request.getRequestDispatcher("/orderConfirmation.jsp").forward(request, response);
    	
	}

}
