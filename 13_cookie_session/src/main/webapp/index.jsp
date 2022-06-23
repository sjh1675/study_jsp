<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	// 클라이언트 브라우저에 저장된 쿠키 항목
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			System.out.println("name : " + c.getName());
			System.out.println("value : " + c.getValue());
			System.out.println("domain : " + c.getDomain()); // 보안문제 때문에 도메인은 전송하지 않고, 클라이언트의 네임과 밸류만 전송함(따라서 null 출력)
		}
	}
/* 
	Cookie cookie = new Cookie("target", "PJS");
	
	// 쿠키 유지 시간(초 단위)
	cookie.setMaxAge(60*60*24*15);
	
	// 현재 도메인의 하위경로에서 사용할 수 있음
	cookie.setPath("/");
	
	// cookie.setDomain("192.168.1.47");
	
	response.addCookie(cookie);
 */
	
	// 쿠키 삭제
	// 덮어씌우는 방식으로 삭제한다
	// value를 없애주고, Path까지 동일하게 해야 해당 쿠키를 인식함
	Cookie cookie = new Cookie("target", "");
	cookie.setMaxAge(0);
	cookie.setPath("/");
	response.addCookie(cookie);
	
	response.sendRedirect("member/index.jsp");
	%>
</body>
</html>