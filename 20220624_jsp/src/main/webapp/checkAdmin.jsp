<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />

<% if (loginMember.getId() == null || !loginMember.getId().equals("admin")) {
		
	out.print("<script>");
	out.print("alert('올바른 접근이 아닙니다.');");
	out.print("history.back();");
	out.print("</script>");
	return;
	}
%>