<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.Properties" %>
<%@page import="java.io.FileInputStream" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fruit Addition Process</title>
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
		
		String name = request.getParameter("name");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price"));
		
		try {
			Class.forName(driverName);
			Connection conn = DriverManager.getConnection(url, username, password);
			if (conn != null) {
				System.out.println("Database connected!");
			} else {
				System.out.println("Database not connected!");
			}
			PreparedStatement ps = conn.prepareStatement("insert into fruits values(?, ?, ?);");
			ps.setString(1, name);
			ps.setInt(2, quantity);
			ps.setDouble(3, price);
			int i = ps.executeUpdate();
			if (i > 0) {
				out.println(i + " fruit record(s) added successfully!");
			}
			
			ps.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	%>
	<% response.sendRedirect("viewFruits.jsp"); %>
</body>
</html>