<%@page import="ez_phone.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ez_phone.dto.ReviewDTO" %>
<%@include file="/security/login_check.jspf" %>
<%

	String rcontent=request.getParameter("r_contents");
	String rstarrating=request.getParameter("star_rating");	
	String id=loginMember.getId();
	String pname=request.getParameter("p_name");
	
	ReviewDTO review=new ReviewDTO();
	review.setRcontent(rcontent);
	review.setRstarrating(rstarrating);
	review.setId(id);
	review.setPname(pname);
	

	
	//게시글을 전달받아 Review 테이블에 삽입하는 DAO 클래스의 메소드 호출
	ReviewDAO.getDAO().insertReview(review);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp';");
	out.println("</script>");
%>
    