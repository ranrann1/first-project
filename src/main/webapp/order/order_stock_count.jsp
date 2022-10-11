<%@page import="ez_phone.dao.*"%>
<%@page import="ez_phone.dto.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디 목록을 전달받아 MEMBER 테이블에 저장된 회원정보를 삭제하고 회원목록 출력페이지
(member_manager.jsp)로 이동하기 위한 정보를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 관리자만 요청 가능한 JSP 문서 --%>
<%@include file="/security/login_url.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&process=error_400';");
		out.println("</script>");
		return;			
	}
	String p_code=request.getParameter("p_code");
	int p_stock=Integer.parseInt(request.getParameter("p_stock"));
	
	
	//DTO 객체를 생성하여 전달값(파일명)을 이용하여 필드값 변경
	ProductDTO product=new ProductDTO();
	product.setP_code(p_code);
	product.setP_stock(p_stock);
	
	ProductDAO.getDAO().stockCountDown(product);
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=main&process=main';");
	out.println("</script>");
%>
