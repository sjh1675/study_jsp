

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forward")
public class DispatcherTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("forward doGet 요청");
		String id = request.getParameter("id");
		System.out.println(id);
		if (id != null) {
			request.setAttribute("answer", id + "님 반갑습니다.");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("result.jsp");	// !!주의 -> 요청이 들어온 페이지에서의 경로
		rd.forward(request, response);
	}
}