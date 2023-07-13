package com.foke.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foke.demo.dto.CartDTO;
import com.foke.demo.dto.DetailDTO;
import com.foke.demo.dto.ProductDTO;
//import com.fokefoke.dto.CartDTO;
//import com.fokefoke.dto.DetailDTO;
//import com.fokefoke.dto.ProductDTO;
//import com.fokefoke.service.CartService;
//import com.fokefoke.service.DetailService;
import com.foke.demo.service.CartService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/cart")
@RequiredArgsConstructor
@Controller
public class CartController {
	
	private final CartService cartService;
	
	
	//장바구니
	@RequestMapping(value = "/{memberId}", method = {RequestMethod.POST, RequestMethod.GET})
	public String cartPagePOST(@PathVariable("memberId") String memberId, Model model, HttpSession session) {
		memberId = (String)session.getAttribute("memberId");
		List<CartDTO> cartList = this.cartService.getCartList(memberId);		
		model.addAttribute("memberId", memberId);
		model.addAttribute("cartInfo", cartList);
		System.out.println("cartInfo 정보 : " + cartList);
		
		return "cart/cart";
	}
	
	
	//상품 추가
	@ResponseBody
	@PostMapping("/add")
	public int addCartPOST(Model model, @RequestParam Map<String, String> map, 
			DetailDTO dto, ProductDTO productDTO,
			@RequestParam(required = false, defaultValue="foke") List<String> toppingchk, 
			@RequestParam(required = false, defaultValue="foke") List<String> sourcechk, 
			@RequestParam(required = false, defaultValue="foke") List<String> extrachk, HttpSession session){
		
		if (!toppingchk.get(0).equals("foke")) {
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
		if (!sourcechk.get(0).equals("foke")) {
			for(int i=0;i<sourcechk.size();i++) {
				if(i==0) {
					dto.setAsource(sourcechk.get(i));
				}else if(i==1) {
					dto.setBsource(sourcechk.get(i));
				}
			}
		}
		if(!extrachk.get(0).equals("foke")) {
			for(int i=0;i<extrachk.size();i++) {
				if(i==0) {
					dto.setAextratopping(extrachk.get(i));
				}else if(i==1) {
					dto.setBextratopping(extrachk.get(i));
				}
			}
		}

		//List<DetailDTO> detailList =  this.detailService.getList();
		
		//member
		String memberId = (String)session.getAttribute("memberId");
		model.addAttribute("memberId",memberId);
		
		//store
	    String storeName = (String) session.getAttribute("storeName");
	    String storeAddress = (String) session.getAttribute("storeAddress");
		
		CartDTO cart = CartDTO.builder()
				.fokeingredientId(dto.getFokeingredientId())
				.productName(dto.getProductName())
				.base(dto.getBase())
				.atopping(dto.getAtopping())
				.btopping(dto.getBtopping())
				.ctopping(dto.getCtopping())
				.dtopping(dto.getDtopping())
				.asource(dto.getAsource())
				.bsource(dto.getBsource())
				.aextratopping(dto.getAextratopping())
				.bextratopping(dto.getBextratopping())
				.extramain(dto.getExtramain())
				.setbeverage(dto.getSetbeverage())
				.setside(dto.getSetside())
				.total(dto.getTotal())
				.price(dto.getPrice())
				.onePrice(dto.getPrice() / dto.getTotal())
				.cartImage(dto.getProductImage())
				.cartCount(dto.getTotal())
	            .storeName(storeName)
	            .storeAddress(storeAddress)
	            .memberId((String)session.getAttribute("memberId"))
			    .build();
		cart.initTotal(); // initTotal() 호출
	    
	    List<CartDTO> cartList = new ArrayList<>();
	    cartList.add(cart);
	    session.setAttribute("cartList", cartList);

		
		int result = this.cartService.addCart(cart);
		
		return result;
	}
	
	//상품 수량 업데이트
	@ResponseBody
	@PostMapping(value = "/update")
	public String updateCartPOST(@RequestParam("cartId") int cartId,
	                              @RequestParam("cartCount") int cartCount,
	                              @RequestParam("memberId") String memberId) {
	    CartDTO cart = new CartDTO();
	    cart.setCartId(cartId);
	    cart.setCartCount(cartCount);
	    cart.setMemberId(memberId);

	    int result = this.cartService.modifyCount(cart);
	    return String.valueOf(result);
	}
	
	//상품삭제
	@PostMapping("/delete")
	public String deleteCartPOST(CartDTO cart, @RequestParam("cartId") int cartId, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		cart.setMemberId(memberId);
		System.out.println("cartId : " + cartId);
		System.out.println("cartMemberId : " + memberId);
		
		this.cartService.deleteCart(cartId);
		
		return "redirect:/cart/" + memberId;
	}
	
	//차트
	@GetMapping("/cartchart")
    public String showCartChart(Model model) {
		List<Object[]> mostAddedProducts = this.cartService.getMostAddedProducts();
		model.addAttribute("mostAddedProducts",mostAddedProducts);
        
		return "cart/cartchart";
    }
	
	@GetMapping("/cartstorechart")
    public String showCartStoreChart(Model model) {
		List<Object[]> mostAddedStore = this.cartService.getMostAddedStore();
		model.addAttribute("mostAddedStore",mostAddedStore);
        
		return "cart/cartstorechart";
    }

}
