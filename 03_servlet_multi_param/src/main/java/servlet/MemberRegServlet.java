package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberRegServlet extends HttpServlet {

	private static final long serialVersionUID = -7667778281083375291L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		System.out.println("멤버 레지 서블릿 do post");
		
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		String mobile = req.getParameter("mobile");
		String hobby = req.getParameter("hobby");
		
		System.out.println("name : " + name);
		System.out.println("addr : " + addr);
		System.out.println("mobile : " + mobile);
		System.out.println("hobby : " + hobby);
				
		System.out.println("이후에 응답(사용자에게 정보 출력)");
		
		resp.setContentType("text/html;charset=utf-8");		// 문서 타입과 인코딩 설정
		PrintWriter pw = resp.getWriter();		// response 객체는 2바이트의 출력을 지원
		pw.println("이름 : " + name);     
		pw.println("주소 : " + addr);     
		pw.println("전화 : " + mobile); 
		pw.println("취미 : " + hobby);
		pw.println("<a href='index.html'>메인으로</a>");
		pw.println("<script>");
		pw.println("alert('memReg에서 알림!');");
		pw.println("</script>");
	}   
        
	
	
	
	
}
