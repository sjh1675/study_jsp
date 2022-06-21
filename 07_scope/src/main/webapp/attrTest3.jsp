<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest3.jsp</title>
</head>
<body>
	<h3>application id <%=application.getAttribute("id")%></h3>
	<h3>pageContext id <%=pageContext.getAttribute("pageContextId")%></h3>	
	<h3>request email <%=request.getAttribute("requestEmail")%></h3>
	<h3>session email <%=session.getAttribute("email") %></h3>
	<a href="attrTest4.jsp">pageContext &amp;&amp; request</a>
</body>
</html>