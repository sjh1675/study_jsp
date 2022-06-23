<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="loginMember" class="vo.MemberVO" />
<jsp:useBean id="loginInput" class="vo.MemberVO"/>
<jsp:setProperty property="*" name="loginInput"/>

<%
	System.out.println(loginMember.toString());
	List<MemberVO> memberList = (ArrayList<MemberVO>)application.getAttribute("memberList");
	if (memberList != null && loginMember.getId() == null) {
		for (MemberVO member : memberList) {
			System.out.println(member.getId() + " : " + loginMember.getId());
			System.out.println(member.getPass() + " : " + loginMember.getPass());
			if(member.getId().equals(loginInput.getId()) && member.getPass().equals(loginInput.getPass())) {
				System.out.println("로그인 계정 발견");
				session.setAttribute("loginMember", member);
				loginMember = member;
				
				String memo = request.getParameter("loginMemo");
				if (memo != null){
					Cookie cookie = new Cookie("id", loginMember.getId());
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				}
				
				break;
			}
		}
	}
	if (loginMember.getId() != null) { // 로그인 됬음
		%>
			<script>
				alert('로그인 성공');
				location.href='index.jsp';
			</script>
		<%
	} else { // 로그인 실패
		%>
			<script>
				alert('아이디 또는 비밀번호를 잘못 입력하셨습니다.');
				location.href='index.jsp?page=login';
			</script>
		<%
	} 
%>
</body>
</html>