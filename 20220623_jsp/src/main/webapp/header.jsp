<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#header {
		border: 1px solid black;
		height: 100px;
	}
	a {
		height: 100px; 
		weight: 80px;
		line-height: 100px;
		
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>

<div align="right" id="header">
	<a href="index.jsp?page=default">HOME</a>
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	if (loginMember.getId() == null) {
		%>
			<a href="index.jsp?page=login">로그인</a>
			<a href="index.jsp?page=join">회원가입</a>	
		<%
	} else {
		%>
			<a href="index.jsp?page=info"><%=loginMember.getName() %>님 반갑습니다.</a>
			<a href="logOut.jsp">로그아웃</a>
		<%
	}
%>
	
</div>
<hr>
</body>
</html>