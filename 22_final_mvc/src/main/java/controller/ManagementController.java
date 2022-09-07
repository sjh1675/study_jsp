package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ManagementServiceImpl;
import service.ManagementService;
import service.MemberService;

/**
 * Servlet implementation class ManagementController
 */
@WebServlet("*.mgc")
public class ManagementController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ManagementService ms = new ManagementServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		MemberService.loginCheck(request);
		boolean isCheck = ManagementService.checkAdmin(request, response);
		if (!isCheck) return;
		
		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("Management 요청 : " + command);
		String view = null;
		
		// 회원 목록 페이지 요청
		if (command.equals("managementPage.mgc")) {
			request.setAttribute("memberList", ms.getMemberList(request));
			view = "/mngt/management.jsp";
		}
		
		if (view != null && !(view.trim().equals(""))) {
			request.getRequestDispatcher(view).forward(request, response);
		}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
