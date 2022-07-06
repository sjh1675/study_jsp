package utils;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	
	PasswordAuthentication passwordAuthentication;

	public GoogleAuthentication() {
		Properties prop = new Properties();
		try {
			prop.load(new FileReader(getClass().getResource("../prop/google_mail.properties").getPath()));
			String id = prop.getProperty("id");
			String pw = prop.getProperty("pw");
			passwordAuthentication = new PasswordAuthentication(id, pw);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}

	public Properties getProp() {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");	// 어느 서버를 이용할 것인가
		prop.put("mail.smtp.port", "587");				// 서버의 포트 (고정값 : tls - 587, ssl - 465)
		prop.put("mail.smtp.starttls.enable", true);	// 강화된 보안(tls) 사용
		prop.put("mail.smtp.auth", true);				// 인증된 계정정보로 사용
		return prop;
	}
}
