<%@page import="edu.kdt.gametrend.game.GameDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Game Trend</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/index.css"/>
	<script src="/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("ul.dropdown-menu > li > a").on('click',function(i){
				$('#dropdownMenuLink').html($(this).text());
				$("ul.dropdown-menu > li > a").removeClass('active');
				$('.paging li').removeClass('active');
				$(this).addClass('active');
				$('.paging li:eq(0)').addClass('active');			
				
			}); 
			
			$('.main-thumbnail-box, .rank').on('click',function(){
				location.href = '<%=request.getContextPath() %>/subtest';
			});
			
			$('.paging li').on('click',function(){
				$('.paging li').removeClass('active');
				$(this).addClass('active');
				location.href ='list?page='+$(this).text();
			});
			
			
		});//ready end
	</script>
</head>
<body>
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>   
	<!-- gamelist --> 
	 <div class="main-thumbnail-part">
	  	<div class="container-fluid">
			<div class="btn-group dropdown d-flex col-md-2">
				<a class="btn btn-primary dropdown-toggle" href="" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown">
					PC</a>
	  			<ul class="dropdown-menu center" id="platform" aria-labelledby="dropdownMenuLink">
	    			<li value="pc" class="active" ><a class="dropdown-item" id="pc" href="<%=request.getContextPath() %>/list?page=1">PC</a></li>
	    			<li value="PlayStation"><a class="dropdown-item" id="PlayStation" href="#">Play Station</a></li>
	    			<li value="Xbox"><a class="dropdown-item" id="Xbox" href="#">Xbox</a></li>
	    			<li value="Switch"><a class="dropdown-item" id="Switch" href="#">Switch</a></li>
				</ul>
			</div>
			<br><br>
			
		</div>
	
		<div class="container-fluid center">
			<div class="row">
				<% int i = 0; %>
				<c:forEach items="${gamelist}" var="dto">
				<div class="col-md-4">
					<div class="main-thumbnail-box">
						<div><img src="/images/thumbnail/${dto.thumbnail}" class="main-thumbnail-img">
						</div> 
						<div class="main-thumbnail-description">
							<button class="btn btn-primary rank position-relative"><b>${dto.ranking}</b>
							</button><br>
							<div class="title"><h4>${dto.name}</h4></div><br>
							<span class="badge hashtag btn-outline-primary rounded-outline-pill">장르</span>
						</div>
					</div>
				</div>
				<% ++i;
				if(i%3 == 0) { %>
			</div>
			<div class="row">
				 <%} %>
			</c:forEach>
			<!-- 페이지리스트 -->
				<div class="paging" role="toolbar" aria-label="Toolbar with button groups">
					<ul class="btn-group col-xs-2" role="group" aria-label="First group">
						<li class="btn btn-outline-primary">1</li>
						<li class="btn btn-outline-primary">2</li>
						<li class="btn btn-outline-primary">3</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<div class="space" style="height:500px"></div> 
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>