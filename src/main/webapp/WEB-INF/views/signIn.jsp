<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In | Fruit Basket Inc.</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<form method="post" action="${pageContext.request.contextPath}/signin" onsubmit="return validateSignIn()">
		<fieldset>
			<legend>Sign In</legend>
			<div>
				<label>Username:</label>
				<input placeholder="Enter username" id="js-username" class="username" name="username">
			</div>
			<div>
				<label>Password:</label>
				<input placeholder="Enter password" type="password" id="js-password" class="password" name="password">
			</div>
			<button type="submit">Submit</button>
		</fieldset>
	</form>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
	<script src="<c:url value='/js/validation.js' />"></script>
</body>
</html>