<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>내부 공사중 빠르게 수정하겠습니다.</h1>
	<h3><%= exception.getMessage() %></h3>
	<h3><%= exception.toString() %></h3>
	<a href="../index.jsp">메인으로</a>
</body>
</html>