<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT ROW_NUMBER() OVER(ORDER BY board_num ASC) AS rnum, board_test.* FROM board_test ORDER BY board_num DESC";
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
	} catch (SQLException e) {
		out.println("질의 실행 실패");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table tr:hover td {
		cursor: pointer;
		background-color: gray;
		color: white;
	}
</style>
</head>
<body>
	<section>
		<br>
		<a href="writeForm.jsp">글작성</a>
		<table border="1">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>기타</th>
			</tr>
			<% while (rs.next()) { %>
			
			<tr onclick="location.href='detail.jsp?board_num=<%= rs.getInt("board_num") %>'">
				<td><%= rs.getInt("rnum") %></td>
				<td><%= rs.getString("board_title") %></td>
				<td><%= rs.getString("board_auth") %></td>
				<td><%= rs.getTimestamp("board_date") %></td>
				<td>
					<a href="updateForm.jsp?board_num=<%= rs.getInt("board_num") %>">수정</a>
					<a href="delete.jsp?board_num=<%= rs.getInt("board_num") %>">삭제</a>
				</td>
			</tr>
			
			
			<% } %>
		</table>
	</section>
	<%
		rs.close();
		pstmt.close();
		conn.close();
	%>
</body>
</html>