<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up | Fruit Basket Inc.</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	<form method="post" action="SignUpServlet" onsubmit="return validateSignUp()">
		<fieldset>
			<legend>Sign Up</legend>
			<div>
				<label for="js-username">Username:</label>
				<input placeholder="Enter username" id="js-username" class="username-input" name="username">
			</div>
			<div>
				<label for="js-email">Email:</label>
				<input placeholder="Enter email" type="email" id="js-email" class="email-input" name="email">
			</div>
			<div>
				<label for="js-password">Password:</label>
				<input placeholder="Enter password" type="password" id="js-password" class="password-input" name="password">
			</div>
			<input type="submit" value="Submit"></input>
		</fieldset>
	</form>
	
	<%@include file="footer.jsp" %>
	
	<script src="js/validation.js"></script>
</body>
</html>