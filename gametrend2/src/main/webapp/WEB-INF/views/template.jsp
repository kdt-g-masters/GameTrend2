<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제목 변경하기</title>
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

	<!-- section 안에 본인 코드 옮겨넣기 -->
	<section style="margin-top:60px;">
	여기에서 <br>시작<br><br>
	</section>
	<!-- section 안에 본인 코드 옮겨넣기 -->

	
	<div class="space" style="height:500px"></div> 

	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<%@ include file="chatbottest.jsp" %>
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
</body>
</html>