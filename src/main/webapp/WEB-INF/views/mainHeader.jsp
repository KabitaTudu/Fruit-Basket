<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<c:url value='/css/header.css' />">
</head>
<body>
	<nav>
		<div class="left-section">
			<img src="<c:url value='/images/logos/fruit-logo.jpg' />" class="fruit-logo-img" />
			<a class="fruit-logo-title">Fruit Basket</a>
		</div>
		<div class="right-section">
			<a>About</a>
			<a href="${pageContext.request.contextPath}/signout">Sign Out</a>
		</div>
	</nav>
</body>
</html>