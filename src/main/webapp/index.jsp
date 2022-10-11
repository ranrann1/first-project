<%@page import="ez_phone.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%
request.setCharacterEncoding("utf-8");

String workgroup = request.getParameter("workgroup");
if (workgroup == null) {
	workgroup = "main";
}

String process = request.getParameter("process");
if (process == null) {
	process = "main";
}

String headerPath="header.jsp";
if(workgroup.equals("admin")) {//관리자 관련 페이지를 요청한 경우
	headerPath="admin/header.jsp";
}


String contentFilePath = workgroup + "/" + process + ".jsp";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EZPHONE</title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<link href="style.css" type="text/css" rel="stylesheet">

<style>
ul li {list-style-type: none;}
#review fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#review fieldset legend{
    text-align: right;
}
#review input[type=radio]{
    display: none;
}
#review label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#review label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#review label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#review input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#Contents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
</style>

</head>
<body>
	
	<div id="header">
		<%-- <jsp:include page="header.jsp"/> --%>
		<jsp:include page="<%=headerPath%>"/>
	</div>
	
	<div id="content">
		<jsp:include page="<%=contentFilePath%>" />
	</div>

	<div id="footer">
		<div></div>
		<p>Copyright © Itwill Corp. All rights reserved.</p>
	</div>
</body>
</html>













