package com.fokefoke.service;

import java.util.List;

import com.fokefoke.dto.CartDTO;

public interface CartService {
	
	/* 장바구니 추가 */
	public int addCart(CartDTO cart);
	
	/*장바구니 정보 리스트 */ 
	public List<CartDTO> getCartList(String memberId); 
	//장바구니 페이지의 사용자 장바구니 정보를 반환
	
	/* 장바구니 수량 수정 */
	public int modifyCount(CartDTO cart);
	
	/* 장바구니 삭제 */
	public int deleteCart(int cartId);
	
}
