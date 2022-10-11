<%@page import="ez_phone.dto.NoticeDTO"%>
<%@page import="ez_phone.dao.NoticeDAO"%>
<%@page import="ez_phone.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/admin_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;		
	}

	String pageNum=request.getParameter("pageNum");
	String title=Utility.escapeTag(request.getParameter("title"));
	int status=1;
	String content=Utility.escapeTag(request.getParameter("content"));	
	
	//NOTICE_SEQ 시퀸스의 다음값(자동 증가값)을 검색하여 반환하는 DAO 클래스의 메소드 호출
	int num=NoticeDAO.getDAO().selectNextNum();
	
	//NoticeDTO 객체를 생성하고 필드값 변경
	NoticeDTO notice=new NoticeDTO();
	notice.setNum(num);
	notice.setTitle(title);
	notice.setContent(content);
	notice.setStatus(status);
	
	//게시글을 전달받아 NOTICE 테이블에 삽입하는 DAO 클래스의 메소드 호출
	NoticeDAO.getDAO().insertNotice(notice);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=notice&process=notice_list&pageNum="+pageNum+"';");
	out.println("</script>");
%>