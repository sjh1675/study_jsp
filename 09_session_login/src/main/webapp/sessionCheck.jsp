<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionCheck.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		if (uid != null && uid.equals(upw)) {
			// 로그인 성공
			session.setAttribute("MEMBERUID", uid);
	%>
	<a href="sessionLogout.jsp">로그아웃</a>
	<a href="sessionLoginCheck.jsp">로그인 체크</a>
	<%		
		} else {
			// 로그인 실패
			response.sendRedirect("sessionLogin.jsp");
		}
	%>
</body>
</html>