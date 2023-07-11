package com.foke.demo.dto;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "product")
@Entity
public class ProductDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	
	@Column(length = 100)
	private String productName;
	
	@Column(length = 20)
	private String productType;
	
	@Column(length = 200)
	private String productDetail;
	
	@Column(length = 20)
	private String productPrice;
	
	@Column(length = 20)
	private String productCalorie;
	
	@Column(length = 100, nullable = false)
	private String productImage;
	
	@Column(length = 20)
	private String productEname;
	
	@Column(length = 20, nullable = false)
	private String productLabel;
	
	@Transient
	private StockDTO quantity;
	
}
