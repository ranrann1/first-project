<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<%@page import="java.util.List"%>
<%@page import="ez_phone.dao.*" %>
<%@page import="ez_phone.dto.*" %>
<%

	String keyword=request.getParameter("keyword");
		if(keyword==null) {
		keyword="";
	}	
	List<ProductDTO> productList=ProductDAO.getDAO().selectProductList(keyword);

	int i=1;
%> 
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

<div class="swiper-container">
    <div class="swiper-wrapper">
        <div class="swiper-slide">
<img src="<%=request.getContextPath() %>/images/banner.PNG" width="1200"></div>
        <div class="swiper-slide">
<img src="<%=request.getContextPath() %>/images/banner2.PNG" width="1200"></div>
        <div class="swiper-slide">
<img src="<%=request.getContextPath() %>/images/banner3.PNG" width="1200"></div>
        ...
    </div>
</div>
<img src="<%=request.getContextPath() %>/images/top.PNG" width="1230" height="100">
<br>
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
					판매량 <%=i%>위 <%=product.getP_name()%>
					</p>
					<p>
					가격 : <%=product.getP_price() %> 원
					</p>
				
				</li>
					
			</ul>
		
			<%i++;} %>
		<%} %>

<script type="text/javascript">

var mySwiper = new Swiper('.swiper-container', {
	slidesPerView: 1, 
    spaceBetween: 60,
	loop: true, 
	autoplay: true
});

</script>


