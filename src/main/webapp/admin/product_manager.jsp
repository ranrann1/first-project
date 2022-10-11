<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="ez_phone.dao.*" %>
<%@page import="ez_phone.dto.*" %>
<%

	String keyword=request.getParameter("keyword");
		if(keyword==null) {
		keyword="";
	}	
	List<ProductDTO> productList=ProductDAO.getDAO().selectProductList(keyword);


%> 
<style>
ul {
list-style-type:none;
margin:20px;
}
ul li{
outline : 1px solid black;
float:left;
}
ul li p{
font-size:15px;
}
li{
padding : 1vw;
margin: 20px;
}
#btn {
	text-align: right;
	margin-bottom: 5px;
}
</style>
<h2>제품목록</h2>

<div id="btn">
	<button type="button" id="addBtn">제품등록</button>
</div>

<br>
<% if(productList.isEmpty()) { %>
				<p>등록된 핸드폰이 없습니다.</p>			
		<%}else { %>
			<% for(ProductDTO product:productList) { %>
			<ul>
				<li>
					<a href="index.jsp?workgroup=admin&process=product_detail&p_code=<%=product.getP_code()%>">
					<img src="<%=request.getContextPath() %>/images_product_all/<%=product.getP_image() %>" width="220" height="300">
					</a>
					<hr>
					<p>
					기종 : <%=product.getP_name()%>
					</p>
					<p>
					가격 : <%=product.getP_price() %> 원
					</p>

				</li>
					
			</ul>
		
			<%} %>
		<%} %>
<script type="text/javascript">
$("#addBtn").click(function() {
	location.href="index.jsp?workgroup=admin&process=product_add";
});
</script>

