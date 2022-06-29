<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>    
<!-- 게시글 삭제 처리 -->

<%
	String num = request.getParameter("boardNum");

	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	
	String msg = "";
	
	try {
		String sql = "DELETE FROM tblBoard WHERE boardNum = ?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, num);
		int result = pstmt.executeUpdate();
		msg = (result > 0) ? "삭제 완료" : "삭제 실패";
	} catch (Exception e) {
		msg = "삭제 실패";
		e.printStackTrace();
	} finally {
		DBCPUtil.close(pstmt, conn);
	}
%>
<script>
	alert('<%= msg %>');
	location.href="board_list_page.jsp";
</script>




