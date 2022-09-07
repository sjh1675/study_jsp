<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>방명록 메시지 삭제함</title>
</head>
<body>
<br/>

<!-- 삭제 확인 처리  알림 code 작성-->
<c:choose>
	<c:when test="${delete > 0}">
		<h1>방명록을 삭제하였습니다.</h1>
	</c:when>
	<c:otherwise>
		<h1>방명록 삭제 실패 하였습니다.</h1>
	</c:otherwise>
</c:choose>

<a href="guestbookList.gt">[목록 보기]</a>
</body>
</html>