<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- qna_detail.jsp -->
<!-- boardVO = 게시글 정보 -->
<jsp:include page="../../common/header.jsp"/>
<section>
<table>
	<tr>
		<th colspan=2>
			<h1>${boardVO.qna_num}번글 상세내용</h1>
		</th>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${boardVO.qna_name}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${boardVO.qna_title}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><pre>${boardVO.qna_content}</pre></td>
	</tr>
	<tr>
		<td colspan=2>
			<c:if test="${!empty member}">
				<a href="boardReplyForm.qna?qna_num=${boardVO.qna_num}">[답글]</a>
				<c:if test="${boardVO.qna_writer_num eq member.num}">
					<a href="boardUpdateForm.qna?qna_num=${boardVO.qna_num}">[수정]</a>
					<a href="boardDelete.qna?qna_num=${boardVO.qna_num}">[삭제]</a>  
				</c:if>
			</c:if>
			<a href="boardList.qna">[목록]</a>
		</td>
	</tr>
</table>
</section>
<jsp:include page="../../common/footer.jsp"/>









