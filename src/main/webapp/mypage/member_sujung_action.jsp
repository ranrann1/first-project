<%@page import="ez_phone.dao.MemberDAO"%>
<%@page import="ez_phone.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하고 회원정보 출력페이지
(member_mypage.jsp)로 이동되도록 클라이언트에게 URL 주소를 전달하는 JSP 문서 --%>      
<%-- => 로그인 사용자만 요청 가능한 JSP 문서 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&process=error_400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	if(passwd==null || passwd.equals("")) {//비밀번호 전달값이 없는 경우
		//로그인 사용자의 비밀번호를 변수에 저장 - 비밀번호 유지
		passwd=loginMember.getPasswd();
	} else {//비밀번호 전달값이 있는 경우
		//전달받은 비밀번호를 암호화 처리하여 변수에 저장 - 비밀번호 변경
		passwd=Utility.encrypt(passwd);
	}
	String name=request.getParameter("name");
	String e_mail=request.getParameter("mb_mail1")+"@" + request.getParameter("mb_mail2");
	String phone_number=request.getParameter("mb_hp1")+"-"
		+request.getParameter("mb_hp2")+"-"+request.getParameter("mb_hp3");
	
	//DTO 객체를 생성하여 반환받은 전달값으로 필드값 변경
	MemberDTO member= MemberDAO.getDAO().selectMember(id);
	
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setE_mail(e_mail);
	member.setPhone_number(phone_number);
	
	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateMember(member);
	
	//세션에 저장된 권한 관련 정보(회원정보) 변경
	session.setAttribute("loginMember", MemberDAO.getDAO().selectMember(id));
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=mypage&process=sujung';");
	out.println("</script>");
%>







