package com.fokefoke.dto;

import java.util.Date;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Data
public class PaymentDTO {
	int paymentId;
	String memberId;
	int cartId;
	int storeId;
	int fokeingredientId;
	String paymentAddress;
	String paymentPickup;
	int paymentTakeout;
	int point;
	String phone;
	String paymentCoupon;
	String paymentMethod;
	String paymentOrder;
	String paymentmoney;
	Date paymentDay;
	
}
