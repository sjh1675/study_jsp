<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*, java.sql.*, util.*" %>
    
<%@ include file="checkAdmin.jsp" %>

<%
	String num = request.getParameter("num");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	
	try {
		conn = DBCPUtil.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT id, name, addr FROM test_member WHERE num = " + num);
		if (rs.next()) {
			vo = new MemberVO();
			vo.setId(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setAddr(rs.getString(3));
			vo.setNum(Integer.parseInt(num));
		} else {
			out.print("<script>");
			out.print("alert('입력한 정보의 회원이 없습니다.');");
			out.print("history.go(-1);");
			out.print("</script>");
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		DBCPUtil.close(rs, stmt, conn);
	}
	// out.print(vo);	
%>
<table>
	<tr>
		<th colspan="2">
			<%= vo.getNum() %>번 회원의 정보
		</th>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%= vo.getId() %></td>		
	</tr>
	<tr>
		<td>이름</td>
		<td><%= vo.getName() %></td>		
	</tr>
	<tr>
		<td>주소</td>
		<td><%= vo.getAddr() %></td>		
	</tr>
	<tr>
		<th colspan="2">
			<a href="javascript:memberUpdate('<%= vo.getNum() %>');">수정</a>
			|
			<a href="javascript:memberDelete('<%= vo.getNum() %>', '<%= vo.getId() %>');">삭제</a>
		</th>
	</tr>
</table>

<script>
	
	function memberUpdate(num){
		location.href='index.jsp?page=memberUpdateForm&num=' + num;	
	}

	function memberDelete(num, id){
		if (id == 'admin') {
			alert("관리자 계정은 삭제할 수 없습니다.");
		} else {
			if (confirm(num+"번 회원 정보를 정말 삭제하겠습니까?")) {
				location.href='memberDelete.jsp?num=' + num;
			}
		}
	}
	
</script>

<%-- <%@ include file="conn.jsp" %>

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

 --%>