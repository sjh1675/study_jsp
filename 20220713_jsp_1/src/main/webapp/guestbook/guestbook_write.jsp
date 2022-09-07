<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>방명록 메시지 작성 확인</title>
</head>
<body>
<!-- 방명록 작성 후 처리 결과 출력 code 작성 -->
<c:choose>
	<c:when test="${write > 0}">
		<h1>방명록 등록 성공</h1>
		방명록에 메세지를 남겼습니다.<br>
	</c:when>
	<c:otherwise>
		<h1>방명록 등록 실패</h1>
		방명록에 메세지를 남기는데 실패하였습니다.<br>
	</c:otherwise>
</c:choose>

<!-- 방명록 작성 후 처리 결과 출력 code 작성 end-->
<a href="guestbookList.gt">[목록 보기]</a>
</body>
</html>