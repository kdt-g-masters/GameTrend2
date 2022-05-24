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
	<link rel="stylesheet" href="/css/chat.css"/>
	<script src="/jquery-3.6.0.min.js"></script>
	<script src="/js/chat.js"></script>
<!-- 	<script src="/js/index.js"></script> -->
	<script type="text/javascript">
	 $(document).ready(function() {	
		 /*------------------------ chatbot ------------------------*/
		 var memberid = '<%= String.valueOf(session.getAttribute("sessionid")) %>';
		$(".initialQuestionList span").on('click',function(){
			/*초기 리스트*/
			var kindQ =  $(this).attr("id");
			//위시리스트 선택시
			if(kindQ == "mywishlist")	{basedOnWishlist(memberid);}
			//나의 리뷰 선택시
			else if(kindQ == "myreview")	{basedOnReview(memberid);}	
		});
		/*---------------------------------------------------------*/
		
	 });
	
	</script>
</head>
<body>
	
	<!-- chatbot -->
	<div id="ch-window" style="display:none">
		<div class="menu-bar">
			<div class="chat-close"><span id="close">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 19 19">
		  			<path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/>
		  			<path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/>
				</svg>
			</span></div>
		</div>	
		
		<div class="ch-input">
			<div class="initialQuestionList">
				<span id="mywishlist" class="list">위시리스트</span>
				<span id="myreview" class="list">나의 리뷰</span>
				<span id="myplatform" class="list">게임플랫폼</span>
				<span id="genre" class="list">게임장르</span>
			</div> 
			<div class="input-group mb-3">
			    <input type="text" id="request" class="form-control" placeholder="질문을 입력하세요." aria-label="Recipient's username" aria-describedby="basic-addon2">
			    <button id="event1" class="ch-bnt" value="입력" name="event">
				    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
		  				<path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083l6-15Zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471-.47 1.178Z"/>
					</svg> </button>
			</div>
		</div>
		
		<div id="record-box">
			<div id="sound"></div>
			<div id="record"></div>
		</div>	
	</div>
	<!-- chat button -->
	<div class="floating-container">
	  <div class="floating-button">
		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-dots-fill" viewBox="0 0 16 16">
		  <path d="M16 8c0 3.866-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.584.296-1.925.864-4.181 1.234-.2.032-.352-.176-.273-.362.354-.836.674-1.95.77-2.966C.744 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7zM5 8a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm4 0a1 1 0 1 0-2 0 1 1 0 0 0 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
		  <!-- chatbot modal? toggle? -->
		</svg>
	  </div>
	</div>
	
	<script type="text/javascript">
	
	/* 	var slides = $("ul.topgames"),
				slide = $("ul.topgames li"),
				currentIdx = 0,
				slideCnt = slide.length,
				slideWidth = 310,
				slideMargin = 50,
				prevBtn = $(".prev")
				nextBtn = $(".next");
			
			prevBtn.on('click',function(){ alert(slideCnt);})
			function moveSlide(num){/* 
				slides.css("width",num * ) */
			} */
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
</body>
</html>