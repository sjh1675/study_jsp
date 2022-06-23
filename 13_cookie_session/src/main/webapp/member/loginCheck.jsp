<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginCheck.jsp</title>
</head>
<body>
	<jsp:useBean id="joinMember" class="beans.MemberBean" scope="application"></jsp:useBean>	

	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String login = request.getParameter("login");

	String message = "";
	String nextPage = "";
	
	if (joinMember.getId() == null) {
		message = "등록된 회원 정보가 없습니다.";
		nextPage = "join.jsp";
	} else if (joinMember.getId().equals(id) && joinMember.getPw().equals(pw)) {
		// 로그인 처리
		message = "로그인 성공";
		nextPage = "index.jsp";
		session.setAttribute("loginMember", joinMember);
		
		// 체크박스가 체크되었다면
		if (login != null) {
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(60*60*24*7);
			response.addCookie(cookie);
		}
		
	} else {
		// 로그인 실패
		message = "로그인 실패";
		nextPage = "login.jsp";
	}
	
	out.print("<script>");	
	out.print("alert('" + message + "');");
	out.print("location.href='" + nextPage + "';");
	out.print("</script>");
	%>
</body>
</html>