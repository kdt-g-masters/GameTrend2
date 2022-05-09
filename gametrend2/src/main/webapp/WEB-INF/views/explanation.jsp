<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>플랫폼소개 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>

<body>

		<!-- 기본 내용 -->
		ㅇㅇ<br><br><br>
		
		<form method="POST" action="/explanation1a" > 
			<input type="hidden" name="thisis" value="PC" /> 
			<input type="submit" name="loadbtnA" value="PC와 PC 게임은?" />  
		</form>
		<br>
		
		<form method="POST" action="/explanation1b" > 
			<input type="hidden" name="thisis" value="PS" />
			<input type="submit" name="loadbtnB" value="PS와 PS 게임은?" />   
		</form>
		<br>
		
		<form method="POST" action="/explanation1c" > 
			<input type="hidden" name="thisis" value="Xbox" />
			<input type="submit" name="loadbtnC" value="Xbox와 Xbox 게임은?" />   
		</form>
		<br>
		
		<form method="POST" action="/explanation1d" > 
			<input type="hidden" name="thisis" value="NS" />  
			<input type="submit" name="loadbtnD" value="NS와 NS 게임은?" /> 
		</form>
		<br>

		<!-- 페이지 포함 --> 
	
		<c:if test="${flatExpla.thisis == PC}"> 
			<%@ include file="explanationP1.jspf" %> 
		</c:if> 
		
		<c:if test="${flatExpla.thisis == PS}"> 
			<%@ include file="explanationP2.jspf" %>  
		</c:if> 
		
		<c:if test="${flatExpla.thisis == Xbox}"> 
			<%@ include file="explanationP3.jspf" %>  
		</c:if> 

		<c:if test="${flatExpla.thisis == NS}"> 
			<%@ include file="explanationP4.jspf" %>  
		</c:if> 	

</body>

</html>