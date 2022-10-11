<%@page import="ez_phone.dto.BoardDTO"%>
<%@page import="ez_phone.dao.BoardDAO"%>
<%@page import="ez_phone.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/security/login_check.jspf" %>   
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&process=error_400';");
		out.println("</script>");
		return;		
	}
	
	String pageNum=request.getParameter("pageNum");
	//전달값에 태그 관련 기호가 있는 경우 회피문자로 변환하여 저장 - XSS 공격에 대한 방법
	String b_title=Utility.escapeTag(request.getParameter("b_title"));
	int b_status=1;

	String b_content=Utility.escapeTag(request.getParameter("b_content"));	
	
	//BOARD_SEQ 시퀸스의 다음값(자동 증가값)을 검색하여 반환하는 DAO 클래스의 메소드 호출
	int b_code=BoardDAO.getDAO().selectNextB_code();
	
	//BoardDTO 객체를 생성하고 필드값 변경
	BoardDTO board=new BoardDTO();
	board.setB_code(b_code);
	board.setId(loginMember.getId());
	board.setB_title(b_title);
	board.setB_content(b_content);
	board.setB_status(b_status);
	
	//게시글을 전달받아 BOARD 테이블에 삽입하는 DAO 클래스의 메소드 호출
	BoardDAO.getDAO().insertBoard(board);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=board&process=board_list&pageNum="+pageNum+"';");
	out.println("</script>");	
%>