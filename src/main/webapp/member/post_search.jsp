<%@page import="ez_phone.dao.ZipDAO"%>
<%@page import="ez_phone.dto.ZipDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ez_phone.*"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 동이름을 입력하여 전달받아 ZIP 테이블에 저장된 우편번호정보를 검색하여 클라이언트에게 
우편번호와 기본주소 목록을 전달하는 JSP 문서 --%>
<%-- => [기본주소]를 클릭한 경우 부모창의 입력태그(우편번호, 기본주소)의 입력값 변경하고 팝업창 닫기 --%>
<%
	//전달값을 반환받아 저장
	String dong=request.getParameter("dong");

	//동이름을 전달받아 ZIP 테이블에 저장된 우편번호정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<ZipDTO> zipList=new ArrayList<ZipDTO>();
	if(dong!=null) {//전달값이 있는 경우
		zipList=ZipDAO.getDAO().selectZipList(dong);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
#search {
	width: 550px;
	margin: 0 auto;
	text-align: center;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
	margin: 10px;
	font-size: 14px;
}

td {
	border: 1px solid black;
}

.zipcode {
	width: 100px;
}

.address {
	width: 400px;
	text-align: left;
	padding: 2px;
}
</style>
</head>
<body>
	<div id="search">
		<form name="postForm">
			동이름 : <input type="text" name="dong">
			<button type="button" id="searchBtn">주소검색</button>
		</form>

		<%-- 검색된 우편번호정보를 클라이언트에게 전달 --%>
		<% if(!zipList.isEmpty()) {//검색된 우편번호정보가 있는 경우 %>
			<table>
				<tr>
					<td class="zipcode">우편번호</td>
					<td class="address" style="text-align: center;">기본주소</td>
				</tr>
				
				<% for(ZipDTO zip:zipList) { %>
				<tr>
					<td class="zipcode"><%=zip.getZipcode() %></td>
					<%-- a 태그를 이용하여 자바스크립트 함수를 호출하고자 할 경우 javascript 
					네임스페이스를 표현해야만 함수 호출 가능 --%>
					<td class="address">
						<a href="javascript:searchPost('<%=zip.getZipcode()%>','<%=zip.getAddress()%>');">
							<%=zip.getAddress() %>
						</a>
					</td>
				</tr>
				<% } %>
			</table>		
		<% } %>
	</div>
	
	<script type="text/javascript">
	postForm.dong.focus();
	
	document.getElementById("searchBtn").onclick=function() {
		if(postForm.dong.value=="") {
			postForm.dong.focus();
			return;
		}
		
		postForm.submit();
	}
	
	function searchPost(code, addr) {
		opener.join.zipcode.value=code;
		opener.join.address1.value=addr;
		window.close();
	}
	</script>
</body>
</html>






