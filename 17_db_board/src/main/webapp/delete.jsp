<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="conn.jsp" %>

<%
	String num = request.getParameter("board_num");
	int board_num = Integer.parseInt(num);
	PreparedStatement pstmt = null;
	String sql = "DELETE FROM board_test WHERE board_num = ?";
	String msg = "";
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, board_num);
		
		int result = pstmt.executeUpdate();
		msg = result > 0 ? "성공" : "실패";
	} catch (SQLException e) {
		e.printStackTrace();
		msg = "오류";
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>

<script>
	alert('<%= msg %>');
	location.href="index.jsp";
</script>