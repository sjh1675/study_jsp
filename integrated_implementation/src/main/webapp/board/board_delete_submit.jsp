<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시글 삭제 요청 처리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<s:update var="result" dataSource="jdbc/MySQLDBCP">
	DELETE FROM test_board WHERE board_num = ? AND board_pass = ?
	<s:param>${param.board_num}</s:param>
	<s:param>${param.board_pass}</s:param>
</s:update>
    
<!-- 게시글 삭제 요청 결과 처리 -->

<c:if test="${result > 0 }">
	<c:redirect url="board_list.jsp"/>
</c:if>
<c:if test="${result != 1 }">
	<c:redirect url="board_delete.jsp?board_num=${param.board_num}"/>	
</c:if>