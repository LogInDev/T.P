package com.fokefoke.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

import com.fokefoke.dto.CartDTO;
import com.fokefoke.dto.DetailDTO;
import com.fokefoke.dto.MemberDTO;
import com.fokefoke.dto.PaymentDTO;

@Mapper
public interface PaymentMapper {
	


	public MemberDTO getMember(MemberDTO member);
	public PaymentDTO getDetail(PaymentDTO dto);
	public PaymentDTO getPayment1(PaymentDTO dto);
	//public PaymentDTO getall(PaymentDTO dto);
	public List<CartDTO> getall(CartDTO cartdto);
	public CartDTO getCartall(CartDTO cartdto);
	public List<PaymentDTO> getmem(MemberDTO member);
	public List<Map<String, String>> getcart1(MemberDTO member);
	public List<Map<String, String>> getdetail1(MemberDTO member);
	public PaymentDTO getCartcount(PaymentDTO dto);
	public PaymentDTO getCart(PaymentDTO dto);
	public int updatePoint(MemberDTO member);


	
}


