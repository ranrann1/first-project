<%@page import="ez_phone.util.Utility"%>
<%@page import="ez_phone.dto.NoticeDTO"%>
<%@page import="ez_phone.dao.NoticeDAO"%>

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
	
	//전달값을 반환받아 저장
	int num=Integer.parseInt(request.getParameter("num"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	String title=Utility.escapeTag(request.getParameter("title"));
	int status=1;
	String content=Utility.escapeTag(request.getParameter("content"));
	
	//NoticeDTO 객체를 생성하고 필드값 변경
	NoticeDTO notice=new NoticeDTO();
	notice.setNum(num);
	notice.setTitle(title);
	notice.setContent(content);
	notice.setStatus(status);
	
	//게시글을 전달받아 NOTICE 테이블에 저장된 게시글을 변경하는 DAO 클래스의 메소드 호출
	NoticeDAO.getDAO().updateNotice(notice);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=notice&process=notice_detail&num="+num
		+"&pageNum="+pageNum+"&search="+search+"&keyword="+keyword+"';");
	out.println("</script>");	
%>