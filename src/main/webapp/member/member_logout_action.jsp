<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 후 로그인정보 입력페이지(member_login.jsp)로 이동하기 위한 정보를 
클라이언트에게 전달하는 JSP 문서 --%>    
<%
	//로그아웃 : 세션에 저장된 권한 관련 정보를 삭제하거나 세션를 언바인딩 처리
	//session.removeAttribute("loginMember");
	session.invalidate();
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=member&process=member_login';");
	out.println("</script>");
%>