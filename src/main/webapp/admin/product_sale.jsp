<%@page import="java.text.DecimalFormat"%>
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
	int sum=0;
	int allsum=0;
	int count=0;
	int count2=0;

%> 
<!DOCTYPE html>
 
<style>
	table td{
	text-algin:left;
	
	}

</style>  
    <table width="1300" style="text-align:left">
        <thead>
        <tr>
            <th style=width:30%>제품이름</th> 
            <th style=width:55%>판매량</th>
            <th style=width:55%>총판매가격</th>
        </tr>
        </thead>
    <tbody>
    <%for(ProductDTO Product:productList) { 
    	count=10-(Product.getP_stock()/10);
    	sum=Product.getP_price()*count;
		 %>
            <tr>
            
                <td><%=Product.getP_name() %></td>
                <td style=pont-size:0.5em;><%for (int i =(Product.getP_stock()/10);i< 10; i++ ){ %>
                    ■

                <%count2++;} %>[<%=count %>]개
                </td>
                <td><%=DecimalFormat.getInstance().format(sum) %>원</td>
		
            </tr>
	
     <%
		allsum+=sum;} %>
     
    </tbody>
</table>
<hr>
<a style="color:red">휴대폰 총 판매 갯수 = <%=count2 %>개 || 휴대폰 총 판매 가격<%=DecimalFormat.getInstance().format(allsum) %>원</a>
