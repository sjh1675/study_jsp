<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<!-- user/loginCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="memberList" 
	class="java.util.ArrayList" type="List<MemberVO>" scope="application"/>
	
<jsp:useBean id="loginMember" class="vo.MemberVO" />
<jsp:setProperty name="loginMember" property="*"/>

<%
	int index = memberList.indexOf(loginMember);
	MemberVO sessionMember = memberList.get(index);
	if(sessionMember != null 
		&&
		loginMember.getPass().equals(sessionMember.getPass())){
		// 로그인
		String rememberme = request.getParameter("rememberme");
		if(rememberme != null){
			Cookie cookie = new Cookie("id",loginMember.getId());
			cookie.setMaxAge(60*60*24*7);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		session.setAttribute("loginMember",sessionMember);
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	}else{
		out.print("<script>alert('로그인 실패');history.go(-1);</script>");
	}

%>








