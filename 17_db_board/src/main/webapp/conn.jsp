<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%
	Connection conn = null;
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		out.println("드라이버 클래스 로드 완료");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bigdata", "bigdata", "12345");
		out.println("커넥션 생성 완료");
	} catch(ClassNotFoundException e) {
		out.println("드라이버 클래스 로드 실패");
	} catch(SQLException e2) {
		out.println("연결 정보 오류");
	}
%>
