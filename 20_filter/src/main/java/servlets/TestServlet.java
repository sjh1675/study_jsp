package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
// @WebServlet("/test") // /test요청이 들어왔을 때 실행됨 >> 지금 배포서술자(web.xml)에 등록해서 주석처리해야 된다 (배포서술자에 등록된 것과 여기서 등록한 것이 중복되어 모호함)
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test doGet 요청");
		String name = request.getParameter("name");
		System.out.println(name);
		
		response.addHeader("Content-Type", "text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		
		out.print("<head>");
		out.print("<meta charset='utf-8'/>");
		out.print("<title>Test Page</title>");
		out.print("</head>");
		
		out.print("<body>");
		out.print("<h1>name : " + name + " </h1>");
		out.print("</body>");
		
		out.print("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test doPost 요청");
		
		String name = request.getParameter("name");
		System.out.println("POST param : " + name);
		response.setContentType("text/xml;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print("<h1>");
		out.print("name : " + name);
		out.print("</h1>");
		
	}

}
