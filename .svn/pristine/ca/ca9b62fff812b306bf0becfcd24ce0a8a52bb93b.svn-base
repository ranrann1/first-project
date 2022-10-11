<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보변경 또는 회원탈퇴를 위한 비밀번호를 입력하는 JSP 문서 --%>
<%-- => 로그인 사용자만 요청 가능한 JSP 문서 --%>
<%-- => [입력완료]을 클릭한 경우 전달값(action)에 따라 form 태그를 사용하여 회원정보 변경 
입력페이지(member_modify.jsp) 또는 회원탈퇴 처리페이지(member_remove_action.jsp)를 post 방식으로 
요청하여 비밀번호를 전달하여 페이지 이동 --%>
<%@include file="/security/login_check.jspf" %>
<%
	//전달값을 반환받아 저장
	String action=request.getParameter("action");

	//비정상적인 요청에 대한 응답 처리
	if(action==null || !action.equals("modify") && !action.equals("remove")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;		
	}
	
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
%>

<% if(action.equals("modify")) { %>
	<p>회원정보변경을 위해 비밀번호를 입력해 주세요.</p>
<% } else { %>
	<p>회원탈퇴를 위해 비밀번호를 입력해 주세요.</p>
<% } %>
<form method="post" name="passwordForm">
	<input type="password" name="passwd">
	<button type="button" onclick="submitCheck();">입력완료</button>
</form>
<p id="message" style="color: red;"><%=message %></p>

<script type="text/javascript">
passwordForm.passwd.focus();

function submitCheck() {
	if(passwordForm.passwd.value=="") {
		document.getElementById("message").innerHTML="비밀번호를 입력해 주세요.";
		passwordForm.passwd.focus();
		return;
	}
	
	//form 태그로 요청하는 웹프로그램의 URL 주소를 다르게 설정 
	<% if(action.equals("modify")) {//회원정보변경인 경우 %>
		passwordForm.action="index.jsp?workgroup=member&work=member_modify";
	<% } else { %>
		passwordForm.action="index.jsp?workgroup=member&work=member_remove_action";
	<% } %>
	
	passwordForm.submit();
}
</script>









