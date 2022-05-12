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
			$("section nav a").on('click',function(){
				$("section nav a").removeClass('active');
				$(this).addClass('active');
			}); 
		
			$('.paging li').on('click',function(){
				$('.paging li').removeClass('active');
				$(this).addClass('active');
				location.href ='list?page='+$(this).text();
			});
			
			
		});//ready end
	</script>
	<style>
	/* .main-nav li:first-child{
			color:white;
			background-color: #7244FE;
		} */
		.main-thumbnail-box a:link,.main-thumbnail-box a:visited,.main-thumbnail-box a:active{
			color: gray;
		}
		.main-thumbnail-box a:hover{
			color: white;
		}
		#title {
			width:  15vw;
			padding: 20px auto;
			border: black;
			font-size: 1.3em;
			font-weight: bold;
			margin: 0 auto;
		}
		section nav{
			text-align: center;
			margin-top: 4vh;
			margin-bottom: 7vh;
		}
		section nav a{
			width: 10em;
			/* padding: 10px;
			margin: 10px; */
			position: relative;
			color: #4a4a4a;
			margin: 5px 20px 10px;
			padding: 0 20px 0;
			font-size: 1.3em;
			font-weight: lighter;
		}
		section nav a:active, section nav a:visited, section nav a:link{
			color: #4a4a4a;
		}
		section nav a:hover, section nav a:active{
			font-weight: bold;
		}
		
	</style>
</head>
<body>
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>   
	<!-- gamelist --> 
	<div class="space" style="height:150px"></div>  
	<section id="section">
		<div class="col-lg-12 mainTitle d-flex">
			<a id="title" class="btn btn-primary btn-lg" href="">인기게임 순위</a>
		</div>	
				
		<nav>
			<a href="?platform=pc" id="tab1">PC</a>
			<a href="?platform=PlayStation" id="tab2">PS</a>
			<a href="?platform=Xbox" id="tab3">XBox</a>
			<a href="?platform=Switch" id="tab4">Switch</a>
		</nav>
	</section>
	 <div class="main-thumbnail-part">
		<div class="container-fluid center">
			<div class="row">
				<% int i = 0; %>
				<c:forEach items="${gamelist}" var="dto">
				<div class="col-md-4">
					<div class="main-thumbnail-box">
						<a href="/gamedetail?no=${ dto.no }" >
						<div><img src="/images/thumbnail/${dto.thumbnail}" class="main-thumbnail-img">
						</div> 
						<div class="main-thumbnail-description">
							<button class="btn btn-primary rank position-relative"><b>${dto.ranking}</b>
							</button><br>
							<div class="title"><h4>${dto.name}</h4></div><br>
							<c:forEach items="${genrelist}" var="genredto">
								<c:if test="${ genredto.game_no == dto.no }">
									<span class="badge hashtag btn-outline-primary rounded-outline-pill">${genredto.genre}</span>
								</c:if>
							</c:forEach>
						</div>
						</a>
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