<%@page import="ez_phone.dao.NoticeDAO"%>
<%@page import="ez_phone.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- BOARD 테이블에 게시글(새글)을 21개 저장하는 JSP 문서 - 테스트 프로그램 --%>
<%
	NoticeDTO notice=new NoticeDTO();
	for(int i=1;i<=21;i++) {
		int num=NoticeDAO.getDAO().selectNextNum();
		notice.setNum(num);
		notice.setTitle("테스트-"+i);
		notice.setContent("게시글 연습-"+i);
		notice.setStatus(1);
		NoticeDAO.getDAO().insertNotice(notice);
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>21개의 테스트 게시글을 저장 하였습니다.</h1>
</body>
</html>