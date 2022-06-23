<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String selectPage = request.getParameter("page");
	String suffix = ".jsp";
	if(selectPage == null){
		selectPage = "default";
	}
	selectPage += suffix;
	System.out.println(selectPage);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/common.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="common/header.jsp" />
	</header>
	<section>
		<jsp:include page="<%=selectPage%>"/>
	</section>
	<footer>
		<jsp:include page="common/footer.jsp" />
	</footer>
</body>
</html>







