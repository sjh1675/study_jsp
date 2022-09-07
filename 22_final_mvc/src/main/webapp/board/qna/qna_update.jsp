<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- qna_update.jsp -->
<jsp:include page="../../common/header.jsp"/>
<section>
<form action="boardUpdate.qna" method="post">
	<input type="hidden" name="qna_num" value="${boardVO.qna_num}"/>
	<input type="hidden" name="qna_writer_num" value="${member.num}"/>
	<table>
		<tr>
			<td>작성자</td>
			<td><input type="text" name="qna_name" value="${boardVO.qna_name}" disabled/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="qna_title" value="<c:out value="${boardVO.qna_title}" escapeXml="true"/>"/></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="qna_content" rows=10 cols=40>${boardVO.qna_content}</textarea></td>
		</tr>
		<tr>
			<td colspan=2><input type="submit" value="수정완료"/></td>
		</tr>
	</table>
</form>
</section>
<jsp:include page="../../common/footer.jsp"/>