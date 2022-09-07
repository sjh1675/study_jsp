<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <!--  -->

<!DOCTYPE html>
<html lang="en">
<head>
	<title>방명록 메시지 목록</title>
</head>
<style>
	
</style>
<body>
<!-- 방명록 작성 전달을 위한 form tag 완성 -->
<form action="guestbookSubmit.gt" method="post">
	<table>
		<tr>
			<td colspan=3><h1>방명록 작성</h1></td>
		</tr>
		<tr>
			<td colspan=2></td>
			<td rowspan="4"><input type="submit" value="메시지 남기기" style="width:100%;height:100px;margin-left:20px;"/></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" style="width:100%;"/></td>
		<tr>
			<td>암호</td>
			<td><input type="password" name="password" style="width:100%;"/></td>
		</tr>
		<tr>
			<td>메시지</td>
			<td><textarea cols="35" rows="3" name="content"></textarea></td>
		</tr>
	</table>
</form>
<hr>

<!-- 방명록 리스트 정보 출력 -->

<c:choose>
	<c:when test="${!empty gbList}">
		<h1>방명록 리스트</h1>
		<table border="1" cellspacing="0" cellpadding="10" width="800px">
			<c:forEach var="gb" items="${gbList}">
				<tr>
					<td>
					메세지 번호 : ${gb.id} <br>
					손님 이름 : ${gb.guestName} <br>
					메세지 : ${gb.message} <br>
					<a href="guestbookConfirm.gt?id=${gb.id}">[삭제하기]</a> <br>
					</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		등록된 메세지가 없습니다.
	</c:otherwise>
</c:choose>

<!-- 방명록 리스트 정보 출력 end -->


<!-- 방명록 정보에 따른 paging block 화면 출력 작성 -->
<c:if test="${!empty pm && !empty gbList}">
	<c:if test="${pm.cri.page > 1}">
		<a href="guestbookList.gt?page=${1}">[처음]</a>
	</c:if>
	<c:if test="${pm.prev}">
		<a href="guestbookList.gt?page=${pm.startPage-1}">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
		<c:choose>
			<c:when test="${pm.cri.page eq i}">
				<span style="color: red;">[${i}]</span>
			</c:when>
			<c:otherwise>
				<a href="guestbookList.gt?page=${i}">[${i}]</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${pm.cri.page < pm.maxPage}">
		<c:if test="${pm.next}">
			<a href="guestbookList.gt?page=${pm.endPage+1}">[다음]</a>
		</c:if>	
		<a href="guestbookList.gt?page=${pm.maxPage}">[마지막]</a>
	</c:if>
</c:if>

<!-- 방명록 정보에 따른 paging block 화면 출력 end-->

</body>
</html>