<%@page import="java.text.DecimalFormat"%>
<%@page import="ez_phone.dao.ProductDAO"%>
<%@page import="ez_phone.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품번호를 전달받아 PRODUCT 테이블에 저장된 제품정보를 검색하여 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 관리자만 요청 가능한 JSP 문서 --%>
<%-- => [제품정보변경]을 클릭한 경우 제품정보 변경값 입력페이지(product_modify.jsp)를 요청하여
이동하며 제품번호 전달 --%>
<%@include file="/security/admin_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리
	

	//전달값을 반환받아 저장
	String p_code=request.getParameter("p_code");
	
	//제품번호를 전달받아 PRODUCT 테이블에 저장된 제품정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	ProductDTO product=ProductDAO.getDAO().selectProduct(p_code);
	
	//검색된 제품정보가 없는 경우 에러페이지로 이동 - 비정상적인 요청
	
%>
<style type="text/css">
table {
	margin: 0 auto; 
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

.title {
	background-color: black;
	color: white;
	text-align: center;
	width: 100px;
}

.value {
	padding: 5px;
	text-align: left;
	width: 500px;
}
</style>

<h2>제품상세정보</h2>
<table>
	<tr>
		<td class="title">제품번호</td>
		<td class="value"><%=product.getP_code() %></td>
	</tr>
	<tr>
		<td class="title">제품명</td>
		<td class="value"><%=product.getP_name() %></td>
	</tr>
	<tr>
		<td class="title">대표이미지</td>
		<td class="value">
			<img src="<%=request.getContextPath()%>/images_product_all/<%=product.getP_image() %>" width="200">
		</td>
	</tr>
	<tr>
		<td class="title">상세이미지</td>
		<td class="value">
			<img src="<%=request.getContextPath()%>/images_product_all/<%=product.getP_image2() %>" width="400">
		</td>	
	</tr>
	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=DecimalFormat.getInstance().format(product.getP_price()) %>원</td>
	</tr>	
	<tr>
		<td class="title">제품수량</td>
		<td class="value"><%=DecimalFormat.getInstance().format(product.getP_stock()) %></td>
	</tr>
	<tr>
		<td class="title">제품색상</td>
		<td class="value"><%=product.getP_color() %></td>
	</tr>
	<tr>
		<td class="title">제품용량</td>
		<td class="value"><%=product.getP_size() %></td>
	</tr>
</table>

<p>
	<button type="button" onclick="location.href='index.jsp?workgroup=admin&process=product_modify&p_code=<%=product.getP_code()%>';">제품정보변경</button>
</p>













