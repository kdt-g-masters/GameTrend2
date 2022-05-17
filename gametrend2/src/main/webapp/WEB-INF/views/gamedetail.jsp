<%@page import="edu.kdt.gametrend.game.GenreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>${ gamedetail.name }</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/sub.css" rel="stylesheet">
<script src="/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	//세션 아이디 값 가져오기
	var memberid = '<%= String.valueOf(session.getAttribute("sessionid")) %>';
	
	//리뷰 작성
	$("#reviewinsert").on('click', function () {
		if(memberid == "null"){
			alert("로그인이 필요한 항목입니다.");
			location.replace("/login");
		}
		else{
			$.ajax({
				url: '<%=request.getContextPath() %>/insertReview' ,
				data: {'no':$("#reviewNo").val(), 'member_id':$("#reviewuserId").val(), 'game_no':${param.no}, 'contents':$("#contents").val(), 'stars':$("#stars").val(), 'date':$("#createAt").val() } ,
				type: 'POST' ,
				dataType: 'json',
				success: function (a) {
					alert(JSON.stringify(a));
					<%--
					//리뷰 작성 버튼 클릭 시 리뷰수 반영
					$.ajax({
						url: '<%=request.getContextPath() %>/countreviewgameno',
						data: {'game_no':${param.no}} ,
						dataType: 'json',
						success: function(countreview){
						$("#reviewcount").html("<h3>리뷰수=" + countreview + "</h3>");
						}
					});
												
					//리뷰 작성 성공시 리뷰 추가
					$.ajax({
						url: '<%=request.getContextPath() %>/reviewgameno',
						data: {'game_no':${param.no}} ,
						dataType: 'json',
						success: function (list) {
							var j = (list.length - 1);
							$('#review1').append("<div style=\"background-color: black;\"><p>" + list[0].userId + "<br>" +list[0].createAt + "</p><p>" + list[0].contents + "</p></div>");
						}
					});
					--%>
					location.reload();
				}//success end
			});//ajax end
		}//if end
	});//on end
	
	//게임 상세 페이지 이동시 리뷰수 반영
	$.ajax({
		url: '<%=request.getContextPath() %>/countreviewgameno',
		data: {'game_no':${param.no}} ,
		dataType: 'json',
		success: function(countreview){
			$("#reviewcount").html("<h3>리뷰수=" + countreview + "</h3>");
		}
	});//ajax end
	
	//게임 상세 페이지 이동시 리뷰 보여주기
	$.ajax({
		url: '<%=request.getContextPath() %>/reviewgameno',
		data: {'game_no':${param.no}} ,
		dataType: 'json',
		success: function (list) {
			for(var i = 0; i < list.length; i++){
				$('#review1').append("<div style=\"background-color: black;\"><p>" + list[i].userId + "<br>" +list[i].createAt + "</p><p>" + list[i].contents + "</p></div>");
			}
		}
	});//ajax end
	
	//위시리스트 확인
	$.ajax({
		url: '<%=request.getContextPath() %>/gamewishlistview', 
		data: {'member_id':memberid, 'game_no':${param.no}}, 
		dataType: 'json', 
		success: function (wishlistcheck) {
			if(wishlistcheck == 0){
				var wish = '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">'
					wish += '<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>'
					wish += "</svg>"
					wish += "wish"
				$("#rcm").html(wish);
			}
			else if(wishlistcheck == 1){
				var wish = '<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">'
					wish += '<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>'
					wish += "</svg>"
					wish += "wish"
				$("#rcm").html(wish);
			}
		}//success end
	});//ajax end
	
	//게임 위시리스트 기능
	$("#rcm").on('click', function () {
		if(memberid == "null"){
			alert("로그인이 필요한 항목입니다.");
			location.replace("/login");
		}
		else{
			$.ajax({
				url: '<%=request.getContextPath() %>/gamewishlist', 
				data: {'member_id':memberid, 'game_no':${param.no}}, 
				dataType: 'json', 
				error: function () {
					alert("에러");
				}, 
				success: function (wishlistcheck) {
					if(wishlistcheck == 0){
						alert("wishlist에 추가되었습니다.");
						location.reload();
					}
					else if(wishlistcheck == 1){
						alert("wishlist에서 삭제되었습니다.");
						location.reload();
					}
				}//success end
			});//ajax end
		}//if end
	});//on end
	
	//장르 데이터 분류
	<%
	ArrayList arr = (ArrayList)request.getAttribute("gamegenre");
	GenreDTO genre = (GenreDTO)arr.get(0);
	%>
	
	//같은 장르인 게임 추천
	$.ajax({
		url: '<%=request.getContextPath() %>/gamerecommend',
		data: {'genre':'<%= genre.getGenre() %>'},
		dataType: 'json',
		success: function (list) {
			var recommend = "<div class='card-group'>";
			for (var i = 0; i < list.length; i++){
				recommend += "<div class='card'><a href='/gamedetail?no=" + list[i].no + "'>"
					+ "<img src='/images/thumbnail/" + list[i].thumbnail + "' class='card-img-top' style='height: 160px'>"
					+ "<div class='card-body'>"
					+ "<h5 class='card-title'>" + list[i].name + "</h5>"
					+ "<p class='card-text'>" + list[i].platform + "</p>"
					+ "<p class='card-text'>" + list[i].releaseDate + "</p>"
					+ "</div></a></div>"
			}
			recommend +="</div>"
			$("#gamerecommend").html(recommend);
		}//success end
		
	});//ajax end
	
	<%--
	var cnt = 0;
	$('#star').on('click', function () {
		cnt++;
		if(cnt == 1){
			$('#star5').attr('class', 'bi bi-star-half');
			$('#star5-1').attr('d', 'M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z');
		}
		else if(cnt == 2){
			$('#star5').attr('class', 'bi bi-star-fill');
			$('#star5-1').attr('d', 'M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z');
		}
		else if(cnt == 3){
			$('#star4').attr('class', 'bi bi-star-half');
			$('#star4-1').attr('d', 'M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z');
		}
		else if(cnt == 4){
			$('#star4').attr('class', 'bi bi-star-fill');
			$('#star4-1').attr('d', 'M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z');
		}
		else if(cnt == 5){
			$('#star3').attr('class', 'bi bi-star-half');
			$('#star3-1').attr('d', 'M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z');
		}
		else if(cnt == 6){
			$('#star3').attr('class', 'bi bi-star-fill');
			$('#star3-1').attr('d', 'M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z');
		}
		else if(cnt == 7){
			$('#star2').attr('class', 'bi bi-star-half');
			$('#star2-1').attr('d', 'M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z');
		}
		else if(cnt == 8){
			$('#star2').attr('class', 'bi bi-star-fill');
			$('#star2-1').attr('d', 'M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z');
		}
		else if(cnt == 9){
			$('#star1').attr('class', 'bi bi-star-half');
			$('#star1-1').attr('d', 'M5.354 5.119 7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.548.548 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.52.52 0 0 1-.146.05c-.342.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.172-.403.58.58 0 0 1 .085-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027a.5.5 0 0 1 .232.056l3.686 1.894-.694-3.957a.565.565 0 0 1 .162-.505l2.907-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.001 2.223 8 2.226v9.8z');
		}
		else if(cnt == 10){
			$('#star1').attr('class', 'bi bi-star-fill');
			$('#star1-1').attr('d', 'M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z');
		}
		else{
			cnt=0;
			$('#star1').attr('class', 'bi bi-star');
			$('#star1-1').attr('d','M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z');
			$('#star2').attr('class', 'bi bi-star');
			$('#star2-1').attr('d','M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z');
			$('#star3').attr('class', 'bi bi-star');
			$('#star3-1').attr('d','M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z');
			$('#star4').attr('class', 'bi bi-star');
			$('#star4-1').attr('d','M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z');
			$('#star5').attr('class', 'bi bi-star');
			$('#star5-1').attr('d','M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z');
		}
	});//star end	
	--%>
});//jquary end
</script>
</head>

<body>
	<%@ include file="navbar.jsp" %>	
	<main>
		<div class="hidden" id="tema">
			<div class="left b-ground" id="tema1">
				<h1>${ gamedetail.name }</h1>
				<div class="hidden">
					<div class="left">
						<img id="img1" src="/images/thumbnail/${ gamedetail.thumbnail }">
					</div>
					<div class="right">
						<p>${ gamedetail.platform }</p>
						<!-- 게임 출시일 -->
						<p>${ gamedetail.releaseDate }</p>
						<!-- 게임 장르 -->
						<p>
							<c:forEach items="${ gamegenre }" var="dto">
								${ dto.genre }
							</c:forEach>
						</p>
						<!-- 위시리스트 -->
						<p id="rcm" style="cursor: pointer; width: 80px;"></p>
						<!-- 판매링크 -->
						<a class="btn btn-primary me-2 mainColor" href="${ gamedetail.relevant_site1 }">${ gamedetail.relevant_site2 }</a>
					</div>
				</div>
			</div>
			
			<div class="right b-ground" id="ratings" style="margin-bottom: 10px;">
				<div style="float: left;">
					<h2 id="star">별점:<svg id="star5" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
							<path id="star5-1" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/></svg>
							<svg id="star4" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
							<path id="star4-1" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/></svg>
							<svg id="star3" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
							<path id="star3-1" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/></svg>
							<svg id="star2" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
							<path id="star2-1" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/></svg>
							<svg id="star1" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
							<path id="star1-1" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/></svg>
					</h2>
				</div>
				
				<div id="reviewcount" style="float: right;"></div>
			</div>
			
			<div class="right b-ground" id="explain">
				<h2>게임 설명</h2>
				<p>${ gamedetail.explanation }</p>
			</div>
		</div>
		
		<h3>트레일러, 게임이미지 && 스크린샷</h3>
		<div class="hidden1" style="background-color: black;">
			<div style="float: left; margin-bottom: 0px; margin-right: 8px;">
				<iframe width="390" height="315" src="${ gamedetail.trailer }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<img class="img2" src="/images/screenshot/${ gamedetail.screenshot1 }">
			<img class="img2" src="/images/screenshot/${ gamedetail.screenshot2 }">
			<img class="img2" src="/images/screenshot/${ gamedetail.screenshot3 }">
			<img class="img2" src="/images/screenshot/${ gamedetail.screenshot4 }">
		</div>
		
		<h3>리뷰</h3>
		<div class="hidden">
			<div class="left b-ground" id="review1">
				<p>리뷰내용</p>
			</div>
			
			<div class="right b-ground">
				<h4>리뷰 쓰기</h4>
				<form action="">
					<input id="reviewNo" type="text" value="<% Random random = new Random(); %><%= random.nextInt(9999)+1 %>" hidden>
					아이디:<input id="reviewuserId" type="text">
					별점:<input id="stars" type="text">
					<%Date now = new Date(); SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
					<input id="createAt" type="text" value="<%=formatter.format(now) %>" hidden>
					<textarea id="contents" rows="10" cols="70" style="width: 80%;"></textarea>
					<br>
					<input id="reviewinsert" class="btn btn-primary me-2 mainColor" type="button" value="리뷰 입력">
				</form>
			</div>
		</div>
		
		<h3>게임 추천</h3>
		<div id="gamerecommend">
			
		</div>
	</main>
	<div class="space" style="height:500"></div>
	<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>