<%@page import="ez_phone.dao.NoticeDAO"%>
<%@page import="ez_phone.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	//글번호를 전달받아 NOTICE 테이블에 저장된 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	NoticeDTO notice=NoticeDAO.getDAO().selectNotice(num);
	
	//검색된 게시글이 없거나 삭제된 게시글인 경우 에러 페이지로 이동 - 비정상적 요청
	if(notice==null || notice.getStatus()==0) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;		
	}	

	//글번호를 전달받아 BOARD 테이블에 저장된 게시글의 상태를 삭제글로 변경하는 DAO 클래스의 메소드 호출
	NoticeDAO.getDAO().updateStatus(num, 0);
	
	NoticeDAO.getDAO().deleteNotice(num);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=notice&process=notice_list';");
	out.println("</script>");	
%>