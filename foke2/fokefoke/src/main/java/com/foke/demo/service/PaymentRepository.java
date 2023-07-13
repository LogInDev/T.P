package com.foke.demo.service;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.foke.demo.dto.MemberDTO;
import com.foke.demo.dto.PaymentDTO;

import jakarta.transaction.Transactional;

@Repository
public interface PaymentRepository extends JpaRepository<PaymentDTO, Integer> {
	List<PaymentDTO> findByPaymentIdAndMemberIdAndFokeingredientIdAndCartId(int paymentId, String memberId, int fokeingredientId, int cartId);
	
	//멤버 정보 가져오기
	@Query(value = "SELECT m FROM MemberDTO m WHERE m.memberId = :memberId")
	MemberDTO findPaymentMemberByMemberId(@Param("memberId") String memberId);
	//업데이트(장바구니)
	 @Modifying
	 @Query("UPDATE PaymentDTO p SET p.cartId = :cartId WHERE p.paymentId = :paymentId")
	 int updatePaymentByPaymentId(@Param("paymentId") int paymentId, @Param("cartId") int cartId);
	 @Query("SELECT p FROM PaymentDTO p WHERE p.paymentId = :paymentId AND p.cartId = :cartId")
	 PaymentDTO findPaymentByPaymentIdAndCartId(@Param("paymentId") int paymentId, @Param("cartId") int cartId);

	 
	 
	 
	 //업데이트(스토어)
//	 @Modifying
//	 @Transactional
//	 @Query("UPDATE PaymentDTO p SET p.storeId = :storeId WHERE p.paymentId = :paymentId")
//	 int updatePaymentByPaymentIdAndStoreId(int paymentId, int storeId);
//	 @Query("SELECT p FROM PaymentDTO p WHERE p.paymentId = :paymentId AND p.storeId = :storeId")
//	    PaymentDTO findPaymentByPaymentIdAndStoreId(@Param("paymentId") int paymentId, @Param("storeId") int storeId);
	 
	 
	 
	 
	 
	 
	 //업데이트(디테일)
//	 @Modifying
//	 @Transactional
//	 @Query("UPDATE PaymentDTO p SET p.fokeingredientId = :fokeingredientId WHERE p.paymentId = :paymentId")
//	 int updatePaymentByPaymentId2(int paymentId, int fokeingredientId);
//	 //새로운 메서드 추가
//	 @Query("SELECT p FROM PaymentDTO p WHERE p.paymentId = :paymentId AND p.fokeingredientId = :fokeingredientId")
//	    PaymentDTO findPaymentByPaymentIdAndfokeingredientId(@Param("paymentId") int paymentId, @Param("fokeingredientId") int cartId);

}