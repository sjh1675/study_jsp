package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	MemberService ms = new MemberServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		// Cookie 정보 확인 - 자동 로그인
		MemberService.loginCheck(request);
		
				
		System.out.println("MemberController 요청");
		String requestPath = request.getRequestURI();
		System.out.println("요청 전체 경로: " + requestPath);
		String contextPath = request.getContextPath();
		System.out.println("프로젝트 경로 : " + contextPath);
		
		String command = requestPath.substring(contextPath.length() + 1);
		System.out.println("command : " + command);
		
		String view = "";
		
		if (command.equals("join.mc")) view = "/member/join.jsp";
		if (command.equals("joinSubmit.mc")) ms.memberJoin(request, response);	// 회원가입 요청 처리
		
		if (command.equals("login.mc")) view = "/member/login.jsp";
		if (command.equals("loginSubmit.mc")) {
			boolean isLogin = ms.memberLogin(request, response);
			if (isLogin) {
				response.sendRedirect(contextPath + "/test");
			} else {
				response.sendRedirect(contextPath + "/login.mc");
			}
		}
		
		if (command.equals("update.mc")) view = "/member/update.jsp";	// 회원정보 수정 창
		if (command.equals("updateSubmit.mc")) ms.memberUpdate(request, response);	// 회원정보 수정 요청 처리
		
		if (command.equals("info.mc")) view = "/member/info.jsp";
		
		if (command.equals("logOut.mc")) {
			ms.logOut(request, response);	// 로그아웃
			request.setAttribute("test", "로그아웃 완료");
			view = "/common/main.jsp";
		}
		
		if (command.equals("withdraw.mc")) view = "/member/withdraw.jsp";	// 탈퇴 화면(비밀번호를 다시 받아서 사용자 확인)		
		if (command.equals("withdrawSubmit.mc")) ms.withDraw(request, response);	// 탈퇴 요청 처리
		
		/*
		 * 비밀번호 찾기
		 */
		if (command.equals("findPass.mc")) view = "/member/findPass.jsp";	// 아이디 이름을 입력받을 화면
		if (command.equals("findPassSubmit.mc")) ms.findPassSubmit(request, response);		// 비밀번호 찾기 메일 발송 (아이디에 저장된 메일로)
		
		if (command.equals("passAccept.mc")) ms.changePassCode(request, response);		// 아이디와 코드를 받아 확인
		if (command.equals("changePassSubmit.mc")) ms.changePass(request, response);	// 새로운 비밀번호로 변경
		
		
		
		
		if (view != null && !view.equals("")) {
			request.getRequestDispatcher(view).forward(request, response);	// 새로운 요청이 아니라 요청이 끝나기 전에 해당 페이지(view) 출력해준다
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}