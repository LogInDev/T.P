package com.foke.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.foke.demo.DataNotFoundException;
import com.foke.demo.dto.DetailDTO;
import com.foke.demo.dto.MemberDTO;
import com.foke.demo.dto.PaymentDTO;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class Paymentservice {

	private final PaymentRepository paymentRepository;

	public MemberDTO getMember(String memberId){
		return this.paymentRepository.findPaymentMemberByMemberId(memberId);
	}
	//해당 db에 올리는 역할(save)
	public PaymentDTO savePayment(PaymentDTO paymentDTO) {
		return paymentRepository.save(paymentDTO);
		
	}
	
    //결제 상품차트
    public List<Object[]> getMostAddedProducts() {
        return paymentRepository.findMostAddedProducts();
    }
    
    //결제 지역차트
    public List<Object[]> getMostAddedStore() {
    	return paymentRepository.findMostAddedStore();
    }
    
    //결제 매출차트
    public List<Object[]> getRevenue() {
    	return paymentRepository.findRevenue();
    }
    
  //주문정보 페이징
    public Page<PaymentDTO> getList(int page) {
    	List<Sort.Order> sorts = new ArrayList<>();
        sorts.add(Sort.Order.desc("paymentDay"));
        Pageable pageable = PageRequest.of(page, 6, Sort.by(sorts));
        return this.paymentRepository.findAll(pageable);
    }
    
    
    //주문정보 상세조회
    public PaymentDTO getpaymentdto(Integer id) {  
        Optional<PaymentDTO> payment = this.paymentRepository.findById(id);
        if (payment.isPresent()) {
            return payment.get();
        } else {
            throw new DataNotFoundException("payment not found");
        }
    }
    
    
    //주문취소
    public void delete(Integer id) {
    	paymentRepository.deleteById(id);
    }
}
