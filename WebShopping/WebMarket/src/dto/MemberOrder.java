
package dto;

public class MemberOrder {
	
//	shippingInfo form에서 받아서 전달하는 값
	String totalPrice = "";
	String email = "";
	String orderMsg = "";
	String addressee = "";
	String extraAddr = "";
	String status = "";
	
//	member table에서 가져오는값
	String phone = "";
	String address = "";
	String name = "";
	
//	product table에서 가져오는값
	String p_fileName = "";
	String p_description = "";
	String p_name = ""; 
	String p_unitPrice = "";

//  cart table에서 가져오는값
	String productCount = "";
	String productSize = "";
	String productColor = "";

// 	orders table에서 가져오는값
	int cart_Id = 0;
	String create_timestamp = "";
	String orderId = "";
	String memberId = "";

	
	
	public MemberOrder() {
	}
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getProductCount() {
		return productCount;
	}

	public void setProductCount(String productCount) {
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



	public String getAddress() {
		return address;
	}


	
	public void setAddress(String address) {
		this.address = address;
	}



	public String getOrderId() {
		return orderId;
	}



	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}



	public String getCreate_timestamp() {
		return create_timestamp;
	}

	public void setCreate_timestamp(String create_timestamp) {
		this.create_timestamp = create_timestamp;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	public String getAddressee() {
		return addressee;
	}

	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}

	
	public String getExtraAddr() {
		return extraAddr;
	}

	public void setExtraAddr(String extraAddr) {
		this.extraAddr = extraAddr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemberAddr() {
		return address;
	}

	public void setMemberAddr(String memberAddr) {
		this.address = memberAddr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getP_fileName() {
		return p_fileName;
	}

	public void setP_fileName(String p_fileName) {
		this.p_fileName = p_fileName;
	}
	
	public String getP_description() {
		return p_description;
	}

	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	
	public int getCart_Id() {
		return cart_Id;
	}

	public void setCart_Id(int cart_Id) {
		this.cart_Id = cart_Id;
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

	
	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
	public String getOrderMsg() {
		return orderMsg;
	}

	public void setOrderMsg(String orderMsg) {
		this.orderMsg = orderMsg;
	}

	@Override
	public String toString() {
		return "MemberOrder [totalPrice=" + totalPrice + ", email=" + email + ", orderMsg=" + orderMsg + ", addressee="
				+ addressee + ", extraAddr=" + extraAddr + ", status=" + status + ", phone=" + phone + ", address="
				+ address + ", name=" + name + ", p_fileName=" + p_fileName + ", p_description=" + p_description
				+ ", p_name=" + p_name + ", p_unitPrice=" + p_unitPrice + ", productCount=" + productCount
				+ ", productSize=" + productSize + ", productColor=" + productColor + ", cart_Id=" + cart_Id
				+ ", create_timestamp=" + create_timestamp + ", orderId=" + orderId + ", memberId=" + memberId + "]";
	}
	
}
