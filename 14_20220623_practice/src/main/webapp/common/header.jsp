<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, vo.*" %>
 <!-- common/header.jsp -->
 <%
 	request.setCharacterEncoding("UTF-8");
 
 	List<vo.MemberVO> memberList
 		= (ArrayList<MemberVO>)(application.getAttribute("memberList"));
 	if(memberList == null){
 		memberList = new ArrayList<>();
 		application.setAttribute("memberList",memberList);
 	}
 	System.out.println("Member List");
 	System.out.println(memberList);
 	MemberVO loginMember 
 		= (MemberVO)session.getAttribute("loginMember");
 	Cookie[] cookies = request.getCookies();
 	if(cookies != null && loginMember == null){
 		for(Cookie c : cookies){
 			if(c.getName().equals("id")){
 				String id = c.getValue();
 				for(MemberVO m : memberList){
 					if(m.getId().equals(id)){
 						loginMember = m;
 						session.setAttribute("loginMember",m);
 						break;
 					}
 				}
 			}
 		}
 	}
 %>
 <ul>
 	<li><a href="index.jsp">HOME</a></li>
 	<%if(loginMember != null){ %>
 		<!-- 로그인 상태 -->
 		<li><a href="index.jsp?page=info"><%=loginMember.getName()%></a>님 반갑습니다.</li>
 		<li><a href="logOut.jsp">로그아웃</a></li>
 	<%}else{ %><!-- 비 로그인 상태 -->
 	<li><a href="index.jsp?page=login">로그인</a></li>
 	<li><a href="index.jsp?page=join">회원가입</a></li>
 	<%} %>
 </ul>
 
 
 
 
 
 
 