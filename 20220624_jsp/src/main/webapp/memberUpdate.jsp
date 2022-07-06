<%@page import="javax.xml.crypto.dsig.spec.ExcC14NParameterSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, util.*, vo.*"%>
<%@ include file = "checkAdmin.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="m" class="vo.MemberVO" />
<jsp:setProperty property="*" name="m" />
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DBCPUtil.getConnection();
		String sql = "UPDATE test_member SET pass = ?, name = ?, addr = ?, phone = ?, gender = ?, age = ? WHERE num = ?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, m.getPass());
		pstmt.setString(2, m.getName());
		pstmt.setString(3, m.getAddr());
		pstmt.setString(4, m.getPhone());
		pstmt.setString(5, m.getGender());
		pstmt.setInt(6, m.getAge());
		pstmt.setInt(7, m.getNum());
		pstmt.executeUpdate();
	} catch(Exception e){
		e.printStackTrace();		
	} finally {
		DBCPUtil.close(pstmt, conn);
		response.sendRedirect("index.jsp?page=memberList");
	}
%>
