package com.foke.demo.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "store")
@Builder
public class StoreDTO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private	Long storeId;
	@Column(length = 20)
	private String storeName; 
	@Column(length = 100)
	private	String storeAddress;
	@Column(length = 20)
	private String storeTel;
	@Column(length = 20)
	private String storeOpen;
	@Column(length = 20)
	private String storeClose;
	private double storeLat;
	private	double storeLng;
}