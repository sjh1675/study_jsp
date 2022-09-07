<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시글 작성 요청 처리 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<f:requestEncoding value="utf-8"/>

<jsp:useBean id="b" class="vo.TestBoardVO" />
<jsp:setProperty property="*" name="b" />

<s:update var="result" dataSource="jdbc/MySQLDBCP">
	INSERT INTO test_board VALUES(null, ?, ?, ?, ?, 0, now())
	<s:param>${b.board_name}</s:param>
	<s:param>${b.board_pass}</s:param>
	<s:param>${b.board_title}</s:param>
	<s:param>${b.board_content}</s:param>	
</s:update>
<!-- 게시글 작성 결과 처리 -->

<c:choose>
	<c:when test="${result > 0}">
		<script>
			alert('게시물 등록 성공');
			location.href="board_list.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert('게시물 등록 실패');
			location.href="board_list.jsp";
		</script>
	</c:otherwise>
</c:choose>