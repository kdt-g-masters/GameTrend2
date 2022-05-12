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

# 플랫폼별 할인 이벤트 출력 
<br> 
	
	<br> 
	<br>
	<br>
	<br> 
	<c:forEach items="${Event}" var="event" varStatus="number">
		${event.platform} &nbsp;&nbsp;&nbsp;&nbsp; ${event.startDate} ~ ${event.endDate} &nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="${event.link}"> 
		<img src="images/jm/${event.mainImage}" width="350" height="300" alt="no search image"></a> &nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="${event.link}">
		<img src="images/jm/${event.image}" width="670" height="300" alt="no search image"></a> 
		<br>
		<br>  
	</c:forEach> 
	<br> 
	<br> 

</body>

</html>
