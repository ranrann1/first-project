package ez_phone.dto;

public class CartDTO {
	private String c_code;
	
	private String id;
	private String name;
	private String zipcode;
	private String address_1;
	private String address_2;
	
	private String p_code;
	private String p_name;
	private String p_color;
	private String p_size;
	private String p_image;
	private int p_price;
	private int p_stock;
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public CartDTO(String c_code, String id, String p_code) {
		super();
		this.c_code = c_code;
		this.id = id;
		this.p_code = p_code;
	}



	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress_1() {
		return address_1;
	}

	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}

	public String getAddress_2() {
		return address_2;
	}

	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_color() {
		return p_color;
	}

	public void setP_color(String p_color) {
		this.p_color = p_color;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
}
