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
<title>달력 페이지</title>
</head>

<body>

# 게임 달력 출력
<br>

<br>
<br> 
<br> 
<br> 
ㅇ 연도별 베스트 게임 <br> 
<br> 
불러올 데이터 : <br> 
1) 플랫폼 <br> 
2) 게임 이름 <br> 
3) 출시일자 <br> 
4) 랭킹(초기값+추가 리뷰수) <br> 
<br> 
<br> 

ㅇ 출시달력 <br> 
<br> 
불러올 데이터 : <br> 
1) 출시일자 
<br>  
<br> 

	<!-- (POST 로 데이터 리스트 받아와져있는 상태) --> 

	<!-- 데이터 리스트 출력 --> 
	<c:forEach items="${Data}" var="data" varStatus="number">
		${data.platform} &nbsp;&nbsp;&nbsp;&nbsp; ${data.name} &nbsp;&nbsp;&nbsp;&nbsp; 
		${data.releaseDate} &nbsp;&nbsp;&nbsp;&nbsp; ${data.views}
		<br>
		<br>  
	</c:forEach> 
	<br> 
	<br> 
	
	<c:forEach items="${DataPCTest}" var="dataPCtest" varStatus="number">
		${dataPCtest.platform} &nbsp;&nbsp;&nbsp;&nbsp; ${dataPCtest.name} &nbsp;&nbsp;&nbsp;&nbsp; 
		${dataPCtest.releaseDate} &nbsp;&nbsp;&nbsp;&nbsp; ${dataPCtest.views}
		<br>
		<br>  
	</c:forEach> 
	<br> 
	<br> 
	
	<c:forEach items="${DataPC2015}" var="dataPC2015" varStatus="number">
		${dataPC2015.platform} &nbsp;&nbsp;&nbsp;&nbsp; ${dataPC2015.name} &nbsp;&nbsp;&nbsp;&nbsp; 
		${dataPC2015.releaseDate} &nbsp;&nbsp;&nbsp;&nbsp; ${dataPC2015.views}
		<br>
		<br>  
	</c:forEach> 
	<br> 
	<br> 

	

</body>

</html>
