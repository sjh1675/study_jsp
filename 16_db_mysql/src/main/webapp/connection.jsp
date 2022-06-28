<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- connection.jsp -->

<%@ page import="java.sql.*"%>

<%
	Connection conn = null;
	
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/bigdata";
	String username = "bigdata";
	String password = "12345";
		
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, username, password);
		out.println("커넥션 연결 완료");
	} catch (ClassNotFoundException e) {
		out.println("Driver class를 찾을 수 없습니다.");
	} catch (SQLException e) {
		out.println("연결 요청 정보 오류 : " + e.getMessage());
	}
%>