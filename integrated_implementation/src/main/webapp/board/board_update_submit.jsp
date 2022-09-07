<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시글 수정 처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<f:requestEncoding value="utf-8" />
<c:catch var="e">
	<s:update var="result" dataSource="jdbc/MySQLDBCP">	
		UPDATE test_board SET board_name = ?, board_title = ?, board_content = ? WHERE board_num = ? AND board_pass = ?
		<s:param>${param.board_name}</s:param>
		<s:param>${param.board_title}</s:param>
		<s:param>${param.board_content}</s:param>
		<s:param>${param.board_num}</s:param>
		<s:param>${param.board_pass}</s:param>
	</s:update>
</c:catch>
<!-- 게시글 수정 결과 처리 -->
<c:choose>
		<c:when test="${result > 0 }">
			<script>
				location.href="<c:url value='board_detail.jsp?board_num=${param.board_num}'/>";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('수정실패! 정보가 일치하지 않습니다.');
				history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>

<c:if test="${!empty e}">
	<script>
		alert('수정실패! 정보가 일치하지 않습니다.');
		history.go(-1);
	</script>
</c:if>
