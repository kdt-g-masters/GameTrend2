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
			<input type="submit" name="loadbtnA" value="PC와 PC 게임은?" />
			<input type="hidden" name="thisis" value="PC" />   
		</form>
		<br>
		
		<form method="POST" action="/explanation1b" > 
			<input type="submit" name="loadbtnB" value="PS와 PS 게임은?" />
			<input type="hidden" name="thisis" value="PS" />   
		</form>
		<br>
		
		<form method="POST" action="/explanation1c" > 
			<input type="submit" name="loadbtnC" value="Xbox와 Xbox 게임은?" />
			<input type="hidden" name="thisis" value="Xbox" />   
		</form>
		<br>
		
		<form method="POST" action="/explanation1d" > 
			<input type="submit" name="loadbtnD" value="NS와 NS 게임은?" />
			<input type="hidden" name="thisis" value="NS" />   
		</form>
		<br>

		<!-- 페이지 포함 --> 
	
		<c:if test="${survey.no == 1}"> 
			<%@ include file="explanationP1.jspf" %> 
		</c:if> 
		
		<c:if test="${survey.no == 2}"> 
			<%@ include file="explanationP2.jspf" %>  
		</c:if> 
		
		<c:if test="${survey.no == 3}"> 
			<%@ include file="explanationP3.jspf" %>  
		</c:if> 

		<c:if test="${survey.no == 4}"> 
			<%@ include file="explanationP4.jspf" %>  
		</c:if> 	

</body>

</html>