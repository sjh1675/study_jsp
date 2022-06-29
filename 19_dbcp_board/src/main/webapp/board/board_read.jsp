<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBCPUtil" %>

<%
	String num = request.getParameter("boardNum");
	String title = "";
	String auth = "";
	String content = "";
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		int boardNum = Integer.parseInt(num);
		String sql = "SELECT boardTitle, boardAuth, boardContent FROM tblBoard WHERE boardNum = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, boardNum);
		
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			title = rs.getString(1);
			auth = rs.getString(2);
			content = rs.getString(3);
		}
		
		DBCPUtil.close(rs, pstmt);
		sql = "UPDATE tblBoard SET boardReadCount = boardReadCount + 1 WHERE boardNum = ?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, boardNum);
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBCPUtil.close(rs, pstmt, conn);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
</head>
<body>
	<table>
		<tr>
			<td colspan="2"><h3><%= num %>번의 게시글 상세보기</h3></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%= title %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%= auth %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea readonly rows="20" cols="50" style="resize: none;"><%= content %></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<a href="board_list_page.jsp">메인으로</a>
			|
			<a href="board_update.jsp?boardNum=<%= num %>">수정</a>
			|
			<a href="board_delete.jsp?boardNum=<%= num %>">삭제</a>
			</td>
		</tr>
	</table>
</body>
</html>



