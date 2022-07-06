<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*"%>
<%@ include file="conn.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="joinMember" class="vo.MemberVO"/>
<jsp:setProperty property="*" name="joinMember" />

<%
	
	String sql = "INSERT INTO test_member VALUES(null, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt = null;
	String msg = "";
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, joinMember.getId());
		pstmt.setString(2, joinMember.getPass());
		pstmt.setString(3, joinMember.getName());
		pstmt.setString(4, joinMember.getAddr());
		pstmt.setString(5, joinMember.getPhone());
		pstmt.setString(6, joinMember.getGender());
		pstmt.setInt(7, joinMember.getAge());
		
		int result = pstmt.executeUpdate();
		
		msg = result > 0 ? "성공" : "실패";
	} catch (SQLException e) {
		msg = "오류";
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>

<script>
	alert('<%= msg %>');
	location.href="login.jsp";
</script>