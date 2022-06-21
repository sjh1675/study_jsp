<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		pageContext.setAttribute("aaa", "111");
		request.setAttribute("aaa", "111");
	%>
	<h3><%= pageContext.getAttribute("aaa") %></h3>
	<h3><%= request.getAttribute("aaa") %></h3>
	<form action="response" method="POST">
		<input type="text" name="id" value="id001" />
		<button>확인</button>
	</form><br>
	<a href="response?id=id001">response get</a>
	<a href="forward?id=id001">forward get</a>
</body>
</html>