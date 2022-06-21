<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result.jsp</title>
</head>
<body>
	<h1>RESULT JSP</h1>
	<h3>page <%=pageContext.getAttribute("aaa") %></h3>
	<h3>request <%=request.getAttribute("aaa") %></h3>
	<h3>request answer <%=request.getAttribute("answer") %></h3>
	<h3>request parameter <%=request.getParameter("id") %></h3>
</body>
</html>