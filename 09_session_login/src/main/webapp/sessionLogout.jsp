<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogout.jsp</title>
</head>
<body>
<!-- 229F046C173F6F2EB01283D0B7F44AC6 -->
<!-- 229F046C173F6F2EB01283D0B7F44AC6 -->
	<%=session.getId() %><br>
	<%=session.getAttribute("MEMBERUID") %><br>
	로그아웃 완료 되었습니다.
	
	<%
   	/* session.removeAttribute("MEMBERUID"); */
   	// 세션 객체 삭제
   	session.invalidate();
	%>
</body>
</html>