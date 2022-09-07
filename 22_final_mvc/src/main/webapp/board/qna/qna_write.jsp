<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- qna_write.jsp -->
<jsp:include page="../../common/header.jsp"/>
<section>
	<form action="boardWriteSubmit.qna" method="POST">
		<input type="hidden" name="qna_writer_num" value="${member.num}"/>
		<table>
			<tr>
				<th colspan=2><h1>글 작 성</h1></th>
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










