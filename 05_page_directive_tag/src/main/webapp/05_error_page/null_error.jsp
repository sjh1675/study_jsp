<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_error_page/null_error.jsp</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	out.print(name.toString());
%>
</body>
</html>