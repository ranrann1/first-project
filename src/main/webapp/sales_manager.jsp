<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{
	border-collapse:collapse;
}
table tr th, td{
	border:1px solid gray;
	text-align:center;
	padding:5px;
}
</style>
<meta charset="UTF-8">
<title>EZPHONE</title>

<link href="style.css" type="text/css" rel="stylesheet">
</head>
<body>
		<div id="content">
			<h3>관리자 페이지</h3>
			<div id="manager_menu">
				<a href="sales_manager.jsp">월별 판매량</a>
				<a href="product_manager.jsp">제품 관리</a>
				<a href="contact_manager.jsp">문의 내역</a>
				<a href="user_manager.jsp">고객 관리</a>
			</div>
			<div id="manager_content">
			<h5>월별 판매량</h5>
			<table>
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>1</td>
					<td>EZPHONE 질문입니다.</td>
					<td>임채환</td>
					<td>2022-06-09</td>
					<td>1</td>
				</tr>
				<tr>
					<td>2</td>
					<td>EZPHONE 질문입니다2.</td>
					<td>임채완</td>
					<td>2022-06-09</td>
					<td>30</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
		
</body>
</html>