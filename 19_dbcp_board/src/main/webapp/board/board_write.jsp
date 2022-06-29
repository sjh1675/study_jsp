<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<form action="board_write_submit.jsp" method="post">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="boardTitle"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="boardAuth" autofocus/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="boardContent" rows="20" cols="50" style="resize:none;"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="[작성완료"/>
					<input type="reset" value="다시쓰기"/>
					<button type="button" onclick="location.href='board_list_page.jsp';">목록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>



