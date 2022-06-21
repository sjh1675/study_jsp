<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String memberId = (String)session.getAttribute("MEMBERUID");
    	boolean isLogin = (memberId != null) ? true : false;
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (isLogin) {
	%>
		아이디 : <%=memberId %> 로그인한 상태
	<%
		} else {
	%>		
		<script>
			alert('로그인 되지 않은 상태');
			location.href='sessionLogin.jsp';
		</script>
	<%
		}
	%>
</body>
</html>