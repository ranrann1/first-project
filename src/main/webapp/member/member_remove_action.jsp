<%@page import="ez_phone.dao.MemberDAO"%>
<%@page import="ez_phone.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 비밀번호를 전달받아 로그인 사용자의 비밀번호와 비교하여 같은 경우 MEMBER 테이블에 저장된
회원정보를 탈퇴회원으로 회원상태를 변경하고 로그아웃 처리페이지(member_logout_action.jsp)로 
이동되도록 클라이언트에게 URL 주소를 전달하는 JSP 문서 --%>  
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
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//전달된 비밀번호와 로그인 사용자의 비밀번호를 비교하여 다른 경우
	if(!passwd.equals(loginMember.getPasswd())) {
		session.setAttribute("message", "비밀번호가 맞지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=member&process=password_confirm&action=remove';");
		out.println("</script>");
		return;	
	}
	
	//아이디와 상태정보를 전달받아 MEMBER 테이블에 저장된 회원의 상태정보를 변경하는 DAO 클래스의 메소드 호출
	MemberDAO.getDAO().updateStatus(loginMember.getId(), 0);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=member&process=member_logout_action';");
	out.println("</script>");
%>

