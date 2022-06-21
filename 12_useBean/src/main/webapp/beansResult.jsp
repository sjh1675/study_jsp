<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="test.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>beansResult.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		
		UserVO vo = new UserVO(name, addr, email);
		session.setAttribute("vo", vo);
	%>
	<%= session.getAttribute("vo") %> <br>
	
	<jsp:useBean id="userVO" class="test.UserVO" scope="session" />
	
	<!-- value를 생략하면 request.getParameter("name") 을 밸류로 써준다 -->
	<%-- <jsp:setProperty name="userVO" property="name"/>	
	<jsp:setProperty name="userVO" property="addr"/>
	<jsp:setProperty name="userVO" property="email"/> --%>
		
	<jsp:setProperty property="*" name="userVO"/>
	
	
	<%= session.getAttribute("userVO") %>	

</body>
</html>