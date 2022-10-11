<%@page import="ez_phone.dto.MemberDTO"%>
<%@page import="ez_phone.dao.MemberDAO"%>
<%@page import="ez_phone.dao.PaymentDAO"%>
<%@page import="ez_phone.dto.PaymentDTO"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- MEMBER 테이블에 저장된 모든 회원정보를 검색하여 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 관리자만 요청 가능한 JSP 문서 --%>
<%-- => [선택회원삭제]를 클릭한 경우 form 태그를 이용하여 회원정보 삭제페이지(member_remove_action.jsp)를 
post 방식으로 요청하며 체크박스로 선택된 모든 회원들의 아이디를 전달 --%>
<%-- => 회원의 [상태]를 변경한 경우 회원상태 변경페이지(member_status_action.jsp)를 요청하며
아이디와 변경할 상태를 전달 --%>

<%
	//MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	List<MemberDTO> memberList=MemberDAO.getDAO().selectMemberList();
%>    

<style type="text/css">
table {
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 3px;
	text-align: center;
	font-size: 12px;
}

th {
	background-color: black;
	color: white; 
}

.member_check { width: 80px; }
.member_id { width: 80px; }
.member_name { width: 80px; }
.member_email { width: 140px; }
.member_mobile { width: 140px; }
.member_address { width: 300px; }
.member_join { width: 150px; }
.member_login { width: 150px; }
.member_status { width: 80px; }
</style>

<h2>회원목록</h2>
<form name="memberForm" id="memberForm">
	<table>
		<tr>
			<th><input type="checkbox" id="allCheck"></th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>배송</th>
			
		
		
		<% for(MemberDTO member:memberList) { %>
		<tr>
			<td class="member_check">
				<% if(member.getStatus()==9) { %>
					관리자
				<% } else { %>
					<input type="checkbox" name="checkId" value="<%=member.getId()%>" class="check">
				<% } %>	
			</td>
			<td class="member_id"><%=member.getId() %></td>
			<td class="member_name"><%=member.getName() %></td>
			<td class="member_email"><%=member.getE_mail() %></td>
			<td class="member_mobile"><%=member.getPhone_number() %></td>
			<td class="member_address">
				[<%=member.getZipcode() %>]<%=member.getAddress_1() %> <%=member.getAddress_2() %>
			</td>
			
			
		       
			
			<td class="member_status">
				<select class="status" name="<%=member.getId() %>">
					<option value="0" <% if(member.getStatus()==0) { %> selected="selected" <% } %>>탈퇴회원</option>
					<option value="1" <% if(member.getStatus()==1) { %> selected="selected" <% } %>>일반회원</option>
					<option value="9" <% if(member.getStatus()==9) { %> selected="selected" <% } %>>관리자</option>
				</select>
			</td>
		</tr>
		<% } %>
	</table>
	<p><button type="button" id="removeBtn">회원삭제</button></p>
	<div id="message" style="color: red;"></div>
</form>

<!-- <table class="type09">
  <thead>
  <tr>
    <th scope="cols">타이틀</th>
    <th scope="cols">내용</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
  </tr>
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
  </tr>
  <tr>
    <th scope="row">항목명</th>
    <td>내용이 들어갑니다.</td>
  </tr>
  </tbody>
</table> -->

<script type="text/javascript">
$("#allCheck").change(function() {
	if($(this).is(":checked")) {
		$(".check").prop("checked",true);
	} else {
		$(".check").prop("checked",false);
	}
});

$("#removeBtn").click(function() {
	if($(".check").filter(":checked").length==0) {
		$("#message").text("선택된 회원이 하나도 없습니다.");
		return;
	}
	
	$("#memberForm").attr("action","index.jsp?workgroup=admin&process=member_remove_action");
	$("#memberForm").attr("method","post");
	$("#memberForm").submit();
});

$(".status").change(function() {
	//이벤트가 발생된 입력태그의 태그 속성값을 반환받아 저장
	var id=$(this).attr("name");//상태를 변경하고자 하는 회원의 아이디를 반환받아 저장 - 식별자
	//이벤트가 발생된 입력태그의 입력값을 반환받아 저장
	var status=$(this).val();//변경할 회원상태를 반환받아 저장 - 변경값
	//alert(id+" = "+status);
	
	location.href="index.jsp?workgroup=admin&process=member_status_action&id="+id+"&status="+status;
});
</script>








