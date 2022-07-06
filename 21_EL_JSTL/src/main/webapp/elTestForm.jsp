<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTestForm</title>
</head>
<body>
	<!-- 4대 영역객체나 Parameter 값을 쉽게 jsp 페이지 내부에서 사용할 수 있도록 지원하는 언어 -->
	<h1>EXPRESSION LANGUAGE</h1>
	<%
		pageContext.setAttribute("scopeName", "pageContext");
		request.setAttribute("scopeName", "request");
		session.setAttribute("scopeName", "session");
		application.setAttribute("scopeName", "application");
	%>
	
	page 영역 : <%= pageContext.getAttribute("scopeName") %><br>
	request 영역 : <%= request.getAttribute("scopeName") %><br>
	session 영역 : <%= session.getAttribute("scopeName") %><br>
	application 영역 : <%= application.getAttribute("scopeName") %><br>
	<br><br>
	<%-- EL 사용 표현식 : ${} --%>
	EL속성 값으로 출력 <br>
	page 영역 : ${pageScope.scopeName}<br>
	request 영역 : ${requestScope.scopeName}<br>
	session 영역 : ${sessionScope.scopeName}<br>
	application 영역 : ${applicationScope.scopeName}<br>
	<br>
	<hr>
	EL scopeName : ${scopeName }<br>
	
	<%
		session.setAttribute("test", "박주신");
	%>
	EL test : ${test }<br>
	
	<form action="elTest.jsp" method="POST">
		<input type="text" name="test"/>
		<button>확인</button>
	</form>
</body>
</html>