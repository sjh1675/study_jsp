package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/bigdata";
	private static final String user = "bigdata";
	private static final String pass = "12345";
	
	public static Connection getConnection() {
		
		Connection conn = null;
		try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 오류");
		} catch (SQLException e) {
			System.out.println("연결 정보 오류");
		}
		return conn;
	}
	
	public static void close(AutoCloseable... closer) {
		for (AutoCloseable c : closer) {
			if (c != null) {
				try {
					c.close();
				} catch (Exception e) {}
			}
		}
	}
}
