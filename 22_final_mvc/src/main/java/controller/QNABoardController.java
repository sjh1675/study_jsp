package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.BoardVO;
import service.MemberService;
import service.QNABoardService;
import service.QNABoardServiceImpl;

@WebServlet("*.qna")
public class QNABoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	QNABoardService qs = new QNABoardServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberService.loginCheck(request);
		
		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);			// getRequestURI() : 전체 경로
		
		System.out.println("command : " + command);
		
		String nextPage = null;
		
		if (command.equals("boardList.qna")) {
			ArrayList<BoardVO> list = qs.getBoardList(request);
			request.setAttribute("list", list);
			nextPage = "/board/qna/qna_list.jsp";
		}

		if (command.equals("boardWrite.qna")) {
			nextPage = "/board/qna/qna_write.jsp";
		}
		
		if (command.equals("boardWriteSubmit.qna")) {
			qs.boardWrite(request);
			response.sendRedirect(request.getContextPath() + "/boardList.qna");
		}
		
		if (command.equals("boardDetail.qna")) {
			// 조회수 증가
			// 상세보기 게시물 정보 출력
			
			qs.updateReadCount(request);
			response.sendRedirect("boardRead.qna?qna_num=" + request.getParameter("qna_num"));
		}
		
		if (command.equals("boardRead.qna")) {
			// 게시글 상세보기
			BoardVO vo = qs.getBoardVO(request);
			request.setAttribute("boardVO", vo);
			nextPage = "/board/qna/qna_detail.jsp";
		}
		
		if (command.equals("boardReplyForm.qna")) {
			BoardVO boardVO = qs.boardReply(request);
			request.setAttribute("boardVO", boardVO);
			nextPage = "/board/qna/qna_reply.jsp";
		}
		
		if (command.equals("boardReplySubmit.qna")) {
			qs.boardReplySubmit(request);
			response.sendRedirect("boardList.qna");
		}
		
		
		// 게시글 수정 페이지 요청
		if (command.equals("boardUpdateForm.qna")) {
			BoardVO board = qs.getBoardVOByUpdate(request);
			request.setAttribute("boardVO", board);
			nextPage = "/board/qna/qna_update.jsp";
		}
		
		if (command.equals("boardUpdate.qna")) {
			qs.boardUpdate(request, response);
		}
		
		if (command.equals("boardDelete.qna")) {
			qs.boardDelete(request, response);
		}
		
		
		if (nextPage != null && !nextPage.trim().equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
