<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*" %>
<!-- joinCheck.jsp -->
<%request.setCharacterEncoding("utf-8");%>
<!-- List<MemberVO> memberList = new java.util.ArrayList();-->
<jsp:useBean id="memberList" 
	class="java.util.ArrayList" type="List<MemberVO>" scope="application"/>
	
<jsp:useBean id="joinMember" class="vo.MemberVO" />
<jsp:setProperty name="joinMember" property="*"/>
<!-- 
<jsp:setProperty name="joinMember" property="id"/>
<jsp:setProperty name="joinMember" property="pass"/>
<jsp:setProperty name="joinMember" property="addr"/>
 -->
<%
	if(memberList.contains(joinMember)){
		// 아이디 중복
		out.print("<script>");
		out.print("alert('이미 사용중인 아이디입니다.');");
		out.print("history.back();");
		out.print("</script>");
	}else{
		// 회원가입
		memberList.add(joinMember);
		String path = request.getContextPath();
		out.print("<script>");
		out.print("alert('회원가입 성공');");
		out.print("location.href='"+path+"/index.jsp?page=login'");
		out.print("</script>");
	}

%>








