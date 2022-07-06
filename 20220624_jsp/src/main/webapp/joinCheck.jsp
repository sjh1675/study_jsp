<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*, java.sql.*, util.*"%>
    
<%
	request.setCharacterEncoding("UTF-8");

/* 	MemberVO joinMember = (MemberVO)pageContext.getAttribute("joinMember");
	if (joinMember == null) {
		joinMember = new MemberVO();
		pageContext.setAttribute("joinMember", joinMember);
	}
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String strAge = request.getParameter("age");
	
	int age = Integer.parseInt(strAge);
	
	joinMember.setId(id);
	joinMember.setPass(pass);
	joinMember.setName(name);
	joinMember.setAddr(addr);
	joinMember.setPhone(phone);
	joinMember.setGender(gender);
	joinMember.setAge(age); */
%>
 
<jsp:useBean id="joinMember" class="vo.MemberVO" scope="page"/>
<jsp:setProperty property="*" name="joinMember" /> 

<%= joinMember %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String msg = "";
	String nextPage = "";
	
	
	try {
		conn = JDBCUtil.getConnection();
		
		String sql = "SELECT id FROM test_member WHERE id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			// 아이디 중복
			msg = "이미 존재하는 아이디입니다.";
			nextPage = "join";
		} else {
			// 가입 가능
			if (pstmt != null) pstmt.close();
			
			sql = "INSERT INTO test_member VALUES(null, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, joinMember.getId());
			pstmt.setString(2, joinMember.getPass());
			pstmt.setString(3, joinMember.getName());
			pstmt.setString(4, joinMember.getAddr());
			pstmt.setString(5, joinMember.getPhone());
			pstmt.setString(6, joinMember.getGender());
			pstmt.setInt(7, joinMember.getAge());
			
			int result = pstmt.executeUpdate();
			
			if (result > 0){
				msg = "회원가입성공";
				nextPage = "default";

			} else {
				msg = "회원가입 실패";
				nextPage = "join";
			}
		}
	} catch (SQLException e) {
		msg = "회원가입 실패";
		nextPage = "join";
	} finally {
		JDBCUtil.close(rs, pstmt, conn); 		
		out.print("<script> alert('"+msg+"'); location.href='index.jsp?page="+nextPage+"' </script>");
	}
%>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
</script> --%>