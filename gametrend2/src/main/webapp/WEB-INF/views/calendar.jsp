<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.Queue" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>달력 페이지</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/index.css"/>
	<link rel="stylesheet" href="/css/chat.css"/>
	<script src="/js/chat.js"></script>
	<script src="/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
</head>
<body>
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<section style="margin-top:60px;">
	  <div class="space" style="height:150px"></div>
	  <div class="col-lg-12 mainTitle d-flex">
	    <a id="title" class="btn btn-primary btn-lg" href="">연도별 게임 순위</a>
	  </div>	
	  <div class="space" style="height:150px"></div>
	  <!-- 연도별 베스트 출력 페이지 -->
	  <%@ include file="calendarCalculating.jspf" %> 
	</section>
	
	<section style="margin-top:60px;">
	  <div class="col-lg-12 mainTitle d-flex">
	    <a id="title" class="btn btn-primary btn-lg" href="">연도별 출시게임</a>
	  </div>	
	  <div class="space" style="height:100px"></div>
	  
	  <!-- 연도별 출시게임 출력 페이지 --> 
	  <%@ include file="calendarShow.jspf" %> 
	</section>

	<div class="space" style="height:100px"></div> 

	<!-- footer -->
	<%-- <%@ include file="footer.jsp" %> --%>
	<%@ include file="chatbottest.jsp" %>
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
</body>
</html>
