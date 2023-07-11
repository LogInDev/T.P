package com.fokefoke.dto;

public class CartDTO {
	private int cartId;
	private String memberId;
	private int fokeingredientId;
	private int storeId;
	private int cartCount;
	
	//fokeingredient 테이블
	private String productName;
	private String base;
	private String atopping;
	private String btopping;
	private String ctopping;
	private String dtopping;
	private String asource;
	private String bsource;
	private String aextratopping;
	private String bextratopping;
	private String extramain;
	private String setbeverage;
	private String setside;
	private int total; //수량
	private int price;
	private int onePrice;
	
	//member테이블
	private int point;
	
	//store 테이블
	private String storeName;
	private String storeAddress;
	
	//추가(가격)
	private int totalPrice; //(+배송비)

	//추가(포인트)
	private int totalPoint;
	
	//추가(상품이미지)
	private String cartImage;

	public int getCartId() {
		return cartId;
	}


	public void setCartId(int cartId) {
		this.cartId = cartId;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public int getFokeingredientId() {
		return fokeingredientId;
	}


	public void setFokeingredientId(int fokeingredientId) {
		this.fokeingredientId = fokeingredientId;
	}


	public int getStoreId() {
		return storeId;
	}


	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}


	public int getCartCount() {
		return cartCount;
	}


	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getBase() {
		return base;
	}


	public void setBase(String base) {
		this.base = base;
	}


	public String getAtopping() {
		return atopping;
	}


	public void setAtopping(String atopping) {
		this.atopping = atopping;
	}


	public String getBtopping() {
		return btopping;
	}


	public void setBtopping(String btopping) {
		this.btopping = btopping;
	}


	public String getCtopping() {
		return ctopping;
	}


	public void setCtopping(String ctopping) {
		this.ctopping = ctopping;
	}


	public String getDtopping() {
		return dtopping;
	}


	public void setDtopping(String dtopping) {
		this.dtopping = dtopping;
	}


	public String getAsource() {
		return asource;
	}


	public void setAsource(String asource) {
		this.asource = asource;
	}


	public String getBsource() {
		return bsource;
	}


	public void setBsource(String bsource) {
		this.bsource = bsource;
	}


	public String getAextratopping() {
		return aextratopping;
	}


	public void setAextratopping(String aextratopping) {
		this.aextratopping = aextratopping;
	}


	public String getBextratopping() {
		return bextratopping;
	}


	public void setBextratopping(String bextratopping) {
		this.bextratopping = bextratopping;
	}


	public String getExtramain() {
		return extramain;
	}


	public void setExtramain(String extramain) {
		this.extramain = extramain;
	}


	public String getSetbeverage() {
		return setbeverage;
	}


	public void setSetbeverage(String setbeverage) {
		this.setbeverage = setbeverage;
	}


	public String getSetside() {
		return setside;
	}


	public void setSetside(String setside) {
		this.setside = setside;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public String getStoreAddress() {
		return storeAddress;
	}


	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int cartPrice) {
		this.price = cartPrice;
	}
	
	public int getOnePrice() {
		return onePrice;
	}


	public void setOnePrice(int onePrice) {
		this.onePrice = onePrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public int getPoint() {
		return point;
	}


	public int getTotalPoint() {
		return totalPoint;
	}
	
	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}
	
	public String getCartImage() {
		return cartImage;
	}


	public void setCartImage(String cartImage) {
		this.cartImage = cartImage;
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


	public void initTotal() {
		//this.cartCount = this.total;
		this.totalPrice = this.onePrice * this.cartCount;
		this.point = (int)(Math.floor(this.onePrice*0.05));
		this.totalPoint = this.point * this.cartCount;
	}
	
}
