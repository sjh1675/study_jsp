<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest1.jsp</title>
</head>
<body>
	<h1>이동된 페이지(forwardTest1.jsp)</h1>
	<table>
		<tr>
			<td>이름</td>
			<td><%= request.getParameter("name") %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%= request.getParameter("age") %></td>
		</tr>
		<tr>
			<td>전화</td>
			<td><%= request.getParameter("tel") %></td>
		</tr>
	</table>
</body>
</html>