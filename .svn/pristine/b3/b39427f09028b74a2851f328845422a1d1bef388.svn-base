<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/security/login_check.jspf" %> 

<% String pageNum="1"; %>
<style type="text/css">
table {
	margin: 0 auto;
}

th {
	width: 70px;
	font-weight: normal;
}

td {
	text-align: left;
}
</style>

<h2>1:1 문의 글쓰기</h2>

<form action="index.jsp?workgroup=board&process=board_write_action" method="post" id="boardForm">
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="b_title" id="b_title" size="40">
			</td>	
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="7" cols="60" name="b_content" id="board_content"></textarea>
			</td>	
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">글저장</button>
				<button type="reset" id="resetBtn">다시쓰기</button>
			</th>
		</tr>
	</table>
</form>
<div id="message" style="color: red;"></div>

<script type="text/javascript">
$("#b_title").focus();

$("#boardForm").submit(function() {
	if($("#b_title").val()=="") {
		$("#message").text("제목을 입력해 주세요.");
		$("#b_title").focus();
		return false;
	}
	
	if($("#board_content").val()=="") {
		$("#message").text("내용을 입력해 주세요.");
		$("#board_content").focus();
		return false;
	}
});

$("#resetBtn").click(function() {
	$("#b_title").focus();
	$("#message").text("");
});
</script>