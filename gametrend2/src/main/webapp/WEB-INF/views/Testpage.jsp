<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 페이지</title>
</head>
<body>

설명 페이지로 이동할 거임 <br><br> 

<input type="button" name="movetoexpla" value="설명 페이지로 이동(onclick)" onClick="location.href= 'http://localhost:8081/explanation' " /> 
<br>
<br>

<form method="POST" action="/explanation1a" > 
	<input type="hidden" name="thisis" value="PC" /> 
	<input type="submit" name="loadbtnA" value="설명 페이지로 이동(POST)" />  
</form>
<br> 
<br>

		현재 플랫폼 변수 테스트 1: ${flatExpla} <br> 
		현재 플랫폼 변수 테스트 2 : <c:out value='${flatExpla}'/> <br>
		<br>  

<form method="POST" action="/promotion" > 
	<input type="submit" name="movebtnA" value="할인 페이지로 이동(POST)" />  
</form>
<br> 
<br> 

<form method="POST" action="/calendar" > 
	<input type="submit" name="movebtnB" value="달력 페이지로 이동(POST)" />  
</form>
<br> 
<br> 

</body>
</html>