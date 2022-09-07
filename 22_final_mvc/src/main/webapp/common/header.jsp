<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FINAL MVC</title>
<link type="text/css" href="resources/css/common.css" rel="stylesheet"/>
</head>
<body>
	<header>
		<div>
			<ul>
				<li><a href="test">HOME</a></li>
				<c:choose>
					<c:when test="${!empty sessionScope.member}">
						<li><a href="info.mc">${member.name}</a>님 반갑습니다.</li>
						<c:if test="${member.id eq 'admin' }">
						<li><a href="managementPage.mgc">회원목록</a></li>
						</c:if>
						<li><a href="logOut.mc">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="login.mc">로그인</a></li>
						<li><a href="join.mc">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="googleMailTest">google SMTP</a></li>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="notice.do">공지사항</a></li>
				<!-- *.qna -->
				<li><a href="boardList.qna">질문과답변</a></li>
			</ul>
		</div>
	</header>
</body>
</html>