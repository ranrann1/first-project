
<%@page import="ez_phone.dao.MemberDAO"%>
<%@page import="ez_phone.dto.MemberDTO"%>
<%@page import="ez_phone.util.Utility"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 회원정보를 전달받아 MEMBER 테이블에 삽입하고 로그인 입력페이지(member_login.jsp)로 이동되도록
클라이언트에게 URL 주소를 전달하는 JSP 문서 --%>    
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		//include 태그에 의해 스레드가 이동된 JSP 문서에서는 response 객체를 이용하여 클라이언트에게
		//에러코드나 URL 주소 전달 불가능 - 자바스크립트를 이용하여 페이지 이동
		//response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
		//return;
		
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&process=error_400';");
		out.println("</script>");
		
		return;
	}

	//include 태그에 의해 스레드가 이동된 JSP 문서에서 request 객체를 이용하여 리퀘스트 관련
	//정보의 변경 불가능 - 요청 JSP 문서(템플릿 페이지 - index.jsp)에서 리퀘스트 관련 정보 변경
	//request.setCharacterEncoding("utf-8");
	
	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	//전달받은 비밀번호를 암호화 변환하여 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	String name=request.getParameter("name");
	String e_mail=request.getParameter("e_mail");
	String phone_number=request.getParameter("phone_number1")+"-"
		+request.getParameter("phone_number2")+"-"+request.getParameter("phone_number3");
	String zipcode=request.getParameter("zipcode");
	String address_1=request.getParameter("address_1");
	String address_2=Utility.stripTag(request.getParameter("address_2"));

	//DTO 객체를 생성하여 반환받은 전달값으로 필드값 변경
	MemberDTO member=new MemberDTO();
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setE_mail(e_mail);
	member.setPhone_number(phone_number);
	member.setZipcode(zipcode);
	member.setAddress_1(address_1);
	member.setAddress_2(address_2);
	
	
	

	//MEMBER 테이블에 회원정보를 삽입하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().insertMember(member);
	
	//로그인 입력페이지(member_login.jsp)로 이동 - 자바스크립트 이용
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=member&process=member_login';");
	out.println("</script>");
%>
