package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;
import service.NoticeServiceImpl;

@WebServlet("*.do")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NoticeService ns = new NoticeServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("NoticeController 요청 : " + command);
		String view = null;
		
		if (command.equals("notice.do")) {
			ns.noticeList(request);
			view = "/board/notice/notice_list.jsp";
		}
		
		if (command.equals("noticeWrite.do")) {
			view = "/board/notice/notice_write.jsp";
		}
		
		if (command.equals("noticeWriteSubmit.do")) {
			boolean writeCheck = ns.noticeWrite(request);
			
			if (writeCheck) {
				view = "/board/notice/notice_success.jsp";
			} else {
				view = "/board/notice/notice_fail.jsp";
			}			
		}
		
		if (command.equals("noticeDetail.do")) {
			ns.noticeDetail(request);
			view = "/board/notice/notice_detail.jsp";
		}
	
		if (command.equals("noticeUpdate.do")) {
			ns.noticeDetail(request);
			view = "/board/notice/notice_update.jsp";
		}
		
		if (command.equals("noticeUpdateSubmit.do")) {
			boolean updateCheck = ns.noticeUpdate(request);
			
			if (updateCheck) {
				view = "/board/notice/notice_success.jsp";
			} else {
				view = "/board/notice/notice_fail.jsp";
			}			
		}
		
		if (command.equals("noticeDelete.do")) {
			view = "/board/notice/notice_delete.jsp";
		}
				
		if (view != null && !(view.trim().equals(""))) {
			request.getRequestDispatcher(view).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
