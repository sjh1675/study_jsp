package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.GuestbookService;
import service.GuestbookServiceImpl;

@WebServlet("*.gt")
public class GuestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	GuestbookService gs = new GuestbookServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		
		System.out.println("command : " + command);
		
		String nextPage = null;
		
		if(command.equals("guestbookSubmit.gt")) {
			request.setAttribute("write", gs.gbWrite(request));
			nextPage = "/guestbook/guestbook_write.jsp";
		}
		
		if(command.equals("guestbookList.gt")) {			
			request.setAttribute("gbList", gs.gbList(request));
			nextPage = "/guestbook/guestbook_list.jsp";
		}
		
		if(command.equals("guestbookConfirm.gt")) {
			nextPage = "/guestbook/guestbook_confirm.jsp";
		}
		
		if(command.equals("guestbookDelete.gt")) {
			request.setAttribute("delete", gs.gbDelete(request));
			nextPage = "/guestbook/guestbook_delete.jsp";
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
