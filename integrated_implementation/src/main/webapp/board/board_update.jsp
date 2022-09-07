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
	<c:set target="${board}" property="board_num" value="${row.board_num }"/>
	<c:set target="${board}" property="board_name" value="${row.board_name }"/>
	<c:set target="${board}" property="board_pass" value="${row.board_pass }"/>
	<c:set target="${board}" property="board_title" value="${row.board_title }"/>
	<c:set target="${board}" property="board_content" value="${row.board_content }"/>
	<c:set target="${board}" property="board_readcount" value="${row.board_readcount }"/>
	<c:set target="${board}" property="board_date" value="${row.board_date }"/>
</c:forEach>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시물 수정</h1>
	<form action="board_update_submit.jsp" method="post">
	<input type="hidden" name="board_num" value="${board.board_num}"/>
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="board_name" value="${board.board_name}" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="board_pass" required/></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title" value="${board.board_title}"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows=10 cols=40 name="board_content">${board.board_content}</textarea></td>
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="수정완료"/></td>
			</tr>
		</table>
	</form>
</body>
</html>