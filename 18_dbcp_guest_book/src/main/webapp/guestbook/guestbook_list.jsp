<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// localhost:8080/ => root 경로
	
	// root 뒤에 프로젝트 경로
	String path = request.getContextPath(); // /18_dbcp_guest_book
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메세지 목록</title>
</head>
<body>
	<!-- 방명록 작성 전달을 위한 form tag -->
	<form action="<%= path %>/guestbook/guestbook_write.jsp" method="post">
		<table>
			<tr>
				<td colspan="3"><h1>방명록 작성</h1></td>
			</tr>
			<tr>
				<td colspan="2"></td>
				<td rowspan="4">
					<input style="margin-left:20px; width:100%; height:100px;" type="submit" value="메세지 남기기"/>
				</td>				
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" style="width:100%;" name="guestName"/>
				</td>				
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" style="width:100%;" name="password"/>
				</td>
			</tr>
			<tr>
				<td>메세지</td>
				<td>
					<textarea name="message" cols="35" rows="3"></textarea>
				</td>
			</tr>
		</table>
	</form>
	<hr>
<%@ page import="java.sql.*, util.DBCPUtil" %>
<%@ page import="java.util.*, vo.*" %>

<%

	int currentPage = 1; // 페이지 번호
	int pageCount = 5;
	int startRow = 0;
	int endRow = 0;
	
	String paramPage = request.getParameter("page");
	
	if (paramPage != null) {
		currentPage = Integer.parseInt(paramPage);
	}
	out.print("현재 요청 페이지 : " + currentPage);

	startRow = (currentPage - 1) * pageCount;
	
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<GuestBook> bookList = new ArrayList<>();
	
	endRow = pageCount;
	String sql = "SELECT * FROM test_guestbook ORDER BY id DESC limit ?, ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, startRow);
	pstmt.setInt(2, endRow);
	rs = pstmt.executeQuery();
	
	while (rs.next()) {
		GuestBook vo = new GuestBook(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4)
				);
		bookList.add(vo);
	}
	DBCPUtil.close(rs, pstmt);
	
	sql = "SELECT count(id) FROM test_guestbook";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	int listCount = 0;
	int startPage = 0; 	// 현재 페이지 블럭에 보여줄 시작 페이지 번호
	int endPage = 0; 	// 현재 페이지 블럭에 보여줄 마지막 번호(고정되지 않음)
	int maxPage = 0;	// 전체 출력 가능한 페이지 개수(=제일 큰 페이지 번호)
	int displayPageNum = 5;	// 한번에 보여줄 페이지 개수
		
	if (rs.next()){
		listCount = rs.getInt(1);
	}
	maxPage = (listCount - 1) / pageCount + 1;
	out.print("전체 페이지 블럭 수 : " + maxPage);
	// displayPageNum
	startPage = (currentPage - 1) / displayPageNum * displayPageNum + 1;
	endPage = startPage + displayPageNum - 1;
	if (endPage > maxPage){
		endPage = maxPage;
	}
	DBCPUtil.close(rs, pstmt, conn);
%>
<h1>방명록 리스트</h1>
<% if (!bookList.isEmpty()) { %>
	<table border="1" cellspacing="0" cellpadding="10">
	<% for(GuestBook gb : bookList) { %>
		<tr>
			<td>
				메세지 번호 : <%= gb.getId() %> <br>
				손님 이름 : <%= gb.getGuestName() %> <br>
				메세지 : <%= gb.getMessage() %> <br>
				<a href="<%= path %>/guestbook/guestbook_confirm.jsp?id=<%= gb.getId() %>">[삭제]</a> <br>
			</td>			
		</tr>
	<% } %>		
	</table>
<%} else { %>
	<h2>등록된 메세지가 없습니다.</h2>
<% } %>
<hr>
<% if (startPage != 1) { %>
	<a href="<%= path %>/guestbook/guestbook_list.jsp?page=1">[처음]</a>	
<% } %>
<% if (startPage != 1) { %>
	<a href="<%= path %>/guestbook/guestbook_list.jsp?page=<%= startPage - 1 %>">[prev]</a>	
<% } %>
<% for(int i = startPage; i <= endPage; i++) { %>
	<a href="<%= path %>/guestbook/guestbook_list.jsp?page=<%= i %>">[<%= i %>]</a>				
<% } %>
<% if (endPage < maxPage) { %>
	<a href="<%= path %>/guestbook/guestbook_list.jsp?page=<%= endPage + 1 %>">[next]</a>	
<% } %>
<% if (endPage < maxPage) { %>
	<a href="<%= path %>/guestbook/guestbook_list.jsp?page=<%= maxPage %>">[끝으로]</a>	
<% } %>

</body>
</html>