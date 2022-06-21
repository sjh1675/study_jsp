<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sessionLogout.jsp</title>
</head>
<body>
	<%=session.getId() %><br>
	<%=session.getAttribute("MEMBERUID") %><br>
	로그아웃 완료 되었습니다.
	
	<%
   	// 세션의 속성값 삭제
	session.removeAttribute("MEMBERUID");
   	   	
   	// 세션 객체 삭제
   	/* session.invalidate(); */
   	
   	
   	// 세션 생성 시간
   	long create = session.getCreationTime();
   	// 마지막 요청 시간
   	long last = session.getLastAccessedTime();
   	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
   	out.print("create : " + sdf.format(new Date(create)) + "<br>");
   	out.print("last : " + sdf.format(new Date(last)) + "<br>");
   	
   	long max = session.getMaxInactiveInterval();
   	out.print("세션 유지시간 : " + max + "<br>");
   	
   	// 세션 유지시간 설정(초 단위)
   	session.setMaxInactiveInterval(10);
   	max = session.getMaxInactiveInterval();
   	out.print("변경된 세션 유지시간 : " + max);
	%>
	
</body>
</html>