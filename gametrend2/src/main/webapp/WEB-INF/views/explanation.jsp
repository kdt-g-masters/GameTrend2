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
		ㅇㅇ

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