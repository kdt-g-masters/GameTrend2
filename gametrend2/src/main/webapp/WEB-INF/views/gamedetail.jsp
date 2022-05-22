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
				data: {'member_id':$("#memberid").val(), 'game_no':${param.no}, 'contents':$("#contents").val(), 'stars':$("#stars").val(), 'date':$("#createAt").val(), 'image':$("#imagefile").val(), 'approve':$("#approve").val() } ,
				type: 'POST' ,
				dataType: 'json',
				success: function (a) {
					alert(JSON.stringify(a));
					location.reload();
				}//success end
			});//ajax end
		}//if end
	});//on end
	
	//리뷰수 변수
	var reviewsu = "";
	
	//게임 상세 페이지 리뷰수
	$.ajax({
		url: '<%=request.getContextPath() %>/countreviewgameno',
		data: {'game_no':${param.no}} ,
		dataType: 'json',
		success: function(countreview){
			$("#reviewcount").html("<h3>리뷰수=" + countreview + "</h3>");
			reviewsu = countreview;
			alert(reviewsu);
		}
	});//ajax end
	
	//게임 상세 페이지 리뷰 보여주기
	$.ajax({
		url: '<%=request.getContextPath() %>/reviewgameno',
		data: {'game_no':${param.no}} ,
		dataType: 'json',
		success: function (list) {
			for(var i = 0; i < list.length; i++){
				$('#review1').append("<div style=\"background-color: #FFFFFF; color: black;  margin-bottom: 30px;\"><p><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-person-circle' viewBox='0 0 16 16'>"
						+	'<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>'
						+	'<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>'
						+	'</svg>' + list[i].member_id + "<br>"
						+	'<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-date-fill" viewBox="0 0 16 16">'
						+	'<path d="M4 .5a.5.5 0 0 0-1 0V1H2a2 2 0 0 0-2 2v1h16V3a2 2 0 0 0-2-2h-1V.5a.5.5 0 0 0-1 0V1H4V.5zm5.402 9.746c.625 0 1.184-.484 1.184-1.18 0-.832-.527-1.23-1.16-1.23-.586 0-1.168.387-1.168 1.21 0 .817.543 1.2 1.144 1.2z"/>'
						+	'<path d="M16 14V5H0v9a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2zm-6.664-1.21c-1.11 0-1.656-.767-1.703-1.407h.683c.043.37.387.82 1.051.82.844 0 1.301-.848 1.305-2.164h-.027c-.153.414-.637.79-1.383.79-.852 0-1.676-.61-1.676-1.77 0-1.137.871-1.809 1.797-1.809 1.172 0 1.953.734 1.953 2.668 0 1.805-.742 2.871-2 2.871zm-2.89-5.435v5.332H5.77V8.079h-.012c-.29.156-.883.52-1.258.777V8.16a12.6 12.6 0 0 1 1.313-.805h.632z"/>'
						+	'</svg>' + list[i].date + "</p><p>" + list[i].contents + "</p></div>");
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
	
	//리뷰 확인 & 수정,삭제
	if(memberid != "null"){		
		$.ajax({
			url: '<%=request.getContextPath() %>/reviewcheck',
			data: {'member_id':memberid, 'game_no':${param.no}},
			dataType: 'json',
			success: function (check) {
				if(check == 1){
					//리뷰 작성 내용
					$.ajax({
						url: '<%=request.getContextPath() %>/reviewmembergame',
						data: {'member_id':memberid, 'game_no':${param.no}},
						dataType: 'json',
						success: function (review) {
							$("#contents").append(review.contents);
						}
					});//review ajax end
					
					//수정, 삭제 버튼 생성
					$("#reviewinsert").attr("hidden", "hidden");
					$("#reviewForm").append("<input id='reviewModify' class='btn btn-primary me-2 mainColor' type='button' value='리뷰 수정'>");
					$("#reviewForm").append("<input id='reviewDelete' class='btn btn-primary me-2 mainColor' type='button' value='리뷰 삭제'>");
					
					//리뷰 수정
					$("#reviewModify").on('click', function (){
						$.ajax({
							url: '<%=request.getContextPath() %>/updatereview',
							data: {'member_id':memberid, 'game_no':${param.no}, 'contents':$("#contents").val(), 'stars':$("#stars").val(), 'date':$("#createAt").val()},
							type: 'POST',
							dataType: 'json',
							success: function (result) {
								alert(JSON.stringify(result));
								location.reload();
							}
						});//modify ajax end
					});//modify on end
					
					//리뷰 삭제
					$("#reviewDelete").on('click', function () {
						$.ajax({
							url: '<%=request.getContextPath() %>/deletereview',
							data: {'member_id':memberid, 'game_no':${param.no}},
							type: 'POST',
							dataType: 'json',
							success: function (result) {
								alert(JSON.stringify(result));
								location.reload();
							}
						});//delete ajax end
					});//delete on end
					
				}//check if end
			}//check success end
		});//check ajax end
	}//memberid if end
	
	//리뷰 별점
	
	
	//리뷰수 게임테이블 반영
	$.ajax({
		url: '<%=request.getContextPath() %>/gamereviewcount',
		data: {'reviews':Number(reviewsu), 'no':${param.no}},
		dataType: 'json',
		success: function (a) {
			alert(a);
		}
	});//ajax end
	
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
			var recommend = "<div class='hidden1'>";
			for (var i = 0; i < list.length; i++){
				//지금 페이지의 게임 추천에서 제외
				if(list[i].no != ${param.no}){					
					recommend += "<div class='card' style='width: 180px; float: left;'><a href='/gamedetail?no=" + list[i].no + "'>"
						+ "<img src='/images/thumbnail/" + list[i].thumbnail + "' class='card-img-top' style='width: 180px; height: 160px;'>"
						+ "<div class='card-body'>"
						+ "<h5 class='card-title'>" + list[i].name + "</h5>"
						+ "<p class='card-text'>" + list[i].platform + "</p>"
						+ "<p class='card-text'>" + list[i].releaseDate + "</p>"
						+ "</div></a></div>"
				}
			}
			recommend +="</div>"
			$("#gamerecommend").html(recommend);
		}//success end
	});//ajax end
	
	
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
			
			<%-- 별점 --%>
			<div class="right" id="ratings">
				<div style="float: left; margin-bottom: 0;">
					<!-- 별점 %에 맞게 계산 -->
					<%
						GameDTO gamedb = (GameDTO)request.getAttribute("gamedetail");
						Double gamerating = (gamedb.getRating() * 10)-4.5;
						Double rating = gamedb.getRating();
					%>
					<div class="star-ratings">
						<div class="star-ratings-fill space-x-2 text-lg" style="width: <%= gamerating %>%">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
						<div class="star-ratings-base space-x-2 text-lg">
							<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
						</div>
					</div>
				</div>
				<div style="float: left; color: gray; margin-left: 10px; margin-bottom: 0; margin-top: 5px; font-size: 20px;">${ gamedetail.rating }/10</div>
				
				<div id="reviewcount" style="float: right; margin-bottom: 0;"></div>
			</div>
			
			<div class="right" id="explain">
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
		
		<div class="hidden zone-line">
			<h3>리뷰</h3>
			<div class="left b-ground" id="review1">
				<p>리뷰내용</p>
			</div>
			
			<div class="right bor-review">
				<h4>리뷰 쓰기</h4>
				<form id="reviewForm">
					<input id="memberid" type="text" value="<%= String.valueOf(session.getAttribute("sessionid")) %>" hidden>
					별점:
					<span class="review-star">
						★★★★★
						<span>★★★★★</span>
						<input id="stars" type="range" oninput="drawStar(this.value)" step="1" min="0" max="10">
					</span>
					<span id="stardemo"></span>
					<input id="imagefile" type="file">
					<%Date now = new Date(); SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
					<input id="createAt" type="text" value="<%=formatter.format(now) %>" hidden>
					<textarea id="contents" rows="10" cols="70" style="width: 80%; border: solid 1px silver;"></textarea>
					<input id="approve" type="text" value="0" hidden>
					<br>
					<input id="reviewinsert" class="btn btn-primary me-2 mainColor" type="button" value="리뷰 입력">
				</form>
			</div>
		</div>
		
		<div class="zone-line">
			<h3>게임 추천</h3>
			<div id="gamerecommend"></div>
		</div>
		
	</main>
	<div class="space" style="height:500;"></div>
	<%@ include file="footer.jsp" %>
	<%@ include file="chatbottest.jsp" %>

<script>
	const drawStar = (val) => {
		document.querySelector(".review-star span").style.width = `${val * 10}%`;
		document.getElementById("stardemo").innerHTML = val; 
	}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>