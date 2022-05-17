<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Queue" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedList" %>
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
<title>달력 페이지</title>
</head>

<body>

# 게임 달력 출력
<br>

	<!-- (POST 로 데이터 리스트 받아와져있는 상태) --> 


	<!-- 테스트 페이지 -->
	<%@ include file="calendarTest.jspf" %> 
	
	
	<!-- 연도별 베스트 출력 페이지 -->
	<%@ include file="calendarCalculating.jspf" %> 


</body>

</html>
