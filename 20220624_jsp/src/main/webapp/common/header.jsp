<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.*" %>
<!-- header.jsp -->
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("id")){
				String id = c.getValue();
				conn = JDBCUtil.getConnection();
				String sql = "SELECT * FROM test_member WHERE id = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					vo.MemberVO vo = new vo.MemberVO();
					vo.setNum(rs.getInt(1));
					vo.setId(rs.getString(2));
					vo.setPass(rs.getString(3));
					vo.setName(rs.getString(4));
					vo.setAddr(rs.getString(5));
					vo.setPhone(rs.getString(6));
					vo.setGender(rs.getString(7));
					vo.setAge(rs.getInt(8));
					session.setAttribute("loginMember",vo);
				}
			}
		}
	}
	JDBCUtil.close(rs,pstmt,conn);
%>
 
 
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<ul>
 	<li><a href="index.jsp">home</a></li>
 	<% if(loginMember.getName() == null){ %>
	<li><a href="index.jsp?page=login">로그인</a></li>
 	<li><a href="index.jsp?page=join">회원가입</a></li>
 	<%}else{ %>
 	<li>
 		<!-- info -->
 		<a href="index.jsp?page=info">
 		<jsp:getProperty name="loginMember" property="name"/>
 		</a> 님 방가방가
	</li>
	<% if (loginMember.getId().equals("admin")){%>
		<li>
			<a href="index.jsp?page=memberList">회원관리</a>
		</li>			
	<%} %>
	
	<li>
		<a href="logout.jsp">로그아웃</a>
	</li>
 	<%} %>
 </ul>
 
 <%-- <%@ include file="../conn.jsp" %>
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
 %> --%>
 
<%-- <ul>
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
 </ul> --%>
 
 
