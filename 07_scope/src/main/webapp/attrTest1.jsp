<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attrTest1.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		
		if (id != null) {
			application.setAttribute("id", id);
			pageContext.setAttribute("pageContextId", id);
		}		
	%>
	<h3>request param 아이디 : <%=id %></h3>
	<h3>application 영역 아이디 : <%=application.getAttribute("id") %></h3>
	<h3>pageContext 아이디 : <%=pageContext.getAttribute("pageContextId") %></h3>
	<form action="attrTest2.jsp" method="POST">
		이메일 : <input type="email" name="email" required/ >
		<button>확인</button>		
	</form>
</body>
</html>