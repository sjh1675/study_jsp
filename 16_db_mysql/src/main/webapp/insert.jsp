<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC CONNECTION INSERT TEST</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String sql = "INSERT INTO member(name, addr) VALUES(?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("addr"));
		int result = pstmt.executeUpdate();
		
		if (result > 0) {
			out.println("회원정보 등록 완료");
		} else {
			out.println("회원정보 등록 실패");
		}
		pstmt.close();
		conn.close();
	%>
	<a href="index.jsp">메인으로</a>
</body>
</html>