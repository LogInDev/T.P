package com.fokefoke.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fokefoke.dto.CartDTO;
import com.fokefoke.dto.DetailDTO;
import com.fokefoke.dto.ProductDTO;
import com.fokefoke.service.CartService;
import com.fokefoke.service.DetailService;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	public DetailService service;
	
	List<CartDTO> cartList = new ArrayList<CartDTO>();
	public CartController() {
		System.out.println("@CartController 스프링 자동생성");
	}
	
	
	@PostMapping("/cart/addex")
	public String addCartGet(CartDTO cart, DetailDTO dti) {
		int result = cartService.addCart(cart);		
		return result + "";
	}
	
	@PostMapping("/cart/add")
	@ResponseBody
	public int addCartPOST(HttpServletRequest request, DetailDTO dto, @RequestParam(required = false) List<String> toppingchk, 
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
		HttpSession session = request.getSession(); //로그인 여부 체크 + 로그인 되지 않으면 5 반환
		System.out.println("post---------------" + session.getAttribute("memberId"));
		System.out.println("post---------------" + session.getAttribute("storeId"));
		service.insertDetail(dto);
		List<DetailDTO> detailList =service.getFokeingredient(dto);
		
		CartDTO cart = new CartDTO();
		for(DetailDTO detail : detailList) {
			cart.setCartCount(detail.getTotal());
			cart.setCartImage(detail.getProductImage());
			cart.setMemberId((String)session.getAttribute("memberId"));
			cart.setStoreId(Integer.parseInt((String)session.getAttribute("storeId")));
			cart.setFokeingredientId(detail.getFokeingredientId());
			//cart.setCartImage(pdto.getProductImage());
			cartList.add(cart);
		}
		System.out.println("올린거---------------" + cartList);
		System.out.println("올린거cart---------------" + detailList);
		
		
		//카트등록
		int result = cartService.addCart(cart);
		System.out.println(result);
		
		return result;
	}
	
	@RequestMapping(value ="/cart/{memberId}", method = {RequestMethod.POST, RequestMethod.GET})
	public String cartPageGET(@PathVariable("memberId") String memberId, Model model) {
		List<CartDTO> cartList = cartService.getCartList(memberId);
		model.addAttribute("cartInfo", cartList);
		//Model객체의 addAttribute를 활용해 장바구니 데이터 전송
		return "/cart/cart";
	}
	
	@ResponseBody
	@RequestMapping(value ="/cart/update", method = {RequestMethod.POST, RequestMethod.GET})
	public String updateCartPOST(CartDTO cart) {
		
		int result = cartService.modifyCount(cart); //Service메서드 호출
		
		//return "redirect:/cart/cart/" + cart.getMemberId();
		return result + "";
	}
	
//	@PostMapping("/cart/delete")
//	@ResponseBody
//	public List<CartDTO> deleteCartPOST(CartDTO cart) {
//	    cartService.deleteCart(cart.getCartId());
//	    String memberId = cart.getMemberId();
//	    List<CartDTO> cartList = cartService.getCartList(memberId);
//	    return cartList;
//	}
	

	
	@RequestMapping(value ="/cart/delete", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteCartPOST(CartDTO cart, HttpServletRequest request) {
//	    cartService.deleteCart(cart.getCartId());
//	    redirectAttributes.addFlashAttribute("memberId", cart.getMemberId());
//	    return "redirect:/cart/{memberId}";
//	}
//	public String deleteCartPOST(CartDTO cart) {
//		
		HttpSession session = request.getSession();		
		cartService.deleteCart(cart.getCartId());
		cart.setMemberId((String)session.getAttribute("memberId"));
		
		//return result + "";
		//return result + "";
		return "redirect:/cart/" + cart.getMemberId();
	}
	
//	@PostMapping("/cart/delete")
//	public ModelAndView deleteCartPOST(CartDTO cart, HttpServletRequest request, Model model) {
//		List<CartDTO> cartList = cartService.getCartList(memberId);
//		model.addAttribute("cartInfo", cartList);
//		
//		HttpSession session = request.getSession();
//		String memberId = (String)session.getAttribute("memberId");
//	    
//		cartService.deleteCart(cart.getCartId());
//	    ModelAndView mav = new ModelAndView();
//	    mav.addObject("memberId", cart.getMemberId());
//	    mav.setViewName("cart/cart");
//	    return mav;
//	}
	
//	@PostMapping("/cart/delete")
//	public String deleteCartPOST(CartDTO cart, HttpServletRequest request) {
//	    HttpSession session = request.getSession();
//	    String memberId = (String) session.getAttribute("memberId");
//	    
//	    cartService.deleteCart(cart.getCartId());
//	    
//	    List<CartDTO> cartList = cartService.getCartList(memberId);
//	    session.setAttribute("cartList", cartList);
//
//	    return "redirect:/cart/cart/" + cart.getMemberId();
//	}
//	@PostMapping("/cart/delete/{memberId}")
//	public ModelAndView deleteCartPOST(@PathVariable("memberId") String memberId, CartDTO cart, HttpServletRequest request, Model model) {
//	    cartService.deleteCart(cart.getCartId());
//	    List<CartDTO> cartList = cartService.getCartList(memberId);
//	    model.addAttribute("cartInfo", cartList);
//	    
//	    ModelAndView mav = new ModelAndView();
//	    mav.addObject("memberId", cart.getMemberId());
//	    mav.setViewName("cart/cart");
//	    return mav;
//	}
}


