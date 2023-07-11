package com.foke.demo.dto;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Table(name = "stock")
@Entity
public class StockDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int quantityId;
	
	@Column
	private int quantity;
	
	@ManyToOne
	@JoinColumn(name = "productId")
	private ProductDTO productDTO;
	
	@ManyToOne
	@JoinColumn(name = "storeId")
	private StoreDTO storeDTO;
}