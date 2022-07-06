<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*, java.sql.*, util.*" %>
    
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session" />

<% if (loginMember.getName() == null) { %>
	<script>
		alert("잘못된 접근입니다.");
		history.go(-1);
	</script>				
		
<%} else if (loginMember.getId().equals("admin")) {%>
	<script>
		alert("관리자 계정은 삭제할 수 없습니다.");
		history.go(-1);
	</script>    
<%} else {
		Connection conn = null;
		Statement stmt = null;
		
		conn = JDBCUtil.getConnection();
		String sql = "DELETE FROM test_member WHERE num = " + loginMember.getNum();
		stmt = conn.createStatement();
		int result = stmt.executeUpdate(sql);
		
		if (result > 0) {
			response.sendRedirect("logout.jsp");
		} else {
			out.print("<script>");
			out.print("alert('회원탈퇴 실패');");
			out.print("history.go(-1);");
			out.print("</script>");
		}
		JDBCUtil.close(stmt, conn);
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