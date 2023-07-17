package com.foke.demo.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.foke.demo.config.PrincipalDetails;
import com.foke.demo.dto.CartDTO;
import com.foke.demo.dto.DetailDTO;
import com.foke.demo.dto.MemberDTO;
import com.foke.demo.dto.PaymentDTO;
import com.foke.demo.dto.ProductDTO;
import com.foke.demo.dto.StoreDTO;
import com.foke.demo.service.CartService;
import com.foke.demo.service.DetailService;
import com.foke.demo.service.MemberService;
import com.foke.demo.service.PaymentRepository;
import com.foke.demo.service.Paymentservice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/payment")
public class PaymentController {

	@Autowired
	private final Paymentservice paymentservice;
	private final MemberService memberservice;
	private final DetailService detailService;
	private final CartService cartService;

	@PostMapping(value = "list")
	public String list(@AuthenticationPrincipal PrincipalDetails user, HttpServletRequest request, Model model, ProductDTO pro, @RequestParam(required = false) List<String> cartId) {
		
		HttpSession session = request.getSession();
	    String memberId = user.getUsername();
	    MemberDTO member = this.paymentservice.getMember(memberId);
	    
	    // 장바구니 정보 리스트
	    List<CartDTO> cartList = cartService.getCartList(memberId);
	    List<CartDTO> cartLists = new ArrayList<CartDTO>();
	    StoreDTO sdto = new StoreDTO();

	    for (int j = 0; j < cartList.size(); j++) {
	        for (int i = 0; i < cartId.size(); i++) {
	            if (cartList.get(j).getCartId() == Integer.parseInt(cartId.get(i))) {
	                System.out.println("??????" + cartList.get(j));
	                cartLists.add(cartList.get(j));
	                sdto.setStoreAddress(cartList.get(j).getStoreAddress());
	                sdto.setStoreName(cartList.get(j).getStoreName());
	                
	                //cart에서 정보 받아왔음.
	                CartDTO Cart = cartService.findCartByCartId(Integer.parseInt(cartId.get(i)));
	                //db에 업데이트 할 컬럼들
	        	    PaymentDTO payment = new PaymentDTO();
	        	    payment.setMemberId(member.getMemberId());
	        	    payment.setPoint(member.getPoint());
	        	    payment.setPhone(member.getPhone());
	        	    payment.setMemberName(member.getMemberName());
	        	    payment.setCartId(cartList.get(j).getCartId());
	        	    payment.setProductName(Cart.getProductName());
	        	    payment.setPrice(Cart.getPrice());
	        	    payment.setStoreAddress(Cart.getStoreAddress());
	        	    payment.setStoreName(Cart.getStoreName());
	        	    payment.setCartCount(Cart.getCartCount());
	        	    payment.setTotalPrice(Cart.getTotalPrice());
	        	    //DATE
	        	    LocalDate desiredPaymentDay = LocalDate.now();
	                payment.setPaymentDay(desiredPaymentDay);
	        	    
	        	    // payment 객체를 데이터베이스에 저장하는 역할
	        	    paymentservice.savePayment(payment);

	                payment.setMemberId(member.getMemberId());
	                payment.setCartId(cartList.get(j).getCartId());
	            }
	        }
	    }
	    System.out.println(">>>>>>>>>Lists>>>>>>>>>>>>>>>>>>>>>>" + cartLists);
	    System.out.println("카트아이디~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + cartId);

	    model.addAttribute("store", sdto);
	    model.addAttribute("member", member);
	    model.addAttribute("cart", cartLists);

	    return "payment/payment_list";
	}
	
	//카트 - 뷰 페이지
	@RequestMapping(value = "order", method={RequestMethod.GET, RequestMethod.POST})
	public String order(@AuthenticationPrincipal PrincipalDetails user, HttpServletRequest request, Model model, PaymentDTO pdto, ProductDTO pro, @RequestParam(required=false) List<String> cartId) {
		HttpSession session = request.getSession();
		StoreDTO sdto = new StoreDTO();
		sdto.setStoreName((String)session.getAttribute("storeName"));
		sdto.setStoreAddress((String)session.getAttribute("StoreAddress"));
		String memberId = user.getUsername();
        MemberDTO member = this.paymentservice.getMember(memberId);


		//장바구니 정보 리스트
		List<CartDTO> cartList = cartService.getCartList(memberId);
		List<CartDTO> cartLists = new ArrayList<CartDTO>();
		for(int j=0; j<cartList.size();j++) {
			for(int i=0; i<cartId.size();i++) {
				if(cartList.get(j).getCartId()==Integer.parseInt(cartId.get(i))) {
					System.out.println("??????" + cartList.get(j));
					cartLists.add(cartList.get(j));
					sdto.setStoreAddress(cartList.get(j).getStoreAddress());
					sdto.setStoreName(cartList.get(j).getStoreName());
				}
			}
		}
		System.out.println(">>>>>>>>>Listssssss>>>>>>>>>>>>>>>>>>>>>>"+ cartLists);
		System.out.println("카트아이디~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+cartId);
		
		//주문번호(랜덤함수) - order.html에서 사용
		String orderNum = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuilder sb = new StringBuilder(15);
		for(int i=0; i<15; i++){
			int randomNum = random.nextInt(orderNum.length());
			sb.append(orderNum.charAt(randomNum));
		}
		String randomString = sb.toString();
		
		model.addAttribute("store", sdto);
		model.addAttribute("member", member);
		model.addAttribute("cart", cartLists);
		model.addAttribute("randomString", randomString);

		return "payment/payment_order";

	}

	//뷰 - 결제페이지
	@PostMapping(value = "list1")
	public String list1(@AuthenticationPrincipal PrincipalDetails user, HttpServletRequest request, Model model, PaymentDTO pdto, ProductDTO pro, DetailDTO ddto, @RequestParam(required = false) List<String> toppingchk, 
			@RequestParam(required = false) List<String> sourcechk, @RequestParam(required = false) List<String> extrachk) {


		if (toppingchk != null) {
			for(int i=0;i<toppingchk.size();i++) {
				if(i==0) {
					ddto.setAtopping(toppingchk.get(i));
				}else if(i==1) {
					ddto.setBtopping(toppingchk.get(i));
				}else if(i==2) {
					ddto.setCtopping(toppingchk.get(i));
				}else if(i==3) {
					ddto.setDtopping(toppingchk.get(i));
				}
			}
		}
		if (sourcechk != null) {
			for(int i=0;i<sourcechk.size();i++) {
				if(i==0) {
					ddto.setAsource(sourcechk.get(i));
				}else if(i==1) {
					ddto.setBsource(sourcechk.get(i));
				}
			}
		}
		if(extrachk!=null) {
			for(int i=0;i<extrachk.size();i++) {
				if(i==0) {
					ddto.setAextratopping(extrachk.get(i));
				}else if(i==1) {
					ddto.setBextratopping(extrachk.get(i));
				}
			}
		}
		
		HttpSession session = request.getSession();
		StoreDTO sdto = new StoreDTO();
		sdto.setStoreName((String)session.getAttribute("storeName"));
		sdto.setStoreAddress((String)session.getAttribute("storeAddress"));
		String memberId = user.getUsername();
		MemberDTO member = this.paymentservice.getMember(memberId);
		
		//detail 데이터를 세션에 담음
		session.setAttribute("detail", ddto);

		model.addAttribute("store", sdto);
		model.addAttribute("member", member);
		model.addAttribute("detail", ddto);

		return "payment/payment_list1";
	}

	//디테일 - 오더 페이지
	@RequestMapping(value = "order1", method={RequestMethod.GET, RequestMethod.POST})
	public String order1(@AuthenticationPrincipal PrincipalDetails user, HttpServletRequest request, Model model, PaymentDTO pdto,MemberDTO mdto, ProductDTO pro, DetailDTO ddto) {

		HttpSession session = request.getSession();
		DetailDTO sessionddto = (DetailDTO)session.getAttribute("detail");
		MemberDTO sessionmember = (MemberDTO)session.getAttribute("member");
		StoreDTO sdto = new StoreDTO();
		sdto.setStoreName((String)session.getAttribute("storeName"));
		sdto.setStoreAddress((String)session.getAttribute("storeAddress"));
		String memberId = user.getUsername();
		MemberDTO member = this.paymentservice.getMember(memberId);
		
		//주문번호(랜덤함수)
		String orderNum = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		StringBuilder sb = new StringBuilder(15);
		for(int i=0; i<15; i++){
			int randomNum = random.nextInt(orderNum.length());
			sb.append(orderNum.charAt(randomNum));
		}
		String randomString = sb.toString();

		model.addAttribute("store", sdto);
		model.addAttribute("member", member);
		model.addAttribute("detail", sessionddto);
		model.addAttribute("randomString", randomString);

		return "payment/payment_order1";
	}
	
	//(결제 상품차트)
	@GetMapping("/paymentchart")
    public String showpaymentChart(Model model) {
		List<Object[]> mostAddedProducts = this.paymentservice.getMostAddedProducts();
		model.addAttribute("mostAddedProducts",mostAddedProducts);
        
		return "payment/payment_chart";
    }
	
	//(결제 지역차트)
	@GetMapping("/paymentstorechart")
    public String showCartStoreChart(Model model) {
		List<Object[]> mostAddedStore = this.paymentservice.getMostAddedStore();
		model.addAttribute("mostAddedStore",mostAddedStore);
        
		return "payment/payment_storechart";
    }
	
	//(결제 매출차트)
	@GetMapping("/paymentrevenuechart")
    public String showRevenueChart(Model model) {
		List<Object[]> revenue = this.paymentservice.getRevenue();
		model.addAttribute("revenue",revenue);
        
		return "payment/payment_revenue";
    }

}