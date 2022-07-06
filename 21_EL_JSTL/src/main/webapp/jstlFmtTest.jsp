<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<f:requestEncoding value="UTF-8"/>
	<c:out value="${param.addr }"/> <br>
	<c:out value="${param.encode }"/> <br>
	<%= response.getLocale() %>	
	<c:if test="${!empty param.encode }">
		<c:set var="encode" value="${param.encode }"/>
	</c:if>
	<f:setLocale value="${encode }"/>
	<%= response.getLocale() %>
	<br>
	<h3>다국어 처리 지원 - bundle</h3>
	<f:bundle basename="bundle">
		<f:message key="name"/>
		<f:message key="name_en"/>
	</f:bundle>
	<br>
	<hr>
	<f:bundle basename="prop/bundle">
		<f:message var="name" key="name"/>
		<f:message var="addr" key="addr">
			<f:param value="${param.addr}"/>
			<f:param value="84"/>
		</f:message>
		<f:message var="phone" key="phone"/>
	</f:bundle>
	<br>
	이름 : ${name }<br>
	주소 : ${addr }<br>
	전화 : ${phone }<br>
	<hr>
	<h2>날짜 형식 지정</h2>
	<jsp:useBean id="now" class="java.util.Date" />
	java.util.Date : <c:out value="${now }"/><br>
	<!-- type(default -> date) : date(날짜), time(시간), both(둘다) -->
	<f:formatDate value="${now}" type="date" /><br>
	<f:formatDate value="${now}" type="time" /><br>
	<f:formatDate value="${now}" type="both" /><br>
	<hr>
	
	<!-- dateStyle(default -> medium) : full, long, medium, short -->
	<f:formatDate value="${now}" type="date" dateStyle="full" /><br>
	<f:formatDate value="${now}" type="date" dateStyle="long" /><br>
	<f:formatDate value="${now}" type="date" dateStyle="medium" /><br>
	<f:formatDate value="${now}" type="date" dateStyle="short" /><br>
	<hr>
	
	<h1>time</h1>
	<!-- timeStyle : 위의 dateStyle과 속성이 같음 -->
	<f:formatDate value="${now}" type="time" /><br>
	<f:formatDate value="${now}" type="time" timeStyle="full"/><br>
	<f:formatDate value="${now}" type="time" timeStyle="long"/><br>
	<f:formatDate value="${now}" type="time" timeStyle="medium"/><br>
	<f:formatDate value="${now}" type="time" timeStyle="short"/><br>
	<hr>
	
	<h1>both</h1>
	<f:formatDate value="${now}" type="both" /><br>
	<f:formatDate value="${now}" type="both" dateStyle="full"/><br>
	<f:formatDate value="${now}" type="both" dateStyle="long"/><br>
	<f:formatDate value="${now}" type="both" dateStyle="medium"/><br>
	<f:formatDate value="${now}" type="both" dateStyle="short"/><br>
	
	<hr>
	<h1>pattern</h1>
	<f:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss"/><br>
	
	<hr>
	<h3>parseDate - ${param.selectDate }</h3>
	
	<!-- 문자열 시간값을 Date 객체로 변환 -->
	<f:parseDate var="now" value="${param.selectDate}" pattern="yyyy-MM-dd" scope="page"/>
	parseDate : <c:out value="${now }"/>
	
	<hr>
	<h2>Number Fommater</h2>
	<c:set var="price" value="10000000" />
	${price }<br>
	<!-- type : number, currency -->
	<f:formatNumber var="numberType" type="number" value="${price}" />
	<f:formatNumber var="currency" type="currency" value="${price}" />
	numberType : ${numberType}<br>
	currency : ${currency}<br>
	<hr>
	<h3>pattern</h3>
	<f:formatNumber value="${price}" pattern="￦0,000.00"/>
	
</body>
</html>