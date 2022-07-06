<%@page import="java.sql.SQLException"%>
<%@page import="com.mysql.cj.jdbc.exceptions.SQLError"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*"%>
 <!-- header.jsp -->
 <%@ include file="../conn.jsp" %>
 <% 
 	Cookie[] cookies = request.getCookies();
 
 	cookieLabel: for (Cookie c : cookies) {
 		if (c.getName().equals("id")){ 			
 			String sql = "SELECT * FROM test_member";
 			Statement stmt = null;
 			ResultSet rs = null;
 			try{
 				stmt = conn.createStatement();
 				rs = stmt.executeQuery(sql);
 				
 				while (rs.next()) {
 					String id = rs.getString("id");
 					if (id.equals(c.getValue())){
 						MemberVO loginMember = new MemberVO(id);
 						loginMember.setNum(rs.getInt("num"));
 						loginMember.setPass(rs.getString("pass"));
 						loginMember.setName(rs.getString("name"));
 						loginMember.setAddr(rs.getString("addr"));
 						loginMember.setPhone(rs.getString("phone"));
 						loginMember.setGender(rs.getString("gender"));
 						loginMember.setAge(rs.getInt("age"));
 						
 						session.setAttribute("loginMember", loginMember);
 						break cookieLabel;
 					}
 				}
 				
 			} catch (SQLException e){
 				
 			} finally {
 				if (rs != null) rs.close();
 				if (stmt != null) stmt.close();
 				if (conn != null) conn.close();
 			}
 			
 		}
 	}
 	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
 %>
 
<ul>
 	<li><a href="index.jsp">home</a></li>
 	<% if (loginMember == null) { %>
	<li><a href="index.jsp?page=login">로그인</a></li>
 	<li><a href="index.jsp?page=join">회원가입</a></li>
 	<% } else if (loginMember.getId().equals("admin")) { %>
 	<li><%= loginMember.getName() %>님 방가방가</li>
 	<li><a href="index.jsp?page=memberList">회원관리</a></li>
 	<li><a href="logOut.jsp">로그아웃</a></li>
 	<% } else { %>
 	<li><a href="index.jsp?page=info"><%= loginMember.getName() %>님 반갑습니다.</a></li>
 	<li><a href="logOut.jsp">로그아웃</a></li>
 	<% } %>
 </ul>
 
 
