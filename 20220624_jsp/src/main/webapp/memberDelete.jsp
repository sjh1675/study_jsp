<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*, java.sql.*, util.*" %>
<%@ include file="checkAdmin.jsp" %>

<h1>회원 정보 삭제</h1>

<%
	String num = request.getParameter("num");
	Connection conn = null;
	Statement stmt = null;
	
	try {
		conn = DBCPUtil.getConnection();
		stmt = conn.createStatement();
		String sql = "DELETE FROM test_member WHERE num = " + num;
		stmt.executeUpdate(sql);
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBCPUtil.close(stmt, conn);
		response.sendRedirect("index.jsp?page=memberList");
	}

%>

<%-- <%@ include file="conn.jsp" %>

<%
	String sql = "DELETE FROM test_member WHERE id = ?";
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	PreparedStatement pstmt = null;
	String msg = "탈퇴 실패";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, loginMember.getId());
		int result = pstmt.executeUpdate();
		
		msg = result > 0 ? "회원 탈퇴 완료" : "탈퇴 실패"; 
	} catch (SQLException e) {
		msg = "내부 오류";
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
	
	if (msg.equals("회원 탈퇴 완료")){
		Cookie cookie = new Cookie("id","");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		session.removeAttribute("loginMember");
	}
%>

<script>
	alert("<%= msg %>");
	location.href="index.jsp";
</script> --%>