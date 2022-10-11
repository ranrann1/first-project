<%@page import="ez_phone.dao.ProductDAO"%>
<%@page import="java.io.File"%>
<%@page import="ez_phone.dto.ProductDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 제품정보를 전달받아 PRODUCT 테이블에 저장된 제품정보를 변경하고 제품정보 출력페이지
(product_detail.jsp)로 이동하기 위한 정보를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 제품 이미지가 입력되어 전달된 경우 기존 제품 이미지를 서버 디렉토리에서 삭제 처리 --%>
<%-- => 관리자만 요청 가능한 JSP 문서 --%>
<%@include file="/security/admin_check.jspf" %>
<%
	


	//전달받아 파일을 저장하기 위한 서버 디렉토리의 파일 시스템 경로를 반환받아 저장
	// => 작업 디렉토리(WorkSpace)가 아닌 웹 디렉토리(WebApps)에 파일 시스템 경로 반환
	String saveDirectory=request.getServletContext().getRealPath("/images_product_all");
	
	//MultipartRequest 객체([multipart/form-data]로 전달된 값을 처리하기 위한 객체) 생성
	// => MultipartRequest 객체를 생성하면 전달된 모든 파일이 서버 디렉토리에 자동으로 저장 - 업로드
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory
			, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//전달값과 업로드 처리된 파일명을 반환받아 저장
		String p_name=multipartRequest.getParameter("p_name");
		String currentImageMain=multipartRequest.getParameter("currentImageMain");
		String currentImageDetail=multipartRequest.getParameter("currentImageDetail");
		
		String p_code=multipartRequest.getParameter("p_code");
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
	if(p_image==null) {//전달된 대표이미지 파일이 없는 경우
		product.setP_image(currentImageMain);
	} else {//전달된 대표이미지 파일이 있는 경우
		product.setP_image(p_image);
		//서버 디렉토리에 저장된 기존 제품의 대표이미지 파일을 삭제 처리
		new File(saveDirectory, currentImageMain).delete();
	}
	if(p_image2==null) {//전달된 상세이미지 파일이 없는 경우
		product.setP_image2(currentImageDetail);
	} else {//전달된 상세이미지 파일이 있는 경우
		product.setP_image2(p_image2);
		//서버 디렉토리에 저장된 기존 제품의 상세이미지 파일을 삭제 처리
		new File(saveDirectory, currentImageDetail).delete();
	}
	product.setP_price(p_price);
	product.setP_stock(p_stock);	
	product.setP_color(p_color);
	product.setP_size(p_size);
	
	//제품정보를 전달받아 PRODUCT 테이블에 저장된 제품정보를 변경하는 DAO 클래스의 메소드 호출
	ProductDAO.getDAO().updateProduct(product);	
	
	//페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='index.jsp?workgroup=admin&process=product_detail&p_code="+product.getP_code()+"';");
	out.println("</script>");
%>