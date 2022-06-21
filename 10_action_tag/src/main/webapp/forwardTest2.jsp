<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forwardTest2.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String requestPage = request.getParameter("resultPage");
		System.out.println("resultPage : " + requestPage);
		// response.sendRedirect(requestPage);	
	%>
	<jsp:forward page="<%= requestPage %>">
		<jsp:param name="tel" value="010-1234-5678" />
	</jsp:forward>
</body>
</html>