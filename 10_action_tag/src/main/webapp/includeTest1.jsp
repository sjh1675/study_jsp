<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>includeTest1.jsp</title>
</head>
<body>
	<% 
		response.addHeader("aaa", "jooker");
	%>
	<h1>여기는 includeTest1.jsp 입니다</h1>
	<%-- <%@ include file="includeTest2.jsp" %> --%>
	<jsp:include page="includeTest2.jsp">
		<jsp:param name="name" value="PJS" />
	</jsp:include>
	
	<%-- <%= str %> --%>
</body>
</html>