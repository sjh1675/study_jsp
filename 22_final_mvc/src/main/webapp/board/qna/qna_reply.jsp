<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- qna_reply.jsp-답변글 작성 페이지 -->
<jsp:include page="../../common/header.jsp"/>
<section>
<form action="boardReplySubmit.qna" method="POST">
		<input type="hidden" name="qna_writer_num" value="${member.num}"/>
		<input type="hidden" name="qna_re_ref" value="${boardVO.qna_re_ref}"/>
		<input type="hidden" name="qna_re_lev" value="${boardVO.qna_re_lev}"/>
		<input type="hidden" name="qna_re_seq" value="${boardVO.qna_re_seq}"/>
		<table>
			<tr>
				<th colspan=2><h1>답변 글 작성</h1></th>
			</tr>		
			<tr>
				<td>작성자</td>
				<td>${member.name}</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><input type="text" name="qna_title" required/></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="qna_content" required cols=50 rows=10></textarea></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="작성완료"/> |
					<input type="reset" value="새로작성"/> 
				</td>
			</tr>
		</table>
	</form>
</section>
<jsp:include page="../../common/footer.jsp"/>