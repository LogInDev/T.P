package com.fokefoke.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fokefoke.dto.CartDTO;
import com.fokefoke.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService{
	 
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int addCart(CartDTO cart) {
		
		//장바구니 데이터 체크
		CartDTO checkCart = cartMapper.checkCart(cart);
		
		if(checkCart != null) { //등록할려는 데이터가 DB에 존재 하는지 확인해 존재할 경우 2를 반환
			return 2; 
		}
		
		try {
			cartMapper.addCart(cart);	
			return 1; //장바구니 등록시 1을 반환
		} catch (Exception e) {
			return 0; //오류면 0을 반환
		}
			
	}
	@Override
	public List<CartDTO> getCartList(String memberId) { //장바구니 정보를 모두 가져오는 메서드
		List<CartDTO> cart = cartMapper.getCart(memberId);

		for(CartDTO dto : cart) { //List에 있는 cartDTO의 4개 변수 초기화
			dto.initTotal(); //CartDTO의 cartPrice, totalPrice, point, totalPoint값 세팅 메서드
		}
		return cart;
	}
	
	@Override
	public int modifyCount(CartDTO cart) {
		return cartMapper.modifyCount(cart);
	}
	
	@Override
	public int deleteCart(int cartId) {
		return cartMapper.deleteCart(cartId);
	}
}
