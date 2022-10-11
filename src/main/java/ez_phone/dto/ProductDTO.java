package ez_phone.dto;

public class ProductDTO {
	private String p_code;
	private String p_name;
	private String p_image;
	private String p_image2;
	private int p_price;
	private int p_stock;
	private String p_color;
	private String p_size;

	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductDTO(String p_code, String p_name, String p_image, String p_image2, int p_price, int p_stock,
			String p_color, String p_size) {
		super();
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_image = p_image;
		this.p_image2 = p_image2;
		this.p_price = p_price;
		this.p_stock = p_stock;
		this.p_color = p_color;
		this.p_size = p_size;
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

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
	}

	public String getP_image2() {
		return p_image2;
	}

	public void setP_image2(String p_image2) {
		this.p_image2 = p_image2;
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
	
	
}
