<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- includeTest2.jsp -->
<hr>
<h1>여기는 includeTest2.jsp</h1>
<%! String str = "박주신 눈떠라"; %>

<%
	response.addHeader("bbb", "Black joojoo");
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
%>

	name : <%= name %>

<%= str %>