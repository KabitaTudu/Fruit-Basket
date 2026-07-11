<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fruit Basket | Manage your fruit basket</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/home.css' />">
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<main>
		<div class="hero-section">
			<img src="<c:url value='/images/logos/fruits-img1.jpg' />" class="basket-fruit-img" />
			<img src="<c:url value='/images/logos/fruits-img2.jpg' />" class="basket-fruit-img" />
			<img src="<c:url value='/images/logos/fruits-img3.jpg' />" class="basket-fruit-img" />
			<img src="<c:url value='/images/logos/fruits-img4.jpg' />" class="basket-fruit-img" />
			<img src="<c:url value='/images/logos/fruits-img5.jpg' />" class="basket-fruit-img" />
			<div class="sign-in-msg">
				Sign In to add fruits to basket<br>
				<a class="sign-in-btn" href="<c:url value='/signin' />">Sign In</a><br><br>
				<img src="<c:url value='/images/logos/basket-fruits.jpg' />" class="basket-fruit-img img-last" />
			</div>
		</div>
	</main>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>