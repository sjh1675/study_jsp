<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.invalidate();
	
	Cookie cookie = new Cookie("id", "delete");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
%>
<script>
	alert("로그아웃 되었습니다.");
	location.href="index.jsp";
</script>
</body>
</html>