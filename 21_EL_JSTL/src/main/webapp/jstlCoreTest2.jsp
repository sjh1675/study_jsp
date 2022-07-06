<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jstlCoreTest2</h1>
	<h2>parameter name - ${param.name }</h2>
	<h1>제어문</h1>
	<c:set var="myCar" value="red" />
	<c:if test="${myCar eq 'red' }">
		내 차는 빨간색 <br>
	</c:if>
		<c:if test="${param.name eq '박주신' }">
		내 이름은 박주신! <br>
	</c:if>
	<c:set var="grade" value="30" />
	<c:choose>
		<c:when test="${grade >= 90 }">
			A학점 입니다. <br>
		</c:when>
		<c:when test="${grade >= 80 }">
			B학점 입니다. <br>
		</c:when>
		<c:when test="${grade >= 70 }">
			C학점 입니다. <br>
		</c:when>
		<c:otherwise>
			F학점 입니다. <br>
		</c:otherwise>
	</c:choose>
	<%
		int[] nums = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
		request.setAttribute("nums", nums);
	%>
	
	<c:forEach var="n" items="${nums }">
		${n } &nbsp; &nbsp;
	</c:forEach>
	<br>
	<c:forEach var="n" begin="1" end="100" step="3">
		${n } &nbsp; &nbsp;
	</c:forEach>
	<br>
	<c:set var="data" value="권능환,박주신,하옥형,이주명,박정대" />
	<c:forTokens var="name" items="${data }" delims=",">
		${name } &nbsp;
	</c:forTokens>
	
	<%
		java.util.ArrayList<String> list = new java.util.ArrayList<>();
		list.add("리트리버");
		list.add("시베리안 허스키");
		list.add("주주");
		list.add("푸들");
		list.add("말라뮤트");
		list.add("샤모에드");
		request.setAttribute("dogList", list);
	%>
	<br>
	<c:choose>
		<c:when test="${!empty dogList }">
			<c:forEach var="dog" items="${dogList }">
				<c:if test="${dog eq '주주' }">
					박주신 배신자...
				</c:if>
			</c:forEach>
		</c:when>
		<c:otherwise>
			목록이 존재하지 않습니다.
		</c:otherwise>
	</c:choose>
</body>
</html>