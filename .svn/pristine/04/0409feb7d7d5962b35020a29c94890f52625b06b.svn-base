<%@page import="java.util.List"%>
<%@page import="ez_phone.dao.*" %>
<%@page import="ez_phone.dto.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<ProductDTO> productList= ProductDAO.getDAO().selectGalaxyList();
	int i=1;
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
list-style-type:none;
margin:20px;
}
li{
padding : 1vw;
margin: 20px;
}
ul li{

outline : 1px solid black;
float:left;
}
ul li p{
font-size:15px;
}
</style>
</head>

<img src="<%=request.getContextPath() %>/images/samsung.PNG" width="1230" height="100">
		<% if(productList.isEmpty()) { %>
				<p>등록된 핸드폰이 없습니다.</p>			
		<%}else { %>
			<% for(ProductDTO product:productList) { %>
			<ul>
				<li>
					<a href="index.jsp?workgroup=product&process=product&p_code=<%=product.getP_code()%>">
					<img src="<%=request.getContextPath() %>/images_product_all/<%=product.getP_image() %>" width="220" height="300">
					</a>
					<hr>
					<p>
					판매량 <%=i%>위<%=product.getP_name()%>
					</p>
					<p>
					가격 : <%=product.getP_price() %> 원
					</p>

				</li>
					
			</ul>
		
			<%i++;} %>
		<%} %>
</body>
</html>