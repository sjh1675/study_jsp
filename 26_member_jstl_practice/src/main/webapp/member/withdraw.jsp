<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- withdraw.jsp -->
<!-- 회원 탈퇴 처리 - 회원 정보를 삭제하지 않고 u_join column의 값을 N으로 수정 -->

<c:choose>
	<c:when test="${empty member || member.u_id ne param.u_id || member.u_id eq 'admin'}">
		<script>
			alert("잘못된 요청입니다.");
			history.go(-1);
		</script>
	</c:when>
	<c:otherwise>	
		<c:catch var="e">
			<s:update dataSource="jdbc/MySQLDBCP">
			UPDATE big_member SET u_join = 'N' WHERE u_id = '${param.u_id}'
			</s:update>
			<script>
				alert("탈퇴 완료");
				location.href="logOut.jsp";
			</script>
		</c:catch>
	</c:otherwise>	
</c:choose>


<c:if test="${!empty e}">
	에러 : <c:out value="${e.message}" />
</c:if>












<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<!-- withdraw.jsp -->
<!-- 회원 탈퇴 처리 - 회원 정보를 삭제하지 않고 u_join column의 값을 N으로 수정 -->

<c:catch var="e">
	<s:setDataSource var="conn" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/bigdata"
	user="bigdata"
	password="12345"/>

	<s:update var="result" dataSource="${conn}">
		UPDATE big_member SET u_join = 'N' WHERE u_num = ${member.u_num} 		
	</s:update>
	<c:choose>	
		<c:when test="${result > 0}">
			<c:remove var="member" scope="session"/>
			<script>
				alert('탈퇴 완료');
				location.href="<c:url value='/index.jsp'/>";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert('탈퇴 실패');
				location.href="<c:url value='/index.jsp'/>";
			</script>
		</c:otherwise>
	</c:choose>
</c:catch>

<c:if test="${!empty e}">
	에러 : <c:out value="${e.message}" />
</c:if> --%>