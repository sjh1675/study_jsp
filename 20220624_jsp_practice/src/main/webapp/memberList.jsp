<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="conn.jsp" %>
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

<%
	String sql = "SELECT * FROM test_member";
	Statement stmt = null;
	ResultSet rs = null;	
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		%> 		

	<table border="1">
		<tr>
			<th colspan="7"><h1>회원목록</h1></th>
		</tr>
		<tr>
			<th>번호</th> <th>아이디</th> <th>이름</th> <th>주소</th> <th>전화번호</th> <th>성별</th> <th>나이</th>			
		</tr>
		<% while (rs.next()) {
			String num = rs.getString("num");
			String id = rs.getString("id");
			String name = rs.getString("name");
			String addr = rs.getString("addr");
			String phone = rs.getString("phone");
			String gender = rs.getString("gender");
			String age = rs.getString("age");
			%>		
		<tr onclick="location.href='memberInfo.jsp?num=<%= num%>&id=<%= id %>&name=<%= name %>&addr=<%= addr %>&phone=<%= phone %>&gender=<%= gender %>&age=<%= age %>'">
			<td><%= num %></td> <td><%= id %></td> <td><%= name %></td> <td><%= addr %></td> <td><%= phone %></td> <td><%= gender %></td> <td><%= age %></td>			
		</tr>
		<% } %>
	</table>
	
	 
 
 <% } catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (rs != null) rs.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	}
	 %>
	
</body>
</html>