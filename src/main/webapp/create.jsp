<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.Properties" %>
<%@page import="java.io.FileInputStream" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Table</title>
</head>
<body>
	<%
		// For accessing database url and credentials from db.properties file
		String path = application.getRealPath("/WEB-INF/db.properties");
		Properties props = new Properties();
		FileInputStream fis = new FileInputStream(path);
		props.load(fis);
		
		String username = props.getProperty("db.username");
		String password = props.getProperty("db.password");
		String driverName = "org.postgresql.Driver";
		String url = props.getProperty("db.url");
		
		try {
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url, username, password);
			if (conn != null) {
				System.out.println("Database connected!");
			} else {
				System.out.println("Database not connected!");
			}
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("create table fruits(name varchar(20), quantity int, price numeric(10, 2));");
			out.println("Table fruits created successfully!");
			
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	%>
</body>
</html>