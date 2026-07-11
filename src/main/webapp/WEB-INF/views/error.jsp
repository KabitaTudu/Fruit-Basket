<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>401 Unauthorized</title>
</head>
<body>
	<p>Invalid Credentials!</p>
	<a href="<c:url value='/signin' />">Go back to Sign In</a>
</body>
</html>