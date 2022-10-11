package ez_phone.dto;

/*
이름          널?       유형             
----------- -------- -------------- 
CODE      NOT NULL NUMBER(4)    	- 글번호  
TITLE     NOT NULL VARCHAR2(500)	- 제목
REG_DATE  NOT NULL DATE        		- 작성일자
READCOUNT          NUMBER(4)     	- 조회수
CONTENT   NOT NULL VARCHAR2(4000) 	- 내용
STATUS             NUMBER(1) 		- 상태 : 0(삭제글), 1(일반글)
 */

public class NoticeDTO {
	private int num;
	private String title;
	private String regDate;
	private int readcount;
	private String content;
	private int status;
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
