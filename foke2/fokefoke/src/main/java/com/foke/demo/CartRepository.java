package com.foke.demo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.foke.demo.dto.CartDTO;

import jakarta.transaction.Transactional;

public interface CartRepository extends JpaRepository<CartDTO, Integer> {
	
	//(회원 리스트)
	List<CartDTO> findByMemberId(String memberId);
	
	//(추가)
	CartDTO findByMemberIdAndProductNameAndStoreName(String memberId, String productName, String storeName);

	//(추가) - fokeingredientId, storeId 없음
	//CartDTO findByMemberIdAndFokeingredientIdAndStoreId(String memberId, int fokeingredientId, int storeId);
	
	//(삭제)
	CartDTO findByCartId(int cartId);
	
	//(수정)
	@Modifying
    @Transactional
    @Query("UPDATE CartDTO c SET c.cartCount = :cartCount WHERE c.cartId = :cartId")
    int updateCartCount(@Param("cartCount") int cartCount, @Param("cartId") int cartId);
	
}
