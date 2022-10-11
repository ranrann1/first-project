<%@include file="/security/login_url.jspf"%>
<%@page import="java.util.List"%>

<%@page import="ez_phone.dao.BoardDAO"%>
<%@page import="ez_phone.dto.BoardDTO"%>
<%@page import="ez_phone.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String workgroup = request.getParameter("workgroup");
if (workgroup == null) {
	workgroup = "main";
}

String process = request.getParameter("process");
if (process == null) {
	process = "main";
}

String contentFilePath = workgroup + "/" + process + ".jsp";



%>

<%
	//MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
    //MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	List<BoardDTO> boardList=BoardDAO.getDAO().selectBoardList(loginMember.getId());
	//List<PaymentDTO> paymentList=PaymentDAO.getDAO().selectPaymentList("yhrangel12");

	/* String[] orderStatusDescription = {"미완료", "완료"
	                                   }; */
	   String[] orderStatusDescription = {"미완료", "답변완료"
	    	                                   };
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration-line: none;
	color: black;
}

div {
	display: block;
}

#sub_div>.inner {
	padding: 65px 0 85px;
}

.inner {
	width: 1200px;
	margin: 0 auto;
	position: relative;
}

.sub_tit_h3 {
	text-align: center;
	font-size: 30px;
	line-height: 1.1;
	font-family: "BR";
}

html, h1, h2, h3, h4, h5, h6, form, fieldset, img {
	margin: 0;
	padding: 0;
	border: 0;
}

h3 {
	display: block;
	font-size: 1.17em;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

.sub_cate {
	text-align: center;
	margin: 65px auto 50px;
	overflow: hidden;
	display: table;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.sub_cate li {
	display: inline-block;
	vertical-align: middle;
	width: 280px;
}

li {
	list-style: none;
}

ol, li, dl, dt, dd {
	margin: 0;
	padding: 0;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.sub_cate {
	text-align: center;
	margin: 65px auto 50px;
	overflow: hidden;
	display: table;
}

/* .sub_cate li.active a {
	font-weight: 600;
	color: #e80000;
} */
.sub_cate li a {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 18px;
	line-height: 1.2;
	font-weight: 400;
	color: #000;
	border-bottom: 4px solid #efefef;
	padding-bottom: 20px;
	position: relative;
	transition: all 0.2s;
}

.orderinquiry {
	margin-top: 60px;
}

p {
	margin: 0;
	padding: 0;
	word-break: break-all;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.orderinquiry {
	margin-top: 60px;
}

.oi_title {
	font-size: 24px;
	margin-bottom: 15px;
}

.oi_table table {
	width: 100%;
	border-spacing: 0;
	border-bottom: 1px solid #949494;
}

.oi_table table th {
	height: 70px;
	text-align: center;
	font-size: 17px;
	border-top: 2px solid #1a1a1a;
	border-bottom: 1px solid #949494;
}

.oi_table table td {
	height: 148px;
	font-size: 17px;
	border-bottom: 1px solid #dcdcdc;
}

.oi_table table tr:last-child td {
	border-bottom: 0;
}

.oi_table table td.td_num {
	width: 80px;
	text-align: center;
}

.oi_table table td.td_thumb {
	width: 145px;
	padding: 13px 0;
	text-align: center;
}

.oi_table table td.td_thumb img {
	width: 100%
}

.oi_table table td.td_prod {
	width: 355px;
	text-align: left;
	padding-left: 30px;
}

.oi_table table td.td_official {
	width: 240px;
	text-align: center;
}

.oi_table table td.td_progress {
	width: 240px;
	text-align: center;
}

.oi_table table td.td_pay {
	width: 140px;
	text-align: center;
}

.oi_table table td .selected_color {
	display: inline-block;
	vertical-align: middle;
	width: 17px;
	height: 17px;
	border-radius: 100%;
	margin-left: 8px;
	border: 1px solid #dfdfdf;
}

.oi_table table td.td_official a {
	display: inline-block;
	width: 155px;
	height: 36px;
	line-height: 34px;
	border: 1px solid #000;
	border-radius: 5px;
}

.oi_table table td.td_official a.active {
	color: #E80000;
	border-color: #E80000;
}

.oi_table table td.td_official a.deactive {
	color: #666;
	border-color: #666;
	pointer-events: none;
}

.oi_table table td.td_progress span {
	display: inline-block;
	width: 90px;
	height: 36px;
	line-height: 36px;
	color: #fff;
	background: #000;
	border-radius: 5px;
}

.oi_table table td.td_progress span.preparing {
	background: #999;
}

.oi_table table td.td_progress span.complete {
	background: #33b06d;
}

.oi_table table td.td_progress span.review_write {
	background: #E80000;
	cursor: pointer;
}
</style>
</head>
<body>


	<div id="sub_div">


		<div class="inner ">
			<div class="sub_top_wrap ">
				<h3 class="sub_tit_h3">마이페이지</h3>




				<ul class="sub_cate">
					<li class="active"><a
						href="index.jsp?workgroup=mypage&process=jumun">주문조회</a></li>
					<li><a href="#">내 1:1문의내역</a></li>
					<li><a href="index.jsp?workgroup=mypage&process=sujung">정보수정</a></li>

				</ul>
			</div>


			<div class="orderinquiry">
				<p class="oi_title">1:1문의내역</p>
				<div class="oi_table">
					<table class="">
						<thead>
							<tr>
								<th>번호</th>
								<th colspan="2">제목</th>
								<th>작성일</th>
								<th>답변상태</th>

							</tr>
						</thead>
						<tbody>
							<% if (boardList.size() > 0) { %>
							<% for (int i=0; i<boardList.size(); i++) { %>
							<tr>
								<td><%= boardList.get(i).getB_code() %></td>
								<td colspan="2"><%= boardList.get(i).getB_title() %></td>
								<td><%= boardList.get(i).getB_date() %></td>
								<td><%= orderStatusDescription[boardList.get(i).getB_status()] %></td>

							</tr>
							<% } %>
							<% } else { %>
							<tr>
								<td colspan="6" style="text-align: center;">게시물이 없습니다</td>
							</tr>
							<% } %>
						</tbody>
					</table>


				</div>



			</div>
		</div>
	</div>
</body>
</html>