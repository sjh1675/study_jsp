<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- logout.jsp -->

<%
	session.removeAttribute("loginMember");
	Cookie cookie = new Cookie("id", "");
	cookie.setMaxAge(0);
	response.addCookie(cookie);		
%>

<script>
	alert('로그아웃 완료');
	location.href='index.jsp';
</script>

<%-- <%
	Cookie cookie = new Cookie("id","");
	cookie.setMaxAge(0);
	cookie.setPath("/");
	response.addCookie(cookie);
	
	session.removeAttribute("loginMember");	
%>
<script>
	alert('로그아웃 완료');
	location.href='index.jsp';
</script>

 --%>