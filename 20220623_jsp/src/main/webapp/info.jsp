<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%! String gender; %>
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	if (loginMember.getGender().equals("male")) {
		gender = "남성";
	} else {
		gender = "여성";
	}
%>
	<table>
		<tr>
			<td>아이디</td>
			<td><%= loginMember.getId() %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%= loginMember.getPass() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%= loginMember.getName() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%= loginMember.getAddr() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%= loginMember.getPhone() %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%= gender %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%= loginMember.getAge() %></td>
		</tr>
	</table>
	<button onclick="location.href='index.jsp'">메인</button>
</body>
</html>