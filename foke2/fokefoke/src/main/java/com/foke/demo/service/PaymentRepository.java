package com.foke.demo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
	//(결제 상품차트)
	@Query(value = "SELECT c.productName, SUM(c.cartCount) AS total FROM PaymentDTO c GROUP BY c.productName ORDER BY total DESC")
	List<Object[]> findMostAddedProducts();
	
	//(결제 지역차트)
	@Query(value = "SELECT c.storeName, SUM(c.cartCount) AS total FROM PaymentDTO c GROUP BY c.storeName ORDER BY total DESC")
	List<Object[]> findMostAddedStore();
	
	//(결제 매출차트)
	@Query(value = "SELECT p.paymentDay, SUM(p.totalPrice) AS total FROM PaymentDTO p GROUP BY p.paymentDay ORDER BY total")
    List<Object[]> findRevenue();
    
  //주문정보 페이징
    Page<PaymentDTO> findAll(Pageable pageable);
    
    List<PaymentDTO> findAll();
	
}