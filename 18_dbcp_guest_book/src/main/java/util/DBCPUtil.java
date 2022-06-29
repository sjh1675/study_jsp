package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPUtil {
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			DataSource ds = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/MySQLDBCP");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println("DBCP 이름 정보 오류");
		} catch (SQLException e) {
			System.out.println("연결 정보 오류");
		}
		
		return conn;
	}
	
	
	public static void close(AutoCloseable... closer) {
		for (int i = 0; i < closer.length; i++) {
			try {
				if (closer[i] != null) closer[i].close();
			} catch (Exception e) {}
		}
	}
}