package com.foke.demo.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "fokeingredient")
@Entity
public class DetailDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int fokeingredientId;
	
	@Column(length = 100)
	private String memberId;
	
	@Column(length = 100)
	private String productName;
	
	@Column(length = 100, nullable = false)
	private String base;
	
	@Column(length = 100, nullable = false)
	private String atopping;
	
	@Column(length = 100, nullable = false)
	private String btopping;
	
	@Column(length = 100, nullable = false)
	private String ctopping;
	
	@Column(length = 100, nullable = false)
	private String dtopping;
	
	@Column(length = 100, nullable = false)
	private String asource;
	
	@Column(length = 100, nullable = false)
	private String bsource;
	
	@Column(length = 100, nullable = false)
	private String aextratopping;
	
	@Column(length = 100, nullable = false)
	private String bextratopping;
	
	@Column(length = 100, nullable = false)
	private String extramain;
	
	@Column(length = 100, nullable = false)
	private String setbeverage;
	
	@Column(length = 100, nullable = false)
	private String setside;

	@Column
	private int total=1;
	
	@Column
	private int price;
	
	@Column(nullable = false)
	private int onePrice;
	
	@Column(length = 100, nullable = false)
	private String productImage;

}
