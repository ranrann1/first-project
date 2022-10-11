<%@page import="ez_phone.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword=request.getParameter("search");
	if(keyword==null) {
		keyword="";
	}
%>    
<%-- 관리자 관련 페이지를 요청한 경우 템플릿 페이지의 Header 영역에 포함될 JSP 문서 --%>
<%@include file="/security/admin_check.jspf" %>
<div id="header">
	<div id="header_top">
		<span style="color: white;"><%=loginMember.getName() %>님이&nbsp;접속중입니다.</span>&nbsp;&nbsp;
		<!-- <a href="index.jsp?workgroup=member&process=member_logout_action">로그아웃</a>&nbsp;&nbsp; -->
		<a href="index.jsp?workgroup=mypage&process=mypage" style="color:white">마이페이지</a>&nbsp;&nbsp;
		<a href="index.jsp?workgroup=main&process=main" style="color:white">쇼핑몰</a>&nbsp;&nbsp;
	</div>

	<div id="header_middle">
		
		<form action="index.jsp?workgroup=main&work=main" method="post" id="sch">
		<%-- select 태그에 의해 전달되는 값은 검색어를 비교하기 위한 컬럼명과 동일한 이름으로 전달되도록 설정 --%>
		<h1>
		
			<img src="<%=request.getContextPath()%>/images/EZPHONE.png"	width="30"> 
			<a href="index.jsp?workgroup=admin&process=manager">EZPHONE</a>&nbsp;&nbsp;
			<a href="index.jsp?workgroup=admin&process=product_sale"style="font-size: 20px; color: black">월별 판매량</a>
			&nbsp;&nbsp; 
			<a href="index.jsp?workgroup=admin&process=product_manager" style="font-size: 20px; color: black">제품관리</a>
			&nbsp;&nbsp; 
			<a href="index.jsp?workgroup=admin&process=member_manager" style="font-size: 20px; color: black">고객관리</a>
			&nbsp;&nbsp; 
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