<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<s:query var="rs" dataSource="jdbc/MySQLDBCP">
	SELECT * FROM test_board WHERE board_num = ?
	<s:param>${param.board_num}</s:param>
</s:query>
<c:forEach var="row" items="${rs.rows}">
	<jsp:useBean id="board" class="vo.TestBoardVO" scope="request" />
	<c:set target="${board }" property="board_num" value="${row.board_num }"/>
	<c:set target="${board }" property="board_name" value="${row.board_name }"/>
	<c:set target="${board }" property="board_pass" value="${row.board_pass }"/>
	<c:set target="${board }" property="board_title" value="${row.board_title }"/>
	<c:set target="${board }" property="board_content" value="${row.board_content }"/>
	<c:set target="${board }" property="board_readcount" value="${row.board_readcount }"/>
	<c:set target="${board }" property="board_date" value="${row.board_date }"/>
</c:forEach>

<s:update dataSource="jdbc/MySQLDBCP">
	UPDATE test_board SET board_readcount = board_readcount + 1 WHERE board_num = ?
	<s:param>${board.board_num}</s:param>
</s:update>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 상세내용</h1>
	<table>
		<tr>
			<td>작성자</td>
			<td>${board.board_name}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${board.board_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea readonly cols=40 rows=10>${board.board_content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<a href="board_update.jsp?board_num=${board.board_num}">[수정]</a>
				<a href="board_delete.jsp?board_num=${board.board_num}">[삭제]</a>
				<a href="board_list.jsp">[목록]</a>
			</td>
		</tr>
	</table>
</body>
</html>