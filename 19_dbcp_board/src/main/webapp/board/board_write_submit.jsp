<%@page import="util.DBCPUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("boardTitle");
	String auth = request.getParameter("boardAuth");
	String content = request.getParameter("boardContent");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String msg = "";
	
	try{
		conn = DBCPUtil.getConnection();
		String sql = "INSERT INTO tblBoard VALUES(null, ?, ?, ?, 0, now())";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, title);
		pstmt.setString(2, auth);
		pstmt.setString(3, content);
		
		int result = pstmt.executeUpdate();
		
		if (result > 0) {
			msg = "게시글 작성 완료";
		} else {
			msg = "게시글 작성 실패";
		}
	} catch (Exception e) {
		e.printStackTrace();
		msg = "글 작성 실패";
	} finally{
		DBCPUtil.close(pstmt, conn);
	}
	
%>
<script>
	alert('<%= msg %>');
	location.href="board_list_page.jsp";
</script>

