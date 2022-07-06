<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!-- joinCheck.jsp -->
<!-- 회원가입 처리 -->
<f:requestEncoding value="utf-8"/>
<c:catch var="e">
	<jsp:useBean id="joinMember" class="vo.MemberVO"/>
	<jsp:setProperty property="*" name="joinMember"/>
</c:catch>
<c:choose>
	<c:when test="${!empty e}">
		<script>
			alert('회원정보가 잘못되었습니다.');
			history.go(-1);
		</script>
	</c:when>	
	<c:otherwise>
		<s:query var="rs" dataSource="jdbc/MySQLDBCP">
			SELECT * FROM big_member WHERE u_id = ?
			<s:param>${joinMember.u_id }</s:param>
		</s:query>
		<c:choose>
			<c:when test="${!empty rs.rows }">
				<script>
					alert('이미 사용중인 아이디입니다.');
					history.go(-1);
				</script>
			</c:when>
			<c:otherwise>
				<s:update var="result" dataSource="jdbc/MySQLDBCP">
					INSERT INTO big_member(u_id, u_pass, u_age, u_gender) VALUES(?, ?, ${joinMember.u_age }, ?) 
					<s:param>${param.u_id}</s:param>
					<s:param>${param.u_pass}</s:param>
					<s:param>${param.u_gender}</s:param>
				</s:update>
				<script>
					alert("${result}행 삽입 완료");
					location.href='login.jsp';
				</script>
			</c:otherwise>			
		</c:choose>	
	</c:otherwise>
</c:choose>
<!-- 위의 INSERT의 age는 정수값이므로 s:param 변환 과정 중 문자열로 바뀔 수 있으니 그냥 미리 넣음 -->




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!-- joinCheck.jsp -->
<!-- 회원가입 처리 -->

<c:catch var="e">
	<s:setDataSource var="conn" driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/bigdata"
	user="bigdata"
	password="12345"/>

	<s:query var="rs" dataSource="${conn }">
		SELECT * FROM big_member WHERE u_id = ?
		<s:param>${param.u_id}</s:param>	
	</s:query>
	
	<c:choose>
		<c:when test="${rs.rowCount == 0}">
			<s:update var="result" dataSource="${conn }">
				INSERT INTO big_member(u_id, u_pass, u_age, u_gender) VALUES(?, ?, ?, ?)
				<s:param>${param.u_id}</s:param>
				<s:param>${param.u_pass}</s:param>
				<s:param>${param.u_age}</s:param>
				<s:param>${param.u_gender}</s:param>
			</s:update>
			<c:if test="${result == 0}">
				<h1>가입 실패</h1>
			</c:if>
			<c:if test="${result > 0}">
				<script>
					alert('회원가입 완료');
					location.href="<c:url value='/index.jsp'/>";
				</script>
			</c:if>		
		</c:when>
		<c:otherwise>
			<script>
				alert('아이디 중복입니다. 다른 아이디를 사용해주세요.');
				history.go(-1);
			</script>		
		</c:otherwise>
	</c:choose>
</c:catch>

<c:if test="${!empty e}">
	에러 : <c:out value="${e.message}" />
</c:if>

 --%>