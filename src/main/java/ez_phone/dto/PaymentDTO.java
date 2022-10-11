package ez_phone.dto;

/*
 * payment 테이블
 * 이름        널?       유형            
--------- -------- ------------- 
O_CODE    NOT NULL VARCHAR2(20)  주문번호(pk)
ID        NOT NULL VARCHAR2(50)  아이디(member fk)
P_CODE             VARCHAR2(50)  상품코드(product fk)
ZIPCODE            VARCHAR2(10)  우편번호
ADDRESS_1 NOT NULL VARCHAR2(200) 주소
ADDRESS_2 NOT NULL VARCHAR2(50)  상세주소
O_DATE    NOT NULL DATE          주문일자
O_CHECK   NOT NULL VARCHAR2(1)   주문확인 
*/


public class PaymentDTO {
	private String o_code;
	private String id;
	private String p_code;
	private String zipcode;
	private String address_1;
	private String address_2;
	private String o_date;
	private String o_check;
	
	private String p_name;
	private int p_price;
	
	public PaymentDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getO_code() {
		return o_code;
	}

	public void setO_code(String o_code) {
		this.o_code = o_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
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

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
	}

	public String getO_check() {
		return o_check;
	}

	public void setO_check(String o_check) {
		this.o_check = o_check;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	
	
}
