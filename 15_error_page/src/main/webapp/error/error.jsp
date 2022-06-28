<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error.jsp</title>
</head>
<body>
	<h1>Error Page</h1>
	<h1>잘못 된 값이 전달 되었습니다.</h1>
	<h2><%= exception.getMessage() %></h2>
	<h3><%= exception.toString() %></h3>
	<a href="../index.jsp">메인으로</a>
</body>
</html>