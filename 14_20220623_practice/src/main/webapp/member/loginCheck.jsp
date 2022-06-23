<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*" %>
<!-- member/loginCheck.jsp -->
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String rememberme = request.getParameter("rememberme");
	
	List<MemberVO> memberList
		= (List<MemberVO>)application.getAttribute("memberList");
	for(MemberVO m : memberList){
		if(m.getId().equals(id)
			&&	
			m.getPass().equals(pass)){
			session.setAttribute("loginMember",m);
			if(rememberme != null){
				Cookie cookie = new Cookie("id",id);
				cookie.setPath("/");
				cookie.setMaxAge(60*60*24*7);
				response.addCookie(cookie);
			}
			String path = request.getContextPath();
			out.print("<script>");
			out.print("alert('로그인 성공');");
			out.print("location.href='"+path+"/index.jsp';");
			out.print("</script>");
			break;
		}
	}
	
	out.print("<script>");
	out.print("alert('로그인 실패');");
	out.print("history.go(-1);");
	out.print("</script>");
	
%>









