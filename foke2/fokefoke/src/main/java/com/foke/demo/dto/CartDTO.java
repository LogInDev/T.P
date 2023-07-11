package com.foke.demo.dto;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "cart")
@Entity
@Builder
public class CartDTO implements Serializable{
	
	private static final long serialVersionUID = 1L; //클래스를 구분하는데 사용(CartDTO 데이터를 전송하거나 저장할 때 발생문제 해결)
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cartId;
	
	@Column(length = 100)
	private String memberId;
	
	@Column
	private int fokeingredientId;
	
	@Column
	private int storeId;
	
	@Column
	private int cartCount;
	
	@Column(length = 100)
	private String productName;
	
	@Column(length = 100, nullable = true)
	private String base;
	
	@Column(length = 100, nullable = true)
	private String atopping;
	
	@Column(length = 100, nullable = true)
	private String btopping;
	
	@Column(length = 100, nullable = true)
	private String ctopping;
	
	@Column(length = 100, nullable = true)
	private String dtopping;
	
	@Column(length = 100, nullable = true)
	private String asource;
	
	@Column(length = 100, nullable = true)
	private String bsource;
	
	@Column(length = 100, nullable = true)
	private String aextratopping;
	
	@Column(length = 100, updatable=false)
	private String bextratopping;
	
	@Column(length = 100, nullable = true)
	private String extramain;
	
	@Column(length = 100, nullable = true)
	private String setbeverage;
	
	@Column(length = 100, nullable = true)
	private String setside;
	
	@Column(nullable = true)
	private Integer total;
	
	@Column(nullable = true)
	private Integer price;
	
	@Column(nullable = true)
	private Integer onePrice;
	
	//추가(한개의 포인트)
	@Column(nullable = true)
	private Integer point;
	
	//store 테이블
	@Column(length = 100, nullable = true)
	private String storeName;
	
	@Column(length = 100, nullable = true)
	private String storeAddress;
	
	//추가(가격)
	@Column(nullable = true)
	private Integer totalPrice; //(+배송비)

	//추가(포인트)
	@Column(nullable = true)
	private Integer totalPoint;
	
	//추가(상품이미지)
	@Column(length = 100, nullable = true)
	private String cartImage;
	
	public void initTotal() {
		this.totalPrice = this.onePrice * this.cartCount;
		this.point = (int)(Math.floor(this.onePrice*0.02));
		this.totalPoint = this.point * this.cartCount;
	}

	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", fokeingredientId=" + fokeingredientId
				+ ", storeId=" + storeId + ", cartCount=" + cartCount + ", productName=" + productName + ", base="
				+ base + ", atopping=" + atopping + ", btopping=" + btopping + ", ctopping=" + ctopping + ", dtopping="
				+ dtopping + ", asource=" + asource + ", bsource=" + bsource + ", aextratopping=" + aextratopping
				+ ", bextratopping=" + bextratopping + ", extramain=" + extramain + ", setbeverage=" + setbeverage
				+ ", setside=" + setside + ", total=" + total + ", price=" + price + ", onePrice=" + onePrice
				+ ", point=" + point + ", storeName=" + storeName + ", storeAddress=" + storeAddress + ", totalPrice="
				+ totalPrice + ", totalPoint=" + totalPoint + ", cartImage=" + cartImage + "]";
	}

}
