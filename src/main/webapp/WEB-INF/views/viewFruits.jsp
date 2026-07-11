<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="java.util.Properties" %>
<%@page import="java.io.FileInputStream" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Fruits</title>
<link rel="stylesheet" href="css/viewFruits.css">
</head>
<body>
	<script>
		alert("Fruit added");
</script>
	<div class="display-section">
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
				ResultSet rs = stmt.executeQuery("select * from fruits");
				while (rs.next()) {
		%>	
			<div class="fruit">
					<%
						if (rs.getString(1).equals("Apple")) {
					%>
						<img src="apple.webp">
					<% } else if (rs.getString(1).equals("Banana")) { %>
						<img src="banana.webp">
					<% } else if (rs.getString(1).equals("Mango")) { %>
					<img src="mango.jpg">
					<% } else if (rs.getString(1).equals("Strawberry")) {%>
					<img src="strawberry.webp">
					<%
					}
					%>
					<p class="fruit-name">Fruit Name: <%= rs.getString(1) %></p>
					<p>Quantity: <%=rs.getInt(2) %></p>
					<p>Price: Rs.<%= rs.getDouble(3) %></p>
			</div>
		<%
			}
				stmt.close();
				rs.close();
				conn.close();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		%>
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>