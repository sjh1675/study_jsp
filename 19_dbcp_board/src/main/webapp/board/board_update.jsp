<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBCPUtil" %>

<%
	String num = request.getParameter("boardNum");
	
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String title = "";
	String auth = "";	
	String content = "";
	
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
<title>게시글 수정</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="board_update_submit.jsp" method="post">
	<input type="hidden" name="boardNum" value="<%= num %>" />
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="boardTitle" value="<%= title %>"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="boardAuth" value="<%= auth %>"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="boardContent" rows="30" cols="50" style="resize:none;"><%= content %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정완료"/></td>
			</tr>
		</table>
	</form>
</body>
</html>