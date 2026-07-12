<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fruit Basket | Manage your fruits inventory</title>
<link rel="stylesheet" href="<c:url value='/css/main.css' />" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/mainHeader.jsp" />
	
	<div class="fruits-section">
		<div class="fruit-card">
			<form class="fruit-form" action="${pageContext.request.contextPath}/app/addFruit" method="post">
				<img src="<c:url value='/images/apple.jpg' />" alt="apple image" width="200px" /><br>
				<input value="Apple" name="fruit-name" class="fruit-name" readonly />
				<div>
					Rs.<input type="number" value="50" name="price" class="fruit-price" readonly />
				</div>
				<div>
					<input type="number" value="1" name="quantity" />
					<button type="submit" class="submit-btn">Add</button>
				</div>
			</form>
		</div>
		
		<div class="fruit-card">
			<form class="fruit-form" action="${pageContext.request.contextPath}/app/addFruit" method="post">
				<img src="<c:url value='/images/mango.jpg' />" alt="mango image" width="200px" /><br>
				<input value="Mango" name="fruit-name" class="fruit-name" readonly />
				<div>
					Rs.<input type="number" value="60" name="price" class="fruit-price" readonly />
				</div>
				<div>
					<input type="number" value="1" name="quantity" />
					<button type="submit" class="submit-btn">Add</button>
				</div>
			</form>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>