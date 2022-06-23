<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.MemberVO" %>
    
<!-- member/joinCheck.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	List<MemberVO> memberList 
		= (List<MemberVO>)application.getAttribute("memberList");
	
	MemberVO joinMember 
		= new MemberVO(request.getParameter("id"));
	
	if(memberList.contains(joinMember)){
		// 중복 아이디
		out.print("<script>");
		out.print("alert('이미 사용중인 아이디입니다.');");
		out.print("history.back();");
		out.print("</script>");
	}else{
		// 아이디가 존재하지 않음 - 회원가입
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String strAge = request.getParameter("age");
		int age = Integer.parseInt(strAge);
		joinMember.setPass(pass);
		joinMember.setName(name);
		joinMember.setAddr(addr);
		joinMember.setGender(gender);
		joinMember.setPhone(phone);
		joinMember.setAge(age);
		memberList.add(joinMember);
		String path = request.getContextPath();
		// /14_20220623_practice
		out.print("<script>");
		out.print("alert('회원가입 성공');");
		out.print("location.href='"+path+"/index.jsp?page=login';");
		out.print("</script>");
	}
	
%>











