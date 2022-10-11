<%@page import="java.io.File"%>
<%@page import="ez_phone.dao.*"%>
<%@page import="ez_phone.dto.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보를 전달받아 CART 테이블에 삽입하고 제품목록 출력페이지(cart.jsp)로
이동하기 위한 정보를 클라이언트에게 전달하는 JSP 문서 --%>
<%@include file="/security/login_url.jspf" %>

<%
	//전달값과 업로드 처리된 파일명을 반환받아 저장
	String id=loginMember.getId();
	String p_code=request.getParameter("p_code");
	
	
	//DTO 객체를 생성하여 전달값(파일명)을 이용하여 필드값 변경
	CartDTO cart=new CartDTO();
	cart.setId(id);
	cart.setP_code(p_code);
		
	//제품정보를 전달받아 CART 테이블에 삽입하는 DAO 클래스의 메소드 호출
	CartDAO.getDAO().insertCart(cart);

	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=cart_menu&process=cart';");
	out.println("</script>");
%>









