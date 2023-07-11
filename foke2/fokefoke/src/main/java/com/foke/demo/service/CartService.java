package com.foke.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.foke.demo.CartRepository;
import com.foke.demo.dto.CartDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CartService {

    private final CartRepository cartRepository;
    
    
    //상품추가
    public int addCart(CartDTO cart) {
    	CartDTO checkCart = this.cartRepository.findByMemberIdAndProductNameAndStoreName(cart.getMemberId(), cart.getProductName(), cart.getStoreName());
    	
    	if (checkCart != null) { //회원,주소,상품명 같으면 중복
    		return 2;
    	}
    	try {
    		cartRepository.save(cart);
    		return 1;
    	} catch (Exception e) {
    		return 0;
    	}
    }
    
    /* 장바구니 정보 리스트를 memberId로 조회 */
    public List<CartDTO> getCartList(String memberId) {
    	List<CartDTO> cartList = this.cartRepository.findByMemberId(memberId);
    	
    	return cartList;
    }
    
    /* 장바구니 상품삭제 */
    public int deleteCart(int cartId) {
    	CartDTO deleteCart = this.cartRepository.findByCartId(cartId);    	
    	
    	if (deleteCart != null) {
            cartRepository.delete(deleteCart);
            return cartId;
        } else {
            System.out.println("카트 찾을 수 없음");
            return -1;
        }
    }
    

    /* 장바구니 수량 수정 */
    public int modifyCount(CartDTO cart) {
        try {
            cartRepository.updateCartCount(cart.getCartCount(), cart.getCartId());
            return 1;  // 장바구니 수량 수정 성공 시 1을 반환
        } catch (Exception e) {
            return 0;  // 오류 발생 시 0을 반환
        }
    }
    
    
}
