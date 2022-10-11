<%@page import="java.io.File"%>
<%@page import="ez_phone.dao.ProductDAO"%>
<%@page import="ez_phone.dto.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보를 전달받아 PRODUCT 테이블에 삽입하고 제품목록 출력페이지(product_manager.jsp)로
이동하기 위한 정보를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 관리자만 요청 가능한 JSP 문서 --%>
<%@include file="/security/admin_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&work=error_400';");
		out.println("</script>");
		return;			
	}

	//전달받아 파일을 저장하기 위한 서버 디렉토리의 파일 시스템 경로를 반환받아 저장
	// => 작업 디렉토리(WorkSpace)가 아닌 웹 디렉토리(WebApps)에 파일 시스템 경로 반환
	String saveDirectory=request.getServletContext().getRealPath("/images_product_all");

	
	//MultipartRequest 객체([multipart/form-data]로 전달된 값을 처리하기 위한 객체) 생성
	// => MultipartRequest 객체를 생성하면 전달된 모든 파일이 서버 디렉토리에 자동으로 저장 - 업로드
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//전달값과 업로드 처리된 파일명을 반환받아 저장
	String p_code=multipartRequest.getParameter("p_code");
	String p_name=multipartRequest.getParameter("p_name");
	String p_image=multipartRequest.getFilesystemName("p_image");
	String p_image2=multipartRequest.getFilesystemName("p_image2");
	int p_price=Integer.parseInt(multipartRequest.getParameter("p_price"));
	int p_stock=Integer.parseInt(multipartRequest.getParameter("p_stock"));
	String p_color=multipartRequest.getParameter("p_color");
	String p_size=multipartRequest.getParameter("p_size");
	
	//DTO 객체를 생성하여 전달값(파일명)을 이용하여 필드값 변경
	ProductDTO product=new ProductDTO();
	product.setP_code(p_code);
	product.setP_name(p_name);
	product.setP_image(p_image);
	product.setP_image2(p_image2);
	product.setP_price(p_price);
	product.setP_stock(p_stock);
	product.setP_color(p_color);
	product.setP_size(p_size);
	
	//제품정보를 전달받아 PRODUCT 테이블에 삽입하는 DAO 클래스의 메소드 호출
	int rows=ProductDAO.getDAO().insertProduct(product);
	if(rows<=0) {//PRODUCT 테이블에 제품정보가 삽입되지 않은 경우
		//서버 디렉토리에 업로드되어 저장된 제품 관련 이미지 삭제
		//File 객체 : 파일 정보를 저장하고 파일 처리하기 위한 기능을 제공하는 객체
		//File.delete() : File 객체로 표현된 파일을 삭제하는 메소드
		new File(saveDirectory, p_image).delete();
		new File(saveDirectory, p_image2).delete();
	}
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=admin&process=product_manager';");
	out.println("</script>");
%>










