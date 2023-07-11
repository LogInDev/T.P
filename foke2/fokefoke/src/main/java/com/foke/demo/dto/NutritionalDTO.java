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
@Table(name = "nutritional")
@Entity
public class NutritionalDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int nutritionalId;
	
	@Column
	int productId;
	
	@Column(length = 20, nullable = false)
	String productName;
	
	@Column
	int weight;
	
	@Column
	int calorie;
	
	@Column
	float protein;
	
	@Column
	float saturatedFat;
	
	@Column
	float sugarContent;
	
	@Column
	float sodium;
}