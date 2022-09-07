<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- qna_list.jsp -->
<!-- 게시글 목록 페이지 -->
<jsp:include page="../../common/header.jsp"/>
<section>
	<table>
		<tr>
			<th colspan=5><h2>질문과 답변 목록</h2></th>
		</tr>
		<c:if test="${!empty member}">
		<tr>
			<th colspan=5 style="text-align:right;">
				<a href="boardWrite.qna">질문 작성하러 가기</a>
			</th>
		</tr>
		</c:if>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<!-- 글목록 -->
		<c:forEach var="board" items="${list}">
		<tr>
			<td>${board.qna_num}</td>
			<td style="text-align:left;">
				<c:if test="${board.qna_re_lev != 0}">
					<c:forEach var="i" begin="1" end="${board.qna_re_lev}">
						&nbsp;&nbsp;&nbsp;
					</c:forEach>
					└
				</c:if>
				<c:choose>
					<c:when test="${fn:contains(board.qna_delete, 'N')}">							
						<a href="boardDetail.qna?qna_num=${board.qna_num}">
						${board.qna_title}
						</a>
					</c:when>
					<c:otherwise>
						<span>삭제된 게시물입니다.</span>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${board.qna_name}</td>
			<td>${board.qna_date}</td>
			<td>${board.qna_readcount}</td>		
		</tr>
		</c:forEach>
		<!-- 페이징 블럭 -->
		<c:if test="${!empty pm and pm.maxPage > 1}">		
			<tr>
				<td colspan=5>
					<c:if test="${pm.cri.page != 1}">
						<a href="boardList.qna">[처음]</a>
					</c:if>
					<c:if test="${pm.prev}">
						<a href="boardList.qna?page=${pm.startPage - 1}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<c:choose>
							<c:when test="${pm.cri.page eq i}">
								<span style="color:red;">[${i}]</span>
							</c:when>
							<c:otherwise>
								<a href="boardList.qna?page=${i}">[${i}]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pm.next}">
						<a href="boardList.qna?page=${pm.endPage + 1}">[다음]</a>
					</c:if>
					<c:if test="${pm.cri.page < pm.maxPage}">
						<a href="boardList.qna?page=${pm.maxPage}">[끝]</a>
					</c:if>	
				</td>
			</tr>
		</c:if>
	</table>
</section>
<jsp:include page="../../common/footer.jsp"/>
