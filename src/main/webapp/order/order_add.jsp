<%@page import="java.io.File"%>
<%@page import="ez_phone.dao.*"%>
<%@page import="ez_phone.dto.*"%>
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
	String zipcode=request.getParameter("zipcode");
	String address_1=request.getParameter("address_1");
	String address_2=request.getParameter("address_2");
	
	//DTO 객체를 생성하여 전달값(파일명)을 이용하여 필드값 변경
	PaymentDTO payment=new PaymentDTO();
	payment.setId(id);
	payment.setP_code(p_code);
	payment.setZipcode(zipcode);
	payment.setAddress_1(address_1);
	payment.setAddress_2(address_2);
		
	//제품정보를 전달받아 CART 테이블에 삽입하는 DAO 클래스의 메소드 호출
	PaymentDAO.getDAO().insertPayment(payment);
	PaymentDAO.getDAO().deleteCart();
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=main&process=main';");
	out.println("</script>");
%>










