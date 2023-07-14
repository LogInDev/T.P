package dto;

public class CartDTO {

	// cart �뀒�씠釉� 蹂��닔
	private int cartId;
	private String memberId;
	private int productId;
	private int productCount;
	private String productSize;
	private String productColor;

	// product �뀒�씠釉� 蹂��닔
	private String p_name;
	private String p_unitPrice;
	private String p_fileName;
	
	// 異붽�
	private int totalPrice;

	// 寃뚰꽣�꽭�꽣, setTotal�� 留뚮뱾吏� �븡�쓬 -> 諛붾줈 �븘�옒 initTotalPrice() 李멸퀬
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



	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_unitPrice() {
		return p_unitPrice;
	}

	public void setP_unitPrice(String p_unitPrice) {
		this.p_unitPrice = p_unitPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public String getProductSize() {
		return productSize;
	}

	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}

	public String getProductColor() {
		return productColor;
	}

	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	
	

	public String getP_fileName() {
		return p_fileName;
	}

	public void setP_fileName(String p_fileName) {
		this.p_fileName = p_fileName;
	}

	// �냼怨�
	public int initTotalPrice() {
		String price = p_unitPrice.replace(",", "");
		this.totalPrice = Integer.parseInt(price)*this.productCount;
		return totalPrice;
	}

	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", productId=" + productId + ", productCount="
				+ productCount + ", productSize=" + productSize + ", productColor=" + productColor + ", p_name="
				+ p_name + ", p_unitPrice=" + p_unitPrice + "]";
	}


	
	
}
