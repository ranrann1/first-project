﻿<%@page import="ez_phone.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String keyword=request.getParameter("search");
	if(keyword==null) {
		keyword="";
	}
	//세션에 저장된 권한 관련 정보(회원정보)를 반환받아 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
%>
<div id="header">
	<div id="header_top">
		<% if(loginMember==null) { //비로그인 사용자인 경우 %>
		<a
			href="index.jsp?workgroup=member&process=member_login&login_state=1" style="color:white">로그인</a>&nbsp;&nbsp;
		<a href="index.jsp?workgroup=member&process=member_join"style="color:white">회원가입</a>&nbsp;&nbsp;
		<% } else {//로그인 사용자인 경우 %>
		<span style="color: white;"><%=loginMember.getName() %>님이&nbsp;접속중입니다.</span>&nbsp;&nbsp;
		<!-- <a href="index.jsp?workgroup=member&process=member_logout_action">로그아웃</a>&nbsp;&nbsp; -->
		<a href="index.jsp?workgroup=mypage&process=mypage" style="color:white">마이페이지</a>&nbsp;&nbsp;
		<% if(loginMember.getStatus()==9) {//로그인 사용자가 관리자인 경우 %>
		<a href="index.jsp?workgroup=admin&process=manager" style="color:white">관리자</a>&nbsp;&nbsp;
		<% } %>
		<% } %>

	</div>

	<div id="header_middle">
		
		<form action="index.jsp?workgroup=main&work=main" method="post" id="sch">
		<%-- select 태그에 의해 전달되는 값은 검색어를 비교하기 위한 컬럼명과 동일한 이름으로 전달되도록 설정 --%>
		<h1>
		
			<img src="<%=request.getContextPath()%>/images/EZPHONE.png"
				width="30"> <a href="index.jsp?workgroup=main&process=main">EZPHONE</a>&nbsp;&nbsp;
			<a href="index.jsp?workgroup=samsung&process=s_list"
				style="font-size: 20px; color: black">삼성 갤럭시</a>&nbsp;&nbsp; <a
				href="index.jsp?workgroup=apple&process=a_list"
				style="font-size: 20px; color: black">애플 아이폰</a> &nbsp;&nbsp; <a
				href="index.jsp?workgroup=notice&process=notice_list"
				style="font-size: 20px; color: black">공지사항</a> &nbsp;&nbsp; 
				
				<a href="index.jsp?workgroup=member&process=member_logout_action" style="font-size: 20px; color: black"> 
				<img src="<%=request.getContextPath() %>/images/logout.png" width="30" style="float: right; text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;
			</a>
			<a href="index.jsp?workgroup=board&process=board_list">
				<img src="<%=request.getContextPath()%>/images/contact.png"	width="40" style="float: right">
			</a>
			<a href="index.jsp?workgroup=cart_menu&process=cart"style="font-size: 20px; color: black"> 
				<img src="<%=request.getContextPath()%>/images/cart.png" width="40" style="float: right">
			</a>
		<input type="text" name="keyword" placeholder="핸드폰 검색" >
		<button type="submit">검색</button>
		</h1>
	</form> 
		<hr>
	</div>
</div>