<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
<title>할인정보 안내 페이지</title>
</head>

<body>

<br> 
Test1 
<br> 
<br> 

()
	
	<br> 
	<br> 
	<c:forEach items="${Event}" var="event" varStatus="number">
		${event.platform} 출력 <br> 
	</c:forEach> 
	<br> 

</body>

</html>
