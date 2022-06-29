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
		String id = request.getParameter("id");
	%>
	<form action="guestbook_delete.jsp" method="POST">
		<input type="hidden" name="id" value="<%= id %>" />
		메세지를 삭제하려면 비밀번호를 입력하세요<br>
		비밀번호 : <input type="password" name="password" />
		<input type="submit" value="메세지 삭제" />		
	</form>
</body>
</html>