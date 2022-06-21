<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 선언부 -->
<%!
	String s = "test";
	int count = 0;
	
	String getStr(String str){
		s += str;
		count++;
		return s;
	}
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>time.jsp</title>
</head>
<body>
	<h1>TIME JSP</h1>
	<%= getStr("박주신 천재!!\t") + count %>
	
	<% 
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = sdf.format(new java.util.Date());
	%>
	
	현재시간 : <%= date %> <br/>
	기본시간 : <%= new java.util.Date() %>
</body>
</html>