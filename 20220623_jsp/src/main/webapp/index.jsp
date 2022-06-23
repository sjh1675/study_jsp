<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, vo.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>

		<style>
			body {
			height: 900px;
			}
		</style>
	</head>
	
	<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] cookies = request.getCookies();

	List<MemberVO> memberList = (ArrayList<MemberVO>)application.getAttribute("memberList");
	
	if (memberList != null && cookies != null && loginMember.getId() == null) {
		for (Cookie c : cookies) {
			System.out.println(c.getName() + " : " + c.getValue());
			
			if (!c.getName().equals("id")) continue;
			
			for (MemberVO m : memberList) {
				if (c.getValue().equals(m.getId())) {
					session.setAttribute("loginMember", m);
					loginMember = m;
				}
			}
		}
	}

	String nextPage = request.getParameter("page");
	if (nextPage == null) {
		nextPage = "default";
	}

	nextPage = nextPage + ".jsp";
%>

	<body>
		<jsp:include page="header.jsp" />
		<jsp:include page="<%=nextPage%>" />
		<jsp:include page="footer.jsp" />
	</body>
</html>