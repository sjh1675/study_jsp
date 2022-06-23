<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, vo.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!boolean idCheck = false;%>
	<%
	request.setCharacterEncoding("UTF-8");

	List<MemberVO> memberList;
	memberList = (ArrayList<MemberVO>) application.getAttribute("memberList");

	if (memberList == null) {
		memberList = new ArrayList<>();
		application.setAttribute("memberList", memberList);
	}
	%>

	<jsp:useBean id="joinUser" class="vo.MemberVO" />
	<jsp:setProperty property="*" name="joinUser" />

	<%
	System.out.println("가입 된 정보 : " + joinUser.toString());
	idCheck = false;
	for (MemberVO m : memberList) {
		System.out.println(m.getId());
		if (m.getId().equals(joinUser.getId())) {
			idCheck = true;
			break;
		}
	}
	if (idCheck) {
	%>
	<script>
		alert("아이디 중복입니다. 다시 가입해주세요.");
		location.href = "index.jsp?page=join";
	</script>
	<%
	} else {
	memberList.add(joinUser);
	application.setAttribute("memberList", memberList);
	%>
	<script>
		alert('회원가입이 완료되었습니다.');
		location.href = "index.jsp";
	</script>
	<%
	}
	%>

</body>
</html>