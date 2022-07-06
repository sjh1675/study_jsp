<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBCPUtil, java.util.*, vo.BoardVO" %>
<%
	int currentPage = 1;	// 현재 페이지 번호
	int pageCount = 15;	    // 한번에 보여줄 게시물 수
	int startRow = 0;		// 검색 시작 인덱스 번호
	int totalCount = 0;		// 전체 게시물 수
	int startPage = 0;		// 페이지 블럭 시작 페이지 번호
	int endPage = 0;		// 페이지 블럭 마지막 페이지 번호
	int maxPage = 0;		// 마지막 페이지 번호
	int displayPageNum = 5; // 한번에 보여줄 페이지 번호 개수
	
	// 사용자가 요청한 page 번호
	String paramPage = request.getParameter("page");
	if(paramPage != null){
		currentPage = Integer.parseInt(paramPage);
	}
	
	Connection conn = DBCPUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<BoardVO> boardList = new ArrayList<>();
	
	try{
		String sql = "SELECT * FROM tblBoard " 
					+" ORDER BY boardNum DESC limit ?, ?";
		// pageCount==15
		// 1 page = 0 index (1-1) * 15 = 0
		// 2 page = 15 index (2-1) * 15 = 15
		// 3 page = 30 index (3-1) * 15 = 30
		// ...
		startRow = (currentPage - 1) * pageCount;
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, startRow);
		pstmt.setInt(2, pageCount);
		rs = pstmt.executeQuery();
		while(rs.next()){
			BoardVO vo = new BoardVO(
				rs.getInt(1),
				rs.getString(2),
				rs.getString(3),
				rs.getString(4),
				rs.getInt(5),
				rs.getTimestamp(6)
			);
			boardList.add(vo);
		}
		
		DBCPUtil.close(rs,pstmt);
		// 페이지 블럭 처리
		sql = "SELECT count(*) FROM tblBoard";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			totalCount = rs.getInt(1);
		}
		
		maxPage = (totalCount-1) / pageCount + 1;
		System.out.println("최대 페이지 수 : " + maxPage);
		maxPage = (int)(Math.ceil(totalCount/(double)pageCount));
		
		endPage = (int)Math.ceil(currentPage/(double)displayPageNum) * displayPageNum;
		
		startPage = (endPage - displayPageNum)+1;
		
		if(endPage > maxPage){
			endPage = maxPage;
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBCPUtil.close(rs,pstmt,conn);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		text-align:center;
	}
	table {
		border-collapse: collapse;
		border: 1px solid black;
		margin: 50px auto;
	}
	
	table th, table td {
		border: 1px solid #ccc;
		padding: 10px;
	}
</style>

</head>
<body>
<section>
	<a href="board_write.jsp">글작성</a>
	<a href="board_list_cri.jsp">criteria board</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
			<th>비고</th>
		</tr>
		<% if(boardList.isEmpty()) {%>
		<tr>
			<td colspan="6">등록된 게시물이 없습니다.</td>
		</tr>
		<%}else{
			for(BoardVO b : boardList){
		%>
		<tr>
			<td><%=b.getBoardNum()%></td>
			<td>
				<a href="board_read.jsp?boardNum=<%=b.getBoardNum()%>">
				<%=b.getBoardTitle()%>
				</a>
			</td>
			<td><%=b.getBoardAuth()%></td>
			<td><%=b.getBoardDate()%></td>
			<td><%=b.getBoardReadCount()%></td>
			<td></td>
		</tr>	
		<%
			} // for문 종료
		} // if문 종료
		%>
	</table>
	<!-- 페이징 블럭 -->
	<div>
		<% if (startPage != 1) { %>
			<a href="board_list_page.jsp?page=1">[처음]</a>
			<a href="board_list_page.jsp?page=<%= startPage - 1 %>">[이전]</a>
		<% } %>
		<%for (int i=startPage; i<=endPage; i++){%>
			<a href="board_list_page.jsp?page=<%=i%>">[<%=i%>]</a>
		<%}%>
		<% if (endPage != maxPage) { %>
			<a href="board_list_page.jsp?page=<%= endPage + 1 %>">[다음]</a>
		<% } %>
		<% if (currentPage < maxPage) { %>
			<a href="board_list_page.jsp?page=<%= maxPage %>">[마지막]</a>
		<% } %>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/>
</section>
</body>
</html>



