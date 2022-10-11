<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보를 입력받기 위한 JSP 문서 --%>    
<%-- => 관리자만 요청 가능한 JSP 문서 --%>
<%-- => [제품등록]를 클릭한 경우 form 태그를 이용하여 제품정보 삽입페이지(product_add_action.jsp)를 
form 태그로 post 방식으로 요청하여 이동하며 사용자가 입력한 제품정보를 전달 --%>
<%@include file="/security/admin_check.jspf" %>
<style type="text/css">
#product {
	width: 800px;
	margin: 0 auto;
}

table {
	margin: 0 auto;
}

td {
	text-align: left;
}
</style>

<div id="product">
	<h2>제품등록</h2>
	
	<%-- 파일을 입력받아 전달하기 위해서는 반드시 form 태그의 method 속성을 [post]로 설정하고 
	enctype 속성을 [multipart/form-data]로 설정 --%>
	<form action="index.jsp?workgroup=admin&process=product_add_action" method="post"
		enctype="multipart/form-data" id="productForm">
	<table>
		<tr>
			<td>제품번호</td>
			<td>
				<input type="text" name="p_code" id="p_code">
			</td>	
		</tr>
		<tr>
			<td>제품명</td>
			<td>
				<input type="text" name="p_name" id="p_name">
			</td>
		</tr>
		<tr>
			<td>대표이미지</td>
			<td>
				<input type="file" name="p_image" id="p_image">
			</td>
		</tr>
		<tr>
			<td>상세이미지</td>
			<td>
				<input type="file" name="p_image2" id="p_image2">
			</td>
		</tr>
		<tr>
			<td>제품가격</td>
			<td>
				<input type="text" name="p_price" id="p_price">
			</td>
		</tr>
		<tr>
			<td>제품수량</td>
			<td>
				<input type="text" name="p_stock" id="p_stock">
			</td>
		</tr>
		<tr>
			<td>제품색상</td>
			<td>
				<input type="text" name="p_color" id="p_color">
			</td>
		</tr>
		<tr>
			<td>제품용량</td>
			<td>
				<input type="text" name="p_size" id="p_size">
			</td>
		</tr>
		
		<tr>
			<td>
				<button type="submit">제품등록</button>
			</td>
		</tr>
	</table>	
	</form>
	
	<div id="message" style="color: red;"></div>
</div>

<script type="text/javascript">
$("#productForm").submit(function() {
	if($("#p_code").val()=="") {
		$("#message").text("제품코드를 입력해 주세요.");
		$("#p_code").focus();
		return false;
	}
	
	if($("#p_name").val()=="") {
		$("#message").text("제품명을 입력해 주세요.");
		$("#p_name").focus();
		return false;
	}
	
	if($("#p_image").val()=="") {
		$("#message").text("대표이미지를 입력해 주세요.");
		$("#p_image").focus();
		return false;
	}
	
	if($("#p_image2").val()=="") {
		$("#message").text("상세이미지를 입력해 주세요.");
		$("#p_image2").focus();
		return false;
	}
	
	if($("#p_price").val()=="") {
		$("#message").text("제품가격을 입력해 주세요.");
		$("#p_price").focus();
		return false;
	}
	
	if($("#p_stock").val()=="") {
		$("#message").text("제품수량을 입력해 주세요.");
		$("#p_stock").focus();
		return false;
	}
	
	if($("#p_color").val()=="") {
		$("#message").text("제품색상을 입력해 주세요.");
		$("#p_color").focus();
		return false;
	}
	
	if($("#p_size").val()=="") {
		$("#message").text("제품용량을 입력해 주세요.");
		$("#p_size").focus();
		return false;
	}
});
</script>











