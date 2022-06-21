<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request_test/requestTest.jsp</title>
</head>
<body>
	<form action="requestResult.jsp" method="GET">
		이름 : <input type="text" name="name"/><br>
		성별 : <input type="radio" name="gender" value="male"/> 남성		
			  <input type="radio" name="gender" value="female"/> 여성
			  <br>
		취미 : <input type="checkbox" name="hobby" value="축구"/> 축구
			  <input type="checkbox" name="hobby" value="자바"/> 자바 
			  <input type="checkbox" name="hobby" value="메이플"/> 메이플
			  <input type="checkbox" name="hobby" value="로아"/> 로아
			  <br>
			  <button>확인</button>
	</form>
</body>
</html>