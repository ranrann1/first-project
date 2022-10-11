package ez_phone.dto;

/*
이름         널?       유형             
---------- -------- -------------- 
B_CODE     NOT NULL NUMBER(4)      - 글번호
ID                  VARCHAR2(50)   - 작성자(아이디)
B_TITLE    NOT NULL VARCHAR2(500)  - 글제목
B_CONTENT          VARCHAR2(2000) - 1:1문의 글내용
B_REPLY            VARCHAR2(2000) - 1:1문의 댓글 내용
B_DATE     NOT NULL DATE           - 작성일자
B_STATUS   NOT NULL NUMBER(1)      - 글상태 : 0(삭제글), 1(비밀글)
B_CHECK    NOT NULL NUMBER(1)	   - 답변상태 : 0(답변대기중), 1(답변완료)
 */


public class BoardDTO {
	private int b_code;
	private String id;
	private String b_title;
	private String b_content;
	private String b_reply;
	private String b_date;
	private int b_status;
	private int b_check;
	
	public BoardDTO() {
		
	}

	public int getB_code() {
		return b_code;
	}

	public void setB_code(int b_code) {
		this.b_code = b_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_reply() {
		return b_reply;
	}

	public void setB_reply(String b_reply) {
		this.b_reply = b_reply;
	}

	public String getB_date() {
		return b_date;
	}

	public void setB_date(String b_date) {
		this.b_date = b_date;
	}

	public int getB_status() {
		return b_status;
	}

	public void setB_status(int b_status) {
		this.b_status = b_status;
	}

	public int getB_check() {
		return b_check;
	}

	public void setB_check(int b_check) {
		this.b_check = b_check;
	}

}