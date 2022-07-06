<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="test" value="Hello, Java Server Pages!" />
	toUpperCase : ${fn:toUpperCase(test) }<br>
	toLowerCase : ${fn:toLowerCase(test) }<br>
	<c:set var="text" value="image.png" />
	startsWith : ${fn:startsWith(text, "image") }<br>
	endsWith : ${fn:endsWith(text, ".png") }<br>
	<hr>
	contains : ${fn:contains(test, "java") }<br>
	containsIgnoreCase : ${fn:containsIgnoreCase(test, "java") }<br>
	<hr>
	indexOf : ${fn:indexOf(test, "Java") } <br>
	substringBefore : ${fn:substringBefore(test, "Java") } <br>
	substringAfter : ${fn:substringAfter(test, "Java") } <br>
	<!-- substring(test,startIndex,endIndex(-1)) -->
	substring : ${fn:substring(test,fn:indexOf(test,"Java"),11)} <br/>
	<hr/>
	<c:set var="strs" value="${fn:split(test,' ')}" />
	<c:forEach var="str" items="${strs}">
		${str}<br/>
	</c:forEach>
	<br>
	${fn:join(strs, "|")} <br>
	<hr>
	<div style='border: 1px solid red;'>안녕하세요</div><br>
	<c:set var="tag" value="<div style='border: 1px solid red;'>안녕하세요</div>" />
	${tag } <br>
	core/out : <c:out value="${tag }"/> <br>
	fn/escapeXml : ${fn:escapeXml(tag) } <br>
	${fn:replace(tag, '<', '&lt;')} <br>
	</body>
</html>
