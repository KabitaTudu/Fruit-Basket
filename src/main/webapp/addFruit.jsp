<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Fruit</title>
<link rel="stylesheet" href="css/addFruit.css">
</head>
<body>
	<form action="addProcess.jsp" method="post" onsubmit="">
		<fieldset>
			<legend>Add a Fruit</legend>
			<div>
				<label>Fruit Name</label>
				<input type="text" name="name">
			</div><br>
			<div>
				<label>Quantity</label>
				<input type="text" name="quantity">
			</div><br>
			<div>
				<label>Price</label>
				<input type="text" name="price">
			</div><br>
			<h4>Available Fruits</h4>
			<div class="fruits-section">
				<div class="fruit">
					<img src="mango.jpg">
					<p>Mango</p>
					<p>Rs. 60</p>
				</div><br>
				<div class="fruit">
					<img src="apple.webp">
					<p>Apple</p>
					<p>Rs. 120</p>
				</div><br>
				<div class="fruit">
					<img src="banana.webp">
					<p>Banana</p>
					<p>Rs. 90</p>
				</div><br>
				<div class="fruit">
					<img src="strawberry.webp">
					<p>Strawberry</p>
					<p>Rs. 80</p>
				</div>
			</div>
			<div>
				<button type="submit">Add</button>
			</div>
		</fieldset>
	</form>
	<%@include file="footer.jsp" %>
</body>
</html>