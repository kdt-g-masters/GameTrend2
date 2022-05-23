<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Game Trend</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="/css/index.css" rel="stylesheet" />
	<link href="/css/wishlist.css" rel="stylesheet" />
	<link href="/css/chat.css" rel="stylesheet" />
	<script src="/jquery-3.6.0.min.js"></script>
	<script src="/js/chat.js"></script>	
	<script>
		$(document).ready(function() {

		}); // ready end
	</script>

</head>
<body>
	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<div class="wishlist">	
	  <h2 class="pt-5 pb-5" style="display: inline-block">위시리스트</h2>
	  
	  <ul class="row row-cols-1 row-cols-md-3 g-4 row list-unstyled" id="change">
		<c:forEach items="${ wishlist }" var="wishlistgame">
		  <li class="col">		  	
		    <div class="card h-100">
			  <a class="delWish" href="/deleteWishlist?member_id=${ wishlistgame.wishlistDTO.member_id }&game_no=${ wishlistgame.wishlistDTO.game_no }">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16" color="#7F7C82" id="delWish">
				  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
				  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
				</svg>					
			  </a>
			  <a href="/gamedetail?no=${ wishlistgame.gameDTO.no }"  class="none">	
		        <img src="/images/thumbnail/${ wishlistgame.gameDTO.thumbnail }" class="card-img-top" alt="thumbnail">		    
		        <div class="card-body">
		          <h5 class="card-title"><b>${ wishlistgame.gameDTO.name }</b></h5>
		          <p class="card-text subtext">${ wishlistgame.gameDTO.explanation }</p>
		        </div>
		      </a>
		    </div>		    
		  </li>
		</c:forEach>		  
	  </ul>
	</div>

	<div class="space" style="height:500px"></div>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<%@ include file="chatbottest.jsp" %>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>