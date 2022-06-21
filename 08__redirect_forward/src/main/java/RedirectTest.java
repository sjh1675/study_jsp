

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RedirectTest
 */
@WebServlet("/response")
public class RedirectTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("response service");
		super.service(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("response doGet");
		response.sendError(405, "지원하지 않는 전송 방식입니다.");


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("response doPost");
		String id = request.getParameter("id");
		if (id != null && id.equals("id001")) {
			request.setAttribute("answer", id);
			response.sendRedirect("result.jsp");
		} else {
//			response.setStatus(403);	// 403 : 권한 불충분
			
			// 아이디가 다를 때 이동할 때 사용되는 상태코드인 302로 지정을 하고
			// 로케이션 헤더명에 주소를 주어 redirect를 시키는 방법(제자리로 리다이렉트 시켜서 이동을 막는 처리)
			response.setStatus(302);
			response.addHeader("Location", "index.jsp");
		}
	}

}