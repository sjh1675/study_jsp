<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>

<jsp:include page="../../common/header.jsp" />
<jsp:useBean id="r" class="util.PageMaker" />
<c:set target="${pm}" property="displayPageNum" value="5" /> <!-- 페이지에 보여줄 페이징 번호 개수 -->
<c:set target="${pm.cri}" property="perPageNum" value="2" /> <!-- 한 페이지에 보여줄 게시물 수 -->

<c:if test="${!empty param.page}">
	<c:set target="${pm.cri}" property="page" value="${param.page}" />
</c:if>

<s:query var="r" dataSource="jdbc/MySQLDBCP">
	SELECT count(*) AS c FROM qna_board
</s:query>

<c:set target="${pm}" property="totalCount" value="${r.rows[0].c}" />

<s:query var="rs" dataSource="jdbc/MySQLDBCP" startRow="${pm.cri.startRow}" maxRows="${pm.cri.perPageNum}">
	SELECT * FROM qna_board ORDER BY qna_re_ref DESC, qna_re_seq ASC
</s:query>
<section class="wrap">
	<table>
		<tr>
			<th colspan="5">
				<h1>질문과 답변 목록</h1>
			</th>
		</tr>
		<c:if test="${!empty member }">
			<tr>
				<th colspan="5" style="text-align:right">
					<a href="qna_write.jsp"><h1>질문 작성하러 가기</h1></a>
				</th>
			</tr>
		</c:if>
		<c:choose>
			<c:when test="${rs.rowCount > 0 }">			
				<tr>
					<th>글번호</th>
					<th>제목</th>	
					<th>작성자</th>
					<th>작성시간</th>
					<th>조회수</th>			
				</tr>
				<c:forEach var="board" items="${rs.rows }">
					<tr>
						<td>${board.qna_num }</td>
						<td style="text-align:left; padding:5px;">
							<c:choose>
								<c:when test="${board.qna_delete eq 'N'}">
								<c:if test="${board.qna_re_lev != 0 }">
									<c:forEach var="i" begin="1" end="${board.qna_re_lev}">
										&nbsp;&nbsp;&nbsp;
									</c:forEach>
									<c:forEach var="i" begin="1" end="${board.qna_re_lev}">
										☞
									</c:forEach>								
								</c:if>
							<a href="qna_detail.jsp?qna_num=${board.qna_num}">${board.qna_title }</a>
							</c:when>
							<c:otherwise>
									삭제된 게시물입니다.
								</c:otherwise>
						</c:choose>
						</td>								
						<td>${board.qna_name }</td>
						<td>${board.qna_date }</td>
						<td>${board.qna_readcount }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
						<c:if test="${pm.cri.page ne 1}">
							<a href="qna_list.jsp?page=1">[◀◀]</a>
						</c:if>
						<c:if test="${pm.prev}">

							<a href="qna_list.jsp?page=${pm.startPage - 1}">[◀]</a>
						</c:if>
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}" step="1">
							<a href="qna_list.jsp?page=${i}">[${i}]</a>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="qna_list.jsp?page=${pm.endPage + 1}">[▶]</a>							
						</c:if>
						<c:if test="${pm.cri.page != pm.maxPage}">
							<a href="qna_list.jsp?page=${maxPage}">[▶▶]</a>
						</c:if>
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th colspan="5">
						등록된 게시물이 없습니다.
					</th>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</section>

<jsp:include page="../../common/footer.jsp" />