<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>

<jsp:useBean id="pm" class="utils.PageMaker" />
<c:if test="${!empty param.page}">
	<c:set target="${pm.cri}" property="page" value="${param.page}" />
</c:if>
<s:query var="rs" dataSource="jdbc/MySQLDBCP">
	SELECT count(*) AS c FROM test_board
</s:query>
<c:set target="${pm}" property="totalCount" value="${rs.rows[0].c}" />
<s:query var="rs2" dataSource="jdbc/MySQLDBCP" startRow="${pm.cri.startRow}" maxRows="${pm.cri.perPageNum}">
	SELECT * FROM test_board ORDER BY board_num DESC
</s:query>
<c:if test="${rs2.rowCount > 0}">
	<jsp:useBean id="boardList" class="java.util.ArrayList" type="java.util.List<vo.TestBoardVO>"/>
	<c:forEach var="b" items="${rs2.rows }">
		<jsp:useBean id="vo" class="vo.TestBoardVO" />
		<c:set target="${vo}" property="board_num" value="${b.board_num}"/>
		<c:set target="${vo}" property="board_name" value="${b.board_name}"/>
		<c:set target="${vo}" property="board_pass" value="${b.board_pass}"/>
		<c:set target="${vo}" property="board_title" value="${b.board_title }"/>
		<c:set target="${vo}" property="board_content" value="${b.board_content }"/>
		<c:set target="${vo}" property="board_readcount" value="${b.board_readcount}"/>
		<c:set target="${vo}" property="board_date" value="${b.board_date}"/>
		<c:set var="temp" value="${boardList.add(vo)}" />
		<c:remove var="vo"/>
	</c:forEach>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 목록</h1>
	<a href="${pageContext.request.contextPath}/board/board_write.jsp">게시글 작성하러 가기</a>
	<table border=1>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<!-- 게시글 목록 -->
		<c:choose>
			<c:when test="${!empty boardList}">
				<c:forEach var="b" items="${boardList}">
					<tr>
						<td>${b.board_num}</td>
						<td><a href="${pageContext.request.contextPath}/board/board_detail.jsp?board_num=${b.board_num}">${b.board_title}</a></td>
						<td>${b.board_name}</td>
						<td>${b.board_date}</td>
						<td>${b.board_readcount}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="4">등록된 게시물이 없습니다.</td>
				</tr>
			</c:otherwise>
			</c:choose>	
			<c:if test="${!empty boardList}">
				<tr>
					<th colspan="4">
						<c:if test="${pm.prev}">
							<a href="${pageContext.request.contextPath}/board/board_list.jsp?page=1">[&lt;&lt;]</a>
							<a href="${pageContext.request.contextPath}/board/board_list.jsp?page=${pm.startPage - 1}">[&lt;]</a>
						</c:if>
						<c:forEach var="i" begin="${pm.startPage }" end="${pm.endPage}">
							<c:choose>
									<c:when test="${pm.cri.page eq i}">
										<span style="color:red;">[${i}]</span>
									</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/board/board_list.jsp?page=${i}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="${pageContext.request.contextPath}/board/board_list.jsp?page=${pm.endPage + 1}">[&gt;]</a>
						</c:if>
						<c:if test="${pm.cri.page != pm.maxPage}">
							<a href="${pageContext.request.contextPath}/board/board_list.jsp?page=${pm.maxPage}">[&gt;&gt;]</a>
						</c:if>
					</th>
				</tr>
			</c:if>			
	</table>
</body>
</html>