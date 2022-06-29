<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %> <!-- jdbc -->
<%@ page import="javax.sql.*" %> <!-- dbcp -->
<%@ page import="javax.naming.*" %>
<%@ page import="util.DBCPUtil" %>

<%
	request.setCharacterEncoding("UTF-8");
	String msg = "";
%>
<jsp:useBean id="guestBook" class="vo.GuestBook" />
<jsp:setProperty name="guestBook" property="*" />

<%
	Connection conn = DBCPUtil.getConnection();
	
	PreparedStatement pstmt = conn.prepareStatement("INSERT INTO test_guestbook VALUES(null, ?, ?, ?)");
	pstmt.setString(1, guestBook.getGuestName());
	pstmt.setString(2, guestBook.getPassword());
	pstmt.setString(3, guestBook.getMessage());
	
	int result = pstmt.executeUpdate();
	
	msg = result > 0 ? "등록 성공" : "등록 실패";
	
	DBCPUtil.close(pstmt, conn);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3><%= msg %></h3>
	<a href="guestbook_list.jsp">[목록 보기]</a>
</body>
</html>