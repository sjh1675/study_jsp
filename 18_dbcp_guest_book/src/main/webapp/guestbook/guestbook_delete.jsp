<%@page import="java.sql.*, util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String msg = "";
		String paramID = request.getParameter("id");
		String password = request.getParameter("password");
		
		Connection conn = DBCPUtil.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			int id = Integer.parseInt(paramID);
			String sql = "DELETE FROM test_guestbook WHERE id = ? AND password = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, id);
			pstmt.setString(2, password);
			int result = pstmt.executeUpdate();
			
			msg = result > 0 ? "삭제 성공" : "삭제 실패";
		} catch (SQLException e){
			msg = "삭제 실패";
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
	%>
	<%= msg %>
</body>
</html>