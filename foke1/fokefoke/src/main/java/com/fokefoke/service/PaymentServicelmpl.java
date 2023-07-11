package com.fokefoke.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.fokefoke.dto.CartDTO;
import com.fokefoke.dto.MemberDTO;
import com.fokefoke.dto.PaymentDTO;
import com.fokefoke.mapper.CartMapper;
import com.fokefoke.mapper.PaymentMapper;


@Service
public class PaymentServicelmpl implements PaymentService{

	@Autowired
	private PaymentMapper mapper;

	public PaymentServicelmpl() {
		System.out.println("@BoardService스프링 자동생성");
	}

	@Override
	public MemberDTO getMember(MemberDTO member) {
		return mapper.getMember(member);
	}
	@Override
	public PaymentDTO getDetail(PaymentDTO dto) {
		return mapper.getDetail(dto);
	}
	@Override
	public PaymentDTO getPayment1(PaymentDTO dto) {
		return mapper.getPayment1(dto);
	}
//	@Override
//	public PaymentDTO getall(PaymentDTO dto) {
//		return mapper.getall(dto);
//	}
	@Override
	public List<CartDTO> getall(CartDTO cartdto) {
		return mapper.getall(cartdto);
	}
	@Override
	public CartDTO getCartall(CartDTO cartdto) {
		return mapper.getCartall(cartdto);
	}
	@Override
	public List<PaymentDTO> getmem(MemberDTO member) {
		return mapper.getmem(member);
	}
	@Override
	public List<Map<String, String>> getcart1(MemberDTO member) {
		return mapper.getcart1(member);
	}
	@Override
	public List<Map<String, String>> getdetail1(MemberDTO member) {
		return mapper.getdetail1(member);
	}
	@Override
	public PaymentDTO getCart(PaymentDTO dto) {
		return mapper.getCart(dto);
	}
	@Override
	public PaymentDTO getCartcount(PaymentDTO dto) {
		return mapper.getCartcount(dto);
	}
	@Override
	   public int updatePoint(MemberDTO member) {
	      return mapper.updatePoint(member);
	   }
	

}
