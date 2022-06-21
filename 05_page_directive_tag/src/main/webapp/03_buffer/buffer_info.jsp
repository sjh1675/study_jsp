<%@ page buffer="1kb" autoFlush="true" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_buffer/buffer_info.jsp</title>
</head>
<body>
	Buffer size = <%=out.getBufferSize() %><br> <!-- 버퍼 전체 크기 -->
	Remaining size = <%= out.getRemaining() %><br> <!-- 잔존 버퍼 크기 -->
	
	<%
	/* autoFlush가 false면 오류발생 */
		for(int i = 0; i < 1000; i++){
			out.println("  1234  ");
		}
	%>
</body>
</html>