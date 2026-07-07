<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/home.css">
</head>
<body>
	<%@include file="header.jsp" %>
	
	<main>
		<div class="hero-section">
			<img src="images/logos/fruits-img1.jpg" class="basket-fruit-img">
			<img src="images/logos/fruits-img2.jpg" class="basket-fruit-img">
			<img src="images/logos/fruits-img7.jpg" class="basket-fruit-img">
			<img src="images/logos/fruits-img4.jpg" class="basket-fruit-img">
			<img src="images/logos/fruits-img5.jpg" class="basket-fruit-img">
			<div class="sign-in-msg">
				Sign In to add fruits to basket<br>
				<a class="sign-in-btn">Sign In</a><br><br>
				<img src="images/logos/basket-fruits.jpg" class="basket-fruit-img img-last">
			</div>
		</div>
	</main>
	
	<%@include file="footer.jsp" %>
</body>
</html>