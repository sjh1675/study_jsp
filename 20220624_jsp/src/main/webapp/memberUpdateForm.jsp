<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, vo.*, util.*"%>
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
		String sql = "SELECT * FROM test_member WHERE num = " + num;
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			vo = new MemberVO();
			vo.setId(rs.getString("id"));
			vo.setPass(rs.getString("pass"));
			vo.setName(rs.getString("name"));
			vo.setAddr(rs.getString("addr"));
			vo.setPhone(rs.getString("phone"));
			vo.setGender(rs.getString("gender"));
			vo.setAge(rs.getInt("age"));
		}
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		DBCPUtil.close(rs, stmt, conn);
	}
%>

<script type="text/javascript" src="js/inputCheck.js"></script>

<form action="memberUpdate.jsp" method="POST">
	<input type="hidden" name="num" value="<%= num %>" />
	<table>
		<tr>
			<td colspan="2"><h1><%= num %>번 회원정보 수정</h1></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" data-msg="아이디" value="<%= vo.getId() %>" disabled />
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" data-msg="비밀번호" />
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" data-msg="이름" value="<%= vo.getName() %>"/>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="addr" data-msg="주소" value="<%= vo.getAddr() %>"/>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="phone" data-msg="전화번호" value="<%= vo.getPhone() %>" />
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
				<input type="radio" name="gender" value="남성" <%= vo.getGender().equals("남성") ? "checked" : "" %> />
				남성
				</label>
				<label>
				<input type="radio" name="gender" value="여성" <%= vo.getGender().equals("여성") ? "checked" : "" %>/>
				여성
				</label>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="number" name="age" data-msg="나이" value="<%= vo.getAge() %>"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button>수정 완료</button>
			</td>
		</tr>
	</table>
</form>










