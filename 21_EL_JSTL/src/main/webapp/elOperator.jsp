<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>\${5+7} : ${5+7}</h3>
	<h3>\${5 == 7} : ${5 == 7}</h3>
	<h3>\${5 < 7} : ${5 < 7}</h3>
	<h3>\${5+7 == 8 ? true : false} : ${5+7 == 8 ? true : false}</h3>
	<%
		String str = new String("hihi");
		request.setAttribute("str", str);
		
		String s1 = new String("hi");
		request.setAttribute("s1", s1);
		
		String s2 = new String("hi");
		request.setAttribute("s2", s2);
		
		System.out.println(s1 == s2);
		System.out.println(s1.equals(s2));
	%>
	<h3>\${str == s1 } : ${str == s1 }</h3>
	<h3>\${s1 == s2 } : ${s1 == s2 }</h3>
	<h3>\${s1 != s2 } : ${s1 != s2 }</h3>
	<h3>\${s1 eq s2 } : ${s1 eq s2 }</h3>
	<h3>\${s1 ne s2 } : ${s1 ne s2 }</h3>
	<h3>\${str != s1 && s2 == s1 } : ${str != s1 && s2 == s1 }</h3>
	<h3>\${str != s1 and s2 == s1 } : ${str != s1 and s2 == s1 }</h3>
	<h3>\${str != s1 || s2 == s1 } : ${str != s1 || s2 == s1 }</h3>
	<h3>\${str ne s1 or s2 eq s1 } : ${str ne s1 or s2 eq s1 }</h3>
	<hr>
	<h3>${str eq "hihi"}</h3>
	
	<%
		java.util.ArrayList<String> list = null;
		request.setAttribute("list", list);
	%>
	
	<h3>\${empty list } : ${empty list }</h3> <!-- null 체크 이후 isEmpty 확인 >> 아직 객체 생성이 안됬거나(null) 객체 안의 내용이 없거나(isEmpty) -->
	
	<%
		list = new java.util.ArrayList<>();
		request.setAttribute("list", list);
	%>
	
	<h3>\${empty list } : ${empty list }</h3>
	
	<%
		list.add("박주신 뭐먹음");
		list.add("무시");
		list.add("3");		
	%>
	
	<h3>\${empty list } : ${empty list }</h3>	
	
	<!-- 비어있지 않으면 true -->
	<h3>\${!empty list } : ${!empty list }</h3>
	<h3>\${not empty list } : ${not empty list }</h3>
	<h3>\${list } : ${list }</h3>
</body>
</html>