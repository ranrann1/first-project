<%@page import="ez_phone.dao.MemberDAO"%>
<%@page import="ez_phone.dto.MemberDTO"%>
<%@page import="ez_phone.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인정보를 전달받아 MEMBER 테이블에 저장된 회원정보와 비교하여 인증 처리하고 결과를 이용해 
페이지 이동 관련 정보를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 인증 실패 : 로그인정보 입력페이지(member_login.jsp)로 이동 --%>    
<%-- => 인증 성공 : 세션에 권한 관련 정보를 저장하고 기존 요청 페이지로 이동 - 기존 요청페이지가 
없는 경우 제품목록 출력페이지(product_list.jsp)로 이동 --%>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=error&process=error_400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	MemberDTO member=MemberDAO.getDAO().selectMember(id);
	
	//검색된 아이디의 회원정보가 없거나 탈퇴회원인 경우 - 아이디 인증 실패
	if(member==null || member.getStatus()==0) {
		session.setAttribute("message", "입력된 아이디가 존재하지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=member&process=member_login';");
		out.println("</script>");
		return;
	}
	
	//전달된 비밀번호와 검색된 회원정보의 비밀번호가 같지 않은 경우 - 비밀번호 인증 실패
	if(!passwd.equals(member.getPasswd())) {
		session.setAttribute("message", "입력된 아이디가 잘못 되었거나 비밀번호가 맞지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=member&process=member_login';");
		out.println("</script>");
		return;
	}
	
	//인증 성공 
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보의 마지막 로그인 날짜를 변경하는 DAO 클래스의 메소드 호출
	/* MemberDAO.getDAO().updateLastLogin(id); */
	
	//세션에 권한 관련 정보(회원정보) 저장
	session.setAttribute("loginMember", MemberDAO.getDAO().selectMember(id));
	
	//세션에 저장된 요청 페이지의 URL 주소를 반환받아 저장
	String url=(String)session.getAttribute("url");
	
	if(url==null) {//요청 페이지의 URL 주소가 없는 경우
		//제품목록 출력페이지 이동 - 메인 페이지
		out.println("<script type='text/javascript'>");
		out.println("location.href='index.jsp?workgroup=main&process=main';");
		out.println("</script>");
	} else {//요청 페이지의 URL 주소가 있는 경우
		session.removeAttribute("url");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+url+"';");
		out.println("</script>");
	}
%>    











