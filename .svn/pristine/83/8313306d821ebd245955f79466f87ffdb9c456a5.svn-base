<%@page import="ez_phone.dao.NoticeDAO"%>
<%@page import="ez_phone.dto.NoticeDTO"%>
<%@page import="ez_phone.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--@include file="/security/admin_check.jspf" --%>
<%
	
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("num")==null) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;			
	}

	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//글번호를 전달받아 NOTICE 테이블에 저장된 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	NoticeDTO notice=NoticeDAO.getDAO().selectNotice(num);
	
	//검색된 게시글이 없거나 삭제된 게시글인 경우 에러 페이지로 이동 - 비정상적 요청
	if(notice==null || notice.getStatus()==0) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;		
	}
	
	//세션에 저장된 권한 관련 정보를 반환받아 저장
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	
	//글번호를 전달받아 NOTICE 테이블에 저장된 게시글의 조회수를 증가하는 DAO 클래스의 메소드 호출
	NoticeDAO.getDAO().updateReadcount(num);
%>   
<style type="text/css">
#notice_detail {
	width: 800px;
	margin: 0 auto;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 5px;
}

th {
	width: 300px;
	background-color: white;
	color: black; 
}

td {
	width: 1000px;
}

.title, .content {
	text-align: left;
}

.content {
	height: 400px;
	vertical-align: middle;
}

#notice_menu {
	text-align: right;
	margin: 5px;
}
</style>

<div id="notice_detail">
	<h2>공지사항</h2>
	<table>
		<tr>
			<th>작성일</th>
			<td>
				<%=notice.getRegDate() %>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td	class="title">
				<%=notice.getTitle() %>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="content">
				<%=notice.getContent().replace("\n", "<br>") %>
			</td>
		</tr>
	</table>
	
	<% if(loginMember!=null && loginMember.getStatus()==9) { %>
	<div id="notice_menu">
			<button type="button" id="modifyBtn">글변경</button>	
			<button type="button" id="removeBtn">글삭제</button>
	</div>	
	<% } %>	
	
	<div id="notice_menu">
			<button type="button" id="listBtn">글목록</button>
	</div>

	<%-- 요청 페이지로 값을 전달하기 위한 form 태그 --%>
	<form method="post" id="menuForm">
		<%-- [글변경] 및 [글삭제]를 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="num" value="<%=notice.getNum()%>">
		
		<%-- [글변경] 및 [글목록]을 클릭한 경우 전달되는 값 --%>
		<input type="hidden" name="pageNum" value="<%=pageNum%>">
		<input type="hidden" name="search" value="<%=search%>">
		<input type="hidden" name="keyword" value="<%=keyword%>">
	</form>
</div>

<script type="text/javascript">
$("#modifyBtn").click(function() {
	$("#menuForm").attr("action","index.jsp?workgroup=notice&process=notice_modify");
	$("#menuForm").submit();
});

$("#removeBtn").click(function() {
	if(confirm("게시글을 삭제 하시겠습니까?")) {	
		$("#menuForm").attr("action","index.jsp?workgroup=notice&process=notice_remove_action");
		$("#menuForm").submit();
	}
});

$("#replyBtn").click(function() {
	$("#menuForm").attr("action","index.jsp?workgroup=notice&process=notice_write");
	$("#menuForm").submit();
});

$("#listBtn").click(function() {
	$("#menuForm").attr("action","index.jsp?workgroup=notice&process=notice_list");
	$("#menuForm").submit();
});
</script>