<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<f:requestEncoding value="utf-8"/>

<jsp:useBean id="member" class="vo.MemberVO" scope="session" />
<jsp:setProperty property="u_id" name="member" />
<jsp:setProperty property="u_pass" name="member" />
<c:catch var="e">
	<s:query var="rs" dataSource="jdbc/MySQLDBCP">
		SELECT * FROM big_member WHERE u_id = ? AND u_pass = ? AND u_join = 'Y'
		<s:param>${member.u_id }</s:param>
		<s:param>${member.u_pass }</s:param>
	</s:query>
	
	<c:choose>	
		<c:when test="${rs.rowCount > 0}">
			<jsp:setProperty name="member" property="u_num" value="${rs.rows[0].u_num }" />
			<jsp:setProperty name="member" property="u_age" value="${rs.rows[0].u_age }" />
			<jsp:setProperty name="member" property="u_gender" value="${rs.rows[0].u_gender }" />
			<jsp:setProperty name="member" property="u_regdate" value="${rs.rows[0].u_regdate }" />
			
			<!-- session 사용자 정보 추가 완료 -->
			<!-- 이후 쿠키 -->
			
			<c:if test="${!empty param.login }">
				<%
					Cookie cookie = new Cookie("u_id", member.getU_id());
					cookie.setPath("/");
					cookie.setMaxAge(60*60*24*7);
					response.addCookie(cookie);
				%>
			</c:if>
			<script>
				alert('${member.u_id} : 로그인 성공');
				location.href="../index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('로그인 실패');
				history.go(-1);				
			</script>
			<c:remove var="member" scope="session"/>
		</c:otherwise>		
	</c:choose>
</c:catch>
<c:if test="${!empty e }">
	<script>
		alert('로그인 실패 : ${e.message}');
		history.go(-1);
	</script>
</c:if>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<c:catch var="e">
	<s:setDataSource var="conn" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/bigdata"
	user="bigdata"
	password="12345"/>

	<s:query var="rs" dataSource="${conn }">
		SELECT * FROM big_member WHERE u_id = ? AND u_pass = ? AND u_join = 'Y'
		<s:param>${param.u_id }</s:param>
		<s:param>${param.u_pass }</s:param>
	</s:query>
	<c:choose>
	
		<c:when test="${rs.rowCount > 0}">
			<jsp:useBean id="member" class="vo.MemberVO" scope="session"/>
			<c:forEach var="data" items="${rs.rows }">
				${data.u_num }
				<c:set target="${member}" property="u_num" value="${data.u_num }"/>
				<c:set target="${member}" property="u_id" value="${data.u_id }"/>
				<c:set target="${member}" property="u_pass" value="${data.u_pass }"/>
				<c:set target="${member}" property="u_age" value="${data.u_age }"/>
				<c:set target="${member}" property="u_gender" value="${data.u_gender }"/>
				<c:set target="${member}" property="u_join" value="${data.u_join }"/>
				<c:set target="${member}" property="u_regdate" value="${data.u_regdate }"/>
			</c:forEach>
			<script>
				alert('로그인 성공');
				location.href="<c:url value='/index.jsp'/>";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('로그인 실패');
				location.href="<c:url value='/member/login.jsp'/>";
			</script>
		</c:otherwise>
	</c:choose>
</c:catch>

<c:if test="${!empty e}">
	에러 : <c:out value="${e.message}" />
</c:if>

 --%>