package com.foke.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

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
	//해당 db에 업데이트 하는 역할(장바구니)
	@Transactional
    public PaymentDTO updatePayment(int paymentId, int cartId) {
        int updated = this.paymentRepository.updatePaymentByPaymentId(paymentId, cartId);
        if (updated <= 0) {
            throw new RuntimeException("Failed to update payment with paymentId: " + paymentId);
        }
        return this.paymentRepository.findPaymentByPaymentIdAndCartId(paymentId, cartId);
    }


	//해당 db에 업데이트 하는 역할(스토어)
//	public PaymentDTO updatePaymentStore(int paymentId, int storeId) {
//	    int updated = this.paymentRepository.updatePaymentByPaymentIdAndStoreId(paymentId, storeId);
//	    if (updated > 0) {
//	        PaymentDTO updatedPayment = this.paymentRepository.findPaymentByPaymentIdAndStoreId(paymentId, storeId);
//	        if (updatedPayment != null && updatedPayment.getStoreId().equals(storeId)) {
//	            return updatedPayment;
//	        }
//	    }
//	    return null;
//	}
//	public PaymentDTO updatePaymentStore(int paymentId, int storeId) {
//	    int updated = this.paymentRepository.updatePaymentByPaymentIdAndStoreId(paymentId, storeId);
//	    if (updated > 0) {
//	        PaymentDTO updatedPayment = this.paymentRepository.findPaymentByPaymentIdAndStoreId(paymentId, storeId);
//	        if (updatedPayment != null && updatedPayment.getStoreId().equals(storeId)) {
//	            return updatedPayment;
//	        }
//	    }
//	    return null;
//	}



	//해당 db에 업데이트 하는 역할(디테일)
//	public PaymentDTO updatePayment2(int paymentId, int fokeingredientId) {
//		int updated = this.paymentRepository.updatePaymentByPaymentId(paymentId, fokeingredientId);
//		if (updated > 0) {
//			PaymentDTO updatedPayment = this.paymentRepository.findById(paymentId).orElse(null);
//			if (updatedPayment != null && updatedPayment.getCartId() == fokeingredientId) {
//				return updatedPayment;
//			}
//		}
//		return null;
//	}
	//해당 db에 올리는 역할(save)
	public PaymentDTO savePayment(PaymentDTO paymentDTO) {
		return paymentRepository.save(paymentDTO);
	}


}
