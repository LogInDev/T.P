package ListDAO;


public class ProductDTO {
		
	private int p_id;	
	private String p_name;	
	private String p_unitPrice;	
	private String p_category;	
	private String p_manufacturer;	
	private String p_fileName;
	private String p_description;
	private String p_gender;
	private String p_size;
	private String p_color;
	private String Quantity;
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
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
	public String getP_category() {
		return p_category;
	}
	public void setP_category(String p_category) {
		this.p_category = p_category;
	}
	public String getP_manufacturer() {
		return p_manufacturer;
	}
	public void setP_manufacturer(String p_manufacturer) {
		this.p_manufacturer = p_manufacturer;
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
	public String getP_gender() {
		return p_gender;
	}
	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getQuantity() {
		return Quantity;
	}
	public void setQuantity(String quantity) {
		Quantity = quantity;
	}
	@Override
	public String toString() {
		return "ProductDTO [p_id=" + p_id + ", p_name=" + p_name + ", p_unitPrice=" + p_unitPrice + ", p_category="
				+ p_category + ", p_manufacturer=" + p_manufacturer + ", p_fileName=" + p_fileName + ", p_description="
				+ p_description + ", p_gender=" + p_gender + ", p_size=" + p_size + ", p_color=" + p_color
				+ ", Quantity=" + Quantity + "]";
	}
	
	
	
}
