package com.fokefoke.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fokefoke.dto.CartDTO;
import com.fokefoke.dto.DetailDTO;
import com.fokefoke.dto.MemberDTO;
import com.fokefoke.dto.PaymentDTO;
import com.fokefoke.dto.ProductDTO;
import com.fokefoke.dto.StoreDTO;
import com.fokefoke.service.CartService;
import com.fokefoke.service.DetailService;
import com.fokefoke.service.MemberService;
import com.fokefoke.service.PaymentService;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);

	@Autowired
	PaymentService service;
	DetailService detailService;
	MemberService memberService;
	
	@Autowired
	CartService cartService;

	DetailDTO detail = new DetailDTO();

	public PaymentController() {
		System.out.println("@Controller 스프링 자동생성");
	}

//	@RequestMapping(value = "/payment/payment", method = {RequestMethod.POST, RequestMethod.GET})
//	public ModelAndView payment(HttpServletRequest request, PaymentDTO paymentDTO, DetailDTO dto, ProductDTO pro, MemberDTO member, CartDTO cdto,  @RequestParam(required = false) List<String> toppingchk, 
//			@RequestParam(required = false) List<String> sourcechk, @RequestParam(required = false) List<String> extrachk, @RequestParam("memberId") String memberId) {
	
	//카트 결제내역
	@RequestMapping(value = "/payment/payment", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payment(HttpServletRequest request, PaymentDTO paymentDTO, ProductDTO pro, MemberDTO member, @RequestParam(required = false) List<String> cartId ) {

		//		int rs = detailService.insertDetail(dto);
		//		PaymentDTO pcart = this.service.getCart(paymentDTO);

		HttpSession session = request.getSession();
		StoreDTO sdto = new StoreDTO();
		/*
		 * sdto.setStoreName((String)session.getAttribute("storeName"));
		 * sdto.setStoreAddress((String)session.getAttribute("storeAddress"));
		 */
		String memberId = (String)session.getAttribute("memberId");
		member.setMemberId(memberId);
		MemberDTO pmember = this.service.getMember(member);
		PaymentDTO pay = new PaymentDTO();
		pay.setMemberId((String)session.getAttribute("memberId"));
		ModelAndView mav = new ModelAndView();
		List<CartDTO> cartList = cartService.getCartList(memberId);
		List<CartDTO> lists = new ArrayList<CartDTO>();
		for(int j=0; j<cartList.size();j++) {
			for(int i=0; i<cartId.size();i++) {
				if(cartList.get(j).getCartId()==Integer.parseInt(cartId.get(i))) {
					System.out.println("??????" + cartList.get(j));
					lists.add(cartList.get(j));
					sdto.setStoreAddress(cartList.get(j).getStoreAddress());
		            sdto.setStoreName(cartList.get(j).getStoreName());
					
					
				}
			}
		}
		mav.addObject("cart", lists);
		mav.addObject("store", sdto);
		mav.addObject("member", pmember);
//		mav.addObject("cart", cdto);
		mav.setViewName("payment/payment");
		System.out.println("post---------------" + cartId);
		System.out.println("post---------------" + lists);

		HttpSession msession = request.getSession();
		msession.setAttribute("member", pmember);

		return mav;  
	}
	//디테일 결제내역
	@RequestMapping(value = "/payment1", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payment1(HttpServletRequest request, PaymentDTO paymentDTO, DetailDTO dto, ProductDTO pro, MemberDTO member, @RequestParam(required = false) List<String> toppingchk, 
	        @RequestParam(required = false) List<String> sourcechk, @RequestParam(required = false) List<String> extrachk) {


		if (toppingchk != null) {
			for(int i=0;i<toppingchk.size();i++) {
				if(i==0) {
					dto.setAtopping(toppingchk.get(i));
				}else if(i==1) {
					dto.setBtopping(toppingchk.get(i));
				}else if(i==2) {
					dto.setCtopping(toppingchk.get(i));
				}else if(i==3) {
					dto.setDtopping(toppingchk.get(i));
				}
			}
		}
		if (sourcechk != null) {
			for(int i=0;i<sourcechk.size();i++) {
				if(i==0) {
					dto.setAsource(sourcechk.get(i));
				}else if(i==1) {
					dto.setBsource(sourcechk.get(i));
				}
			}
		}
		if(extrachk!=null) {
			for(int i=0;i<extrachk.size();i++) {
				if(i==0) {
					dto.setAextratopping(extrachk.get(i));
				}else if(i==1) {
					dto.setBextratopping(extrachk.get(i));
				}
			}
		}

		//		int rs = detailService.insertDetail(dto);
		//		PaymentDTO pcart = this.service.getCart(paymentDTO);

		HttpSession session = request.getSession();
		StoreDTO sdto = new StoreDTO();
		sdto.setStoreName((String)session.getAttribute("storeName"));
		sdto.setStoreAddress((String)session.getAttribute("storeAddress"));
		String memberId = (String)session.getAttribute("memberId");
		member.setMemberId(memberId);
		MemberDTO pmember = this.service.getMember(member);
		

		detail = dto;
		PaymentDTO pay = new PaymentDTO();
		pay.setMemberId((String)session.getAttribute("memberId"));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("store", sdto);
		mav.addObject("detail", dto);
		mav.addObject("pmember", pmember);
		mav.addObject("member", member);
		mav.setViewName("payment/payment1");
		System.out.println("post---------------" + memberId);

		HttpSession msession = request.getSession();
		msession.setAttribute("member", pmember);

		return mav;  
	}
	
	
	@RequestMapping(value = "/payment/orderView", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView orderView(HttpServletRequest request, ProductDTO pro, MemberDTO member,  @RequestParam(required = false) List<String> cartId) {

//		PaymentDTO pdetail = this.service.getDetail(paymentDTO);
		//PaymentDTO pcart = this.service.getCart(paymentDTO);
		HttpSession session = request.getSession();
		StoreDTO sdto = new StoreDTO();
		sdto.setStoreName((String)session.getAttribute("storeName"));
		sdto.setStoreAddress((String)session.getAttribute("storeAddress"));
		String memberId = (String)session.getAttribute("memberId");
		member.setMemberId(memberId);

		//payment페이지에 있는 member 정보를 세션으로 받아옴
		HttpSession msession = request.getSession();
		MemberDTO pmember = (MemberDTO)msession.getAttribute("member");
		int rs = this.service.updatePoint(member);
		member = this.service.getMember(member);
		
		PaymentDTO pay = new PaymentDTO();
		pay.setMemberId((String)session.getAttribute("memberId"));

		ModelAndView mav = new ModelAndView();
		List<CartDTO> cartList = cartService.getCartList(memberId);
		List<CartDTO> lists = new ArrayList<CartDTO>();
		for(int j=0; j<cartList.size();j++) {
			for(int i=0; i<cartId.size();i++) {
				if(cartList.get(j).getCartId()==Integer.parseInt(cartId.get(i))) {
					System.out.println("??????" + cartList.get(j));
					lists.add(cartList.get(j));
					sdto.setStoreAddress(cartList.get(j).getStoreAddress());
		            sdto.setStoreName(cartList.get(j).getStoreName());
					
					
				}
			}
		}
		mav.addObject("cart", lists);
		System.out.println("}}}}}}}}}}" + cartId);
		mav.addObject("cart", lists);
		mav.addObject("store", sdto);
		mav.addObject("pmember", pmember);
		mav.addObject("member", member);
		//	    mav.addObject("cart", pcart2);
		mav.setViewName("payment/orderView");

		//	    System.out.println(pcart2);
		System.out.println("tlwwkr++++++++++++++++++++++++++"+sdto);
		System.out.println(pmember);
		System.out.println(detail);
		System.out.println(member);
		
		return mav;  
	}
	//디테일 오더 뷰
	@RequestMapping(value = "/payment/orderView1", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView orderViewdetail(HttpServletRequest request, PaymentDTO paymentDTO, DetailDTO dto, ProductDTO pro, MemberDTO member) {

		PaymentDTO pdetail = this.service.getDetail(paymentDTO);
		//PaymentDTO pcart = this.service.getCart(paymentDTO);
		HttpSession session = request.getSession();
		StoreDTO sdto = new StoreDTO();
		sdto.setStoreName((String)session.getAttribute("storeName"));
		sdto.setStoreAddress((String)session.getAttribute("storeAddress"));
		String memberId = (String)session.getAttribute("memberId");
		member.setMemberId(memberId);

		//payment페이지에 있는 member 정보를 세션으로 받아옴
		HttpSession msession = request.getSession();
		MemberDTO pmember = (MemberDTO)msession.getAttribute("member");
		int rs = this.service.updatePoint(member);
		member = this.service.getMember(member);
		PaymentDTO pay = new PaymentDTO();
		pay.setMemberId((String)session.getAttribute("memberId"));

		ModelAndView mav = new ModelAndView();
		mav.addObject("store", sdto);
		mav.addObject("pmember", pmember);
		mav.addObject("member", member);
		mav.addObject("detail", detail);
		mav.setViewName("payment/orderView1");

		//	    System.out.println(pcart2);
		System.out.println("tlwwkr++++++++++++++++++++++++++"+sdto);
		System.out.println("tlwwkr++++++++++++++++++++++++++"+rs);
		System.out.println(pmember);
		System.out.println(detail);
		System.out.println(member);
		return mav;  
	}
	

}