<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fruit Basket | Manage your fruits inventory</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/mainHeader.jsp" />
	
	<div class="">
		<div>
			<img src="<c:url value='/images/apple.jpg' />" alt="apple image" width="200px" />
			<p>Apple</p>
			<div>
				<input type="number" value="1" />
				<a href="/fruit">Add</a>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>