<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar" %>
<%@ page import="java.text.*, java.util.* "%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_import/import.jsp</title>
</head>
<body>
<%
	// Calendar SimpleDateformat 객체를 이용한 시간 출력
	Calendar cal = Calendar.getInstance();
	int hour = cal.get(Calendar.HOUR_OF_DAY);
	int minute = cal.get(Calendar.MINUTE);
	int second = cal.get(Calendar.SECOND);
%>

현재시간(Calendar) : <%=hour %>시 <%=minute %>분 <%=second %>초 <br>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("HH시 mm분 ss초");
	String date = sdf.format(new Date());
%>

현재시간(Formatter) : <%=date %>
</body>
</html>