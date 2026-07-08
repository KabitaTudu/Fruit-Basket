package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.io.InputStream;

public class DBConnection {
	private static String driverName = "org.postgresql.Driver";
	private static String url;
	private static String username;
	private static String password;
	
	static {
		try {
			Properties props = new Properties();
			
			InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("db.properties");
			
			if (input == null) {
				throw new RuntimeException("db.properties not found");
			}
			
			props.load(input);
			
			url = props.getProperty("db.url");
			username = props.getProperty("db.username");
			password = props.getProperty("db.password");
			
			Class.forName(driverName);
		} catch (Exception e) {
			throw new RuntimeException("Failed to load database configuration", e);
		}
	}
	
	public static Connection getConnection() throws Exception {
		return DriverManager.getConnection(url, username, password);
	}
}