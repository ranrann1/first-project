<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ez_phone.dto.MemberDTO"%>
<%@page import="ez_phone.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="ez_phone.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/security/login_url.jspf" %>

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

//검색대상과 검색단어를 반환받아 저장
String search=request.getParameter("search");
if(search==null) {
	search="";
}

String keyword=request.getParameter("keyword");
if(keyword==null) {
	keyword="";
}

//페이징 처리 관련 전달값(요청 페이지 번호)을 반환받아 저장
// => 요청 페이지 번호 전달값이 없는 경우 첫번째 페이지의 게시글 목록을 검색하여 응답	
int pageNum=1;
if(request.getParameter("pageNum")!=null) {//전달값이 있는 경우
	pageNum=Integer.parseInt(request.getParameter("pageNum"));
}

//하나에 페이지에 검색되어 출력될 게시글의 갯수 설정 - 전달값을 반환받아 저장 가능
int pageSize=10;

//검색 관련 정보를 전달받아 BOARD 테이블에 저장된 전체 게시글 중 검색대상에 검색단어가 포함된  
//게시글의 갯수를 검색하여 반환하는 DAO 클래스의 메소드 호출
int totalBoard=BoardDAO.getDAO().selectBoardCount(search, keyword);

//전체 페이지의 갯수를 계산하여 저장
int totalPage=(int)Math.ceil((double)totalBoard/pageSize);

//전달된 요청 페이지 번호에 대한 검증
if(pageNum<=0 || pageNum>totalPage) { //비정상적인 요청 페이지 번호인 경우
	pageNum=1; //첫번째 페이지의 게시글이 검색되도록 요청 페이지 번호 설정
}

//요청 페이지에 검색될 시작 게시글의 행번호를 계산하여 저장
int startRow=(pageNum-1)*pageSize+1;

//요청 페이지에 검색될 종료 게시글의 행번호를 계산하여 저장
int endRow=pageNum*pageSize;

//마지막 페이지에 대한 종료 게시글의 행번호를 검색 게시글의 갯수로 변경
if(endRow>totalBoard) {
	endRow=totalBoard;
}

//요청 페이지에 대한 시작 게시글의 행번호와 종료 게시글의 행번호를 전달받아 BOARD 테이블에 
//저장된 게시글에서 해당 범위의 게시글들을 검색하여 반환하는 DAO 클래스의 메소드 호출
List<BoardDTO> boardList=BoardDAO.getDAO().selectBoardList2(startRow, endRow, search, keyword);

//세션에 저장된 권한 관련 정보를 반환받아 저장
// => 로그인 사용자만 글쓰기 권한 제공
// => 비밀 게시글인 경우 로그인 사용자가 게시글 작성자이거나 관리자인 경우에만 접근 권한 제공
//MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

//서버 시스템의 현재 날짜를 반환받아 저장
// => 게시글의 작성일을 현재 날짜와 비교하여 구분 출력
String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());

//요청 페이지에 검색되어 응답될 게시글 출력번호의 시작값을 계산하여 저장
int rowNum=totalBoard-(pageNum-1)*pageSize;
%> 
<style type="text/css">
	
a{
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






.board {
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

.board {
	margin-top: 60px;
}

.b_title {
	font-size: 24px;
	margin-bottom: 15px;
}

.b_table table {
	width: 100%;
	border-spacing: 0;
	border-bottom: 1px solid #949494;
}

.b_table table th {
	height: 70px;
	text-align: center;
	font-size: 17px;
	border-top: 2px solid #1a1a1a;
	border-bottom: 1px solid #949494;
}

.b_table table td {
	height: 148px;
	font-size: 17px;
	border-bottom: 1px solid #dcdcdc;
}

.b_table table tr:last-child td {
	border-bottom: 0;
}

.b_table table td.td_num {
	width: 80px;
	text-align: center;
}

.b_table table td.td_thumb {
	width: 145px;
	padding: 13px 0;
	text-align: center;
}

.b_table table td.td_thumb img {
	width: 100%
}

.b_table table td.td_prod {
	width: 355px;
	text-align: left;
	padding-left: 30px;
}

.b_table table td.td_official {
	width: 240px;
	text-align: center;
}

.b_table table td.td_progress {
	width: 240px;
	text-align: center;
}

.b_table table td.td_pay {
	width: 140px;
	text-align: center;
}

.b_table table td .selected_color {
	display: inline-block;
	vertical-align: middle;
	width: 17px;
	height: 17px;
	border-radius: 100%;
	margin-left: 8px;
	border: 1px solid #dfdfdf;
}

.b_table table td.td_official a {
	display: inline-block;
	width: 155px;
	height: 36px;
	line-height: 34px;
	border: 1px solid #000;
	border-radius: 5px;
}

.b_table table td.td_official a.active {
	color: #E80000;
	border-color: #E80000;
}

.b_table table td.td_official a.deactive {
	color: #666;
	border-color: #666;
	pointer-events: none;
}

.b_table table td.td_progress span {
	display: inline-block;
	width: 90px;
	height: 36px;
	line-height: 36px;
	color: #fff;
	background: #000;
	border-radius: 5px;
}

.b_table table td.td_progress span.preparing {
	background: #999;
}

.b_table table td.td_progress span.complete {
	background: #33b06d;
}

.b_table table td.td_progress span.review_write {
	background: #E80000;
	cursor: pointer;
}
.sub_cate {text-align:center;margin:65px auto 50px;overflow:hidden;display:table;}
.sub_cate li {display:inline-block;vertical-align:middle;width:280px;}
.sub_cate li a {display:block;width:100%;height:100%;font-size:18px;line-height:1.2;font-weight:400;color:#000;border-bottom:4px solid #efefef;padding-bottom:20px;position:relative;transition:all 0.2s;}
.sub_cate li a::after {content:'';width:100%;height:4px;background:#e80000;position:absolute;left:0;bottom:-4px;border-radius:3px;opacity:0;transition:all 0.2s;}
.sub_cate li a:hover {color:#e80000;}
.sub_cate li a:hover::after {opacity:1;}
.sub_cate li.active a {font-weight:600;color:#e80000;}
.sub_cate li.active a::after {opacity:1;}
</style>
</head>
<body>


	<div id="sub_div">


		<div class="inner ">
			<div class="sub_top_wrap ">
				<h3 class="sub_tit_h3">
					<a href="#">1:1문의</a>
				</h3>
				
				<ul class="sub_cate">
					<li><a href="index.jsp?workgroup=notice&process=notice_list">공지사항</a></li>
					<li class="active"><a href="index.jsp?workgroup=board&process=board_list">1:1문의</a></li>
					<li><a href="index.jsp?workgroup=board&process=board_question_list">자주묻는질문</a></li>

				</ul>
			</div>

			<div class="board">
				<p class="b_title">1:1문의</p>
				<div class="b_table">
					<% if(loginMember!=null) { //로그인 사용자인 경우 %>
						<div style="text-align: right;">
							<button type="button" onclick="location.href='index.jsp?workgroup=board&process=board_write';">글쓰기</button>
						</div>
					<% } %>
					
					<table class="">
						<thead>
							<tr>
								<th scope="col" style="width: 80px;">번호</th>
								<th scope="col">제목</th>
								<th scope="col" style="width: 150px;">작성일</th>
								<th scope="col" style="width: 120px;">답변상태</th>
							</tr>
						</thead>
						<tbody>
		<% if(totalBoard==0) { %>
		<tr>
			<td colspan="5">검색된 게시글이 하나도 없습니다.</td>
		</tr>
		<% } else { %>
			<%-- 검색된 게시글들을 List 객체에서 하나씩 반복적으로 제공받아 응답 처리 --%>
			<% for(BoardDTO board:boardList) { %>
			<tr>
				<%-- 글번호 : BOARD 테이블에 저장된 게시글의 글번호가 아닌 계산된 출력 글번호로 응답 --%>
				<td><%=rowNum %></td>
				<% rowNum--;//출력 글번호의 변수값 1씩 감소 처리 %>

				<%-- 제목 --%>
				<td class="board_title">
					<%-- 게시글 상태를 구분하여 제목과 링크를 다르게 설정하여 응답되도록 처리 --%>
					<% if(board.getB_status()==1) { //[비밀글]인 경우 %>
						<span class="secret">[비밀글]</span>
					<% } %>
					<%-- 로그인 사용자가 게시글 작성자이거나 관리자인 경우 --%>
					<% if(loginMember!=null && (loginMember.getId().equals(board.getId()) 
							|| loginMember.getStatus()==9)) { %>	
						<a href="index.jsp?workgroup=board&process=board_detail&b_code=<%=board.getB_code() %>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>">
							<%=board.getB_title() %>
						</a>	
					<% } else { %>
						문의글은 작성자 또는 관리자만 확인 가능합니다.
					<% } %>	
					
				<% if(board.getB_status()==0) { //[삭제글]인 경우 %>
					<a href="index.jsp?workgroup=board&process=board_list"></a>
				<% } %>
				</td>
				
				<% if(board.getB_status()!=0) { //삭제 게시글이 아닌 경우 %>
					<%-- 작성일 : 오늘 날짜에 작성된 게시글은 시간만 출력하고 다른 날짜에 작성된 게시글은 날짜와 시간 출력 --%>
					<td>
						<% if(currentDate.equals(board.getB_date().substring(0, 10))) { //오늘 작성된 게시글인 경우 %>
							<%=board.getB_date().substring(11) %>
						<% } else { //과거에 작성된 게시글인 경우 %>
							<%=board.getB_date() %>
						<% } %>
					</td>
				<% } %>
				
				<%-- 답변상태 --%>
				<% if(board.getB_check()==0) { //[답변대기중]인 경우 %>
					<td>답변 대기중</td>
				<% } else if(board.getB_check()!=0) {%>
					<td>답변 완료</td>
				<% } %>	
			</tr>
			<% } %>
		<% } %>
	</tbody>
	</table>
</div>

	<%-- 페이지 번호 출력 : 클릭 이벤트에 의한 링크 설정 - 블럭화 처리 --%>
	<%
		int blockSize=5;
	
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		
		int endPage=startPage+blockSize-1;
		
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) {//요청 페이지 번호와 이벤트 페이지 번호가 다른 경우 - 링크 설정 %>
			<a href="index.jsp?workgroup=board&process=board_list&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i %>]</a>
		<% } else {//요청 페이지 번호와 이벤트 페이지 번호가 같이 경우 - 링크 미설정 %>
			[<%=i %>]
		<% } %>
	<% } %>

			</div>
</body>
</html>