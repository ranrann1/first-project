package ez_phone.dto;

/*ID	VARCHAR2(50 BYTE)	No		1
PASSWD	VARCHAR2(50 BYTE)	No		2
NAME	VARCHAR2(50 BYTE)	No		3
ZIPCODE	VARCHAR2(10 BYTE)	No		4
ADDRESS_1	VARCHAR2(2000 BYTE)	No		5
ADDRESS_2	VARCHAR2(50 BYTE)	No		6
PHONE_NUMBER	VARCHAR2(20 BYTE)	No		7
E_MAIL	VARCHAR2(50 BYTE)	No		8
GRADE	NUMBER(38,0)	No		9
STATUS	NUMBER(38,0)	No		10*/


public class MemberDTO {
	private String id;
	private String passwd;
	private String name;
	private String zipcode;
	private String address_1;
	private String address_2;
	private String phone_number;
	private String e_mail;
	private int grade;
	private int status;
		
	public MemberDTO() {
		
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
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

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
