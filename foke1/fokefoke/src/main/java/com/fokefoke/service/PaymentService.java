package com.fokefoke.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fokefoke.dto.CartDTO;
import com.fokefoke.dto.MemberDTO;
import com.fokefoke.dto.PaymentDTO;
import com.fokefoke.mapper.PaymentMapper;


public interface PaymentService {
	
	public MemberDTO getMember(MemberDTO member);
	public PaymentDTO getDetail(PaymentDTO dto);
	public PaymentDTO getPayment1(PaymentDTO dto);
	//public PaymentDTO getall(PaymentDTO dto);
	public List<CartDTO> getall(CartDTO cartdto);
	public CartDTO getCartall(CartDTO cartdto);
	public List<PaymentDTO> getmem(MemberDTO member);
	public List<Map<String, String>> getcart1(MemberDTO member);
	public List<Map<String, String>> getdetail1(MemberDTO member);
	public PaymentDTO getCart(PaymentDTO dto);
	public PaymentDTO getCartcount(PaymentDTO dto);
	public int updatePoint(MemberDTO member);

	
}
