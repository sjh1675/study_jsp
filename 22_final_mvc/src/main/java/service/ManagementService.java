package service;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.MemberVO;

public interface ManagementService {
	
	/**
	 * @param request - page 
	 * @param 회원목록 - List
	 */
	
	
	
	// 페이징 처리된 회원 목록
	ArrayList<MemberVO> getMemberList(HttpServletRequest request);
	
	// 관리자 확인
	static boolean checkAdmin(HttpServletRequest request, HttpServletResponse response) {
		boolean isCheck = false;
		HttpSession session = request.getSession();
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		response.setContentType("text/html;charset=utf-8;");
		
		try {
			PrintWriter pw = response.getWriter();
			if (member == null) {
				pw.print("<script>");
				pw.print("alert('로그인 이후에 사용가능합니다.');");
				pw.print("location.href='login.mc';");
				pw.print("</script>");
				return isCheck;
			} else if (!member.getId().equals("admin")) {
				pw.print("<script>");
				pw.print("alert('접근 권한이 없는 사용자입니다.');");
				pw.print("history.go(-1);");
				pw.print("</script>");
				return isCheck;
			}
			isCheck = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return isCheck;
	}
	
}