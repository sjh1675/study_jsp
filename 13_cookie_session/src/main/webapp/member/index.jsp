<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="joinMember" class="beans.MemberBean" scope="application" />
	<jsp:useBean id="loginMember" class="beans.MemberBean" scope="session" />
	<%
		request.setCharacterEncoding("UTF-8");
		Cookie[] cookies = request.getCookies();
		// 쿠키가 있고, 서버의 회원정보가 있고, 로그인이 안되어있을 때
		if (cookies != null && joinMember.getId() != null && loginMember.getId() == null) {
			for (Cookie c : cookies){
				System.out.println(c.getName() + " : " + c.getValue());
				if (c.getName().equals("id") && c.getValue().equals(joinMember.getId())){
					session.setAttribute("loginMember", joinMember);
					loginMember = joinMember;
				}
			}
		}
	%>
	
	<h1>INDEX JSP</h1>

	<%
		String name = loginMember.getName();
		if (name != null) {
	
	%>
		<%= name %>님 ㅎㅇ | <a href="logOut.jsp">로그아웃</a>
	<%} else {
			
	%>
		<a href="login.jsp">로그인</a> | <a href="join.jsp">회원가입</a>		
	<%	
		}
	%>

</body>
</html>