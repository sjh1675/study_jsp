<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/MySQLDBCP");
			Connection conn = ds.getConnection();
			out.print("정상 연결");
		} catch(ClassNotFoundException e) {
			out.print("드라이버 클래스 못찾음");
		} catch(NamingException e){
			out.print("jdbc/MySQLDBCP 못찾음");
		} catch(SQLException e){
			out.print("DB 연결 정보 오류");
		}
	%>
</body>
</html>