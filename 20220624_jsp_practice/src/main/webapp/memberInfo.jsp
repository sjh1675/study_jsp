<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*" %>
<%@ include file="conn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	String numStr = request.getParameter("num");
	int num = Integer.parseInt(numStr);
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var aTagDelete = document.querySelector("#del");
	aTagDelete.addEventListener("click", function(e){
		if (!confirm("정말 삭제하시겠습니까?")) {
			e.preventDefault();
	    }
	});
</script>
</head>
<body>
	<table>
		<tr>
			<th colspan="2"><%=num %>번 회원의 정보</th>
		</tr>
		<tr>
			<td>아이디</td> <td><%= id %></td>
		</tr>
		<tr>
			<td>이름</td> <td><%= name %></td>
		</tr>
		<tr>
			<td>주소</td> <td><%= addr %></td>
		</tr>
		<tr>
			<td><a href="memberUpdateForm.jsp">수정</a></td> <td><a id="del" href="memberDelete.jsp">삭제</a></td>
		</tr>
	</table>
</body>
</html>

