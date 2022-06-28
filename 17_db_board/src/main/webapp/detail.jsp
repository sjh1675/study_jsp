<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="conn.jsp" %>
<%
	String num = request.getParameter("board_num");
	int board_num = Integer.parseInt(num);
	
	Statement stmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM board_test WHERE board_num = " + board_num;
	
	String title = null;
	String auth = null;
	String content = null;
	java.util.Date date = null;
	
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);		
		if (rs.next()){
			title = rs.getString("board_title");
			auth = rs.getString("board_auth");
			content = rs.getString("board_content");
			date = rs.getTimestamp("board_date");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (rs != null) rs.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th colspan="2"><h1>게시글 상세보기</h1></th>
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
			<td><%= content %></td>
		</tr>
		<tr>
			<td>작성시간</td>
			<td><%= date %></td>
		</tr>
		<tr>
			<th colspan="2" align="center">
				<input type="button" value="메인으로" onclick="location.href='index.jsp'" />
			</th>
		</tr>
	</table>
</body>
</html>