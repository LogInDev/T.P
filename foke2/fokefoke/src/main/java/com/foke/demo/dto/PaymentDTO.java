package com.foke.demo.dto;

import java.time.LocalDateTime;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "payment")
//@NoArgsConstructor //파라미터가 없는 기본 생성자 만들어줌
public class PaymentDTO {
	

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int paymentId;
    
    @Column(length = 100)
    private String memberId;
    
    @Column(nullable = false)
    private int cartId;
    
    @Column(nullable = false)
    private int storeId;
    
    @Column(nullable = false)
    private int fokeingredientId;
    
    @Column(length = 255)
    private String paymentAddress;
    
    @Column(length = 255)
    private String paymentPickup;
    
    @Column(nullable = false)
    private int point;
    
    @Column(length = 20)
    private String phone;
    
    @Column
    private LocalDateTime paymentDay;

}
