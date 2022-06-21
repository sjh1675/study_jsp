package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycleServlet
 */
@WebServlet("/lifeCycle")
public class LifeCycleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	// 생성자 > init > (service > get/post) > destroy
	// (괄호 안의 내용이 반복됨)
	
	
    public LifeCycleServlet() {
    	System.out.println("LifeCycleServlet 생성자 호출");
    }
    
	public void init(ServletConfig config) throws ServletException {
		System.out.println("생성자 호출 이후 최초 한번 init 메소드 호출");
		String contextPath = config.getServletContext().getContextPath();
		System.out.println("contextPath : " + contextPath);
	}
	
	// 인스턴스가 생성 되기전에 자원 해제
	public void destroy() {
		System.out.println("destroy 호출");
	}

	// get, post를 구분하여 호출
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Service 호출");
		String method = request.getMethod();
		System.out.println("전송 방식 : " + method);
		if(method.equalsIgnoreCase("GET")) {
			doGet(request, response);
		} else {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 호출");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 호출");
	}

//	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	}
//
//	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
//
//	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
//
//	protected void doOptions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
//
//	protected void doTrace(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
