<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="varPage" value="pageContext 지정" scope="page" />
	EL : ${pageScope.varPage } <br>
	<%
		String pageValue = "스크립트로 저장";
		pageContext.setAttribute("pageName", pageValue);
	%>
	EL : ${pageName } <br>

	<c:remove var="pageName" scope="page" />
	EL remove : ${pageName } <br>
	<hr>
	<c:out value="${varPage}" /><br>
	<c:set var="test1" value="<script>alert('박주신 메롱');</script>" />
	
	test1 : 스크립트 메세지 출력 ${test1 } <br>
	test1 : <c:out value="${test1 }" /> <br>
	test1 : out의 escapeXml 속성을 이용하여 스크립트 메세지 출력 <c:out value="${test1 }" escapeXml="false" /> <br>
	<hr>
	test2 : <c:out value="${test2 }" default="test2는 존재하지 않습니다." /><br>
	test3 : <c:out value="${test3 }">test3는 존재하지 않습니다.</c:out> <br>
	
	<jsp:useBean id="member" class="vo.MemberVO" scope="page"/>
	${member } <br>
	<c:set target="${member }" property="id" value="id001"/>
	<c:set target="${member }" property="pass" value="pw001"/>
	${member } <br>
	<hr>
	<!-- 지정된 경로에 contextPath를 자동으로 부여 -->
	<a href="/index.jsp">index</a> (잘못된 경로)<br>
	
	<c:url var="pageLink" value="/index.jsp"/>
	<a href="${ pageLink }">url index</a> <br>	
	
	<a href='<c:url value="/index.jsp"/>'>url index</a><br> <!-- 변수명을 생략하면 즉시 출력 -->
	
	<c:url value="/test/test.jsp" /> <br> <hr>
	<%-- <c:redirect url="jstlCoreTest2.jsp" /> --%>
	
	<!-- include(액션 태그)와 동일 >> 변수 공유는 안되고, 파라미터 전달을 통해서 데이터 이동 -->
	<!-- 액션태그의 include와의 차이는 외부에 있는 파일도 지정할 수 있음 -->
	<c:import url="jstlCoreTest2.jsp" >
		<c:param name="name" value="최기근" />
	</c:import>
	<br><br><br><br><br>
	<!-- 외부 예시 -->
<%-- <div>
	  	 <jsp:include page="https://www.naver.com" />
	 </div> --%>
	
	<c:import url="https://www.naver.com" />
	
	
		
</body>
</html>