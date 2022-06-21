<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_error_page/error_page.jsp</title>
</head>
<body>
	<h1>알 수 없는 오류</h1>
	<h3>잘못된 요청입니다. 다시 확인해주세요.</h3>
	<a href="../index.jsp">뒤로가기</a>
	<%= exception.getMessage() %>
</body>
</html>