<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="connection.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String mNum = request.getParameter("num");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	int num = Integer.parseInt(mNum);
	
	try {
		String sql = "UPDATE member SET name = ?, addr = ? WHERE num = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, addr);
		pstmt.setInt(3, num);
		
		int result = pstmt.executeUpdate();
		
		out.print("<script> alert('" + result + "개의 행 수정완료'); location.href='memberList.jsp'; </script>");
		
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		out.print("<script> alert('수정 실패'); history.back(); </script>");
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>