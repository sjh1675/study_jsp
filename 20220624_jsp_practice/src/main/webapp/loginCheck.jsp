<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*"%>
<%@ include file="conn.jsp"%>

<jsp:useBean id="joinMember" class="vo.MemberVO"/>
<jsp:setProperty property="*" name="joinMember" />

<%
	request.setCharacterEncoding("UTF-8");

	String inputId = request.getParameter("id");
	String inputPass = request.getParameter("pass");
	String inputCheck = request.getParameter("login");
	String sql = "SELECT * FROM test_member";
	
	String dbId = null;
	String dbPass = null;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg = "아이디나 비밀번호를 다시 확인해주세요.";
	
	try {
		pstmt = conn.prepareStatement(sql);		
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			dbId = rs.getString("id");
			dbPass = rs.getString("pass");
			
			if (dbId.equals(inputId) && dbPass.equals(inputPass)){
				MemberVO loginMember = new MemberVO(dbId);
				loginMember.setNum(rs.getInt("num"));
				loginMember.setPass(dbPass);
				loginMember.setName(rs.getString("name"));
				loginMember.setAddr(rs.getString("addr"));
				loginMember.setPhone(rs.getString("phone"));
				loginMember.setGender(rs.getString("gender"));
				loginMember.setAge(rs.getInt("age"));
				
				session.setAttribute("loginMember", loginMember);
				msg = "로그인 성공";
				
				if (inputCheck != null){
					Cookie cookie = new Cookie("id", dbId);
					cookie.setMaxAge(60*60*24*3);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
				break;
			}
		}
	} catch (SQLException e) {
		msg = "내부 오류";
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
	
%>

<script>
	alert("<%= msg %>");
<% if (msg.equals("로그인 성공")){ %>
	location.href="index.jsp";
<% } else { %>
	location.href="login.jsp";
<% }%>
</script>
