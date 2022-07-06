package test;

import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.GoogleAuthentication;

@WebServlet("/googleMailTest")
public class GoogleMailTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	class MyAuthentication extends Authenticator {
		PasswordAuthentication pa;	// 비밀번호가 있는 사용자 계정 정보

		public MyAuthentication() {
			try {
				Properties prop = new Properties();
				String path = getClass().getResource("../prop/google_mail.properties").getPath();
			
				prop.load(new FileReader(path));
				String id = prop.getProperty("id");
				String pw = prop.getProperty("pw");
				System.out.println(id + " : " + pw);
				pa = new PasswordAuthentication(id, pw);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		public PasswordAuthentication getPasswordAuthentication() {		// 메소드 내부에서 pa를 얻기위해 getter가 호출되어 만들어줘야함
			return pa;
		}
	}
	
	
	// SMTP(Simple Mail Transfer Protocol (간이 우편 전송 규약)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");	// 어떤 호스트를 사용할지 지정
		prop.put("mail.smtp.auth", "true");				// 계정 인증을 사용할 지 여부
		prop.put("mail.smtp.port", "587");				// 사용할 포트(587로 고정되어 있음)
		prop.put("mail.smtp.starttls.enable", "true");	// tls 보안 사용 유무 (tls 란? -> ssl 보다 보안이 강화된 버전)
		
		MyAuthentication ma = new MyAuthentication();
		
		GoogleAuthentication ga = new GoogleAuthentication();
		Session session = Session.getDefaultInstance(ga.getProp(), ga);	// 두번째 매개변수에 사용자 계정 정보가 들어감
		MimeMessage msg = new MimeMessage(session);
		

		try {
			InternetAddress to = new InternetAddress("jh1675s@naver.com");		// 받는 사람
			msg.setRecipient(Message.RecipientType.TO, to);		// TO - 받는사람		CC - 참조			BCC - 숨은 참조
			InternetAddress from = new InternetAddress("master@koreate.net", "MASTER");
			msg.setFrom(from);
			msg.setHeader("Content-Type", "text/html;charset=utf-8;");
			msg.setSubject("테스트 제목입니다.", "UTF-8");
			msg.setText("테스트 내용입니다.", "UTF-8");
			
			javax.mail.Transport.send(msg);
			System.out.println("메일전송 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("메일전송 실패");
		}
		response.sendRedirect(request.getContextPath() + "/test");
	}

}
