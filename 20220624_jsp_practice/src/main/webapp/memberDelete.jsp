<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" %>
<%@ include file="conn.jsp" %>

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
</script>