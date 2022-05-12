<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>GameTrend-Rank</title>
	<!-- Bootstrap CSS -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/index.css"/>
	<script src="/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			let moveForm = $("#moveForm");
			
			$("section nav a").on('click',function(e){
				e.preventDefault();
				$("section nav a").removeClass('active');
				$(this).addClass('active');
				
				//form태그 내부 name속성이 platform인 inpupt태그에 클릭한 platform종류의 id값 저장
				moveForm.find("input[name='platform']").val($(this).attr("id"));
				//pageNum 1로 변경
				moveForm.find("input[name='pageNum']").val(1);
				moveForm.attr("action", "gamelist");
				moveForm.submit();
			}); 
			
			$('#paging a').on('click',function(e){
				$('#paging a').removeClass('active');
				$(this).addClass('active');
				
				e.preventDefault();
				var location = document.querySelector(".main-thumbnail-part").offsetTop;
				window.scrollTo({top:location, behavior:'smooth'});
				
				//form태그 내부 pageNum과 관련된 input태그 value속성 값에 클릭한 a태그의 페이지 번호 삽입
				moveForm.find("input[name='pageNum']").val($(this).attr("href"));
				//form태그 action속성 추가
				moveForm.attr("action", "gamelist");
				//form태그 내부 데이터 서버 전송
				moveForm.submit();
				
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
		#paging{
			margin-top: 5vh;
		
		}
		#paging a{
			width: 100%;
			height: 100%;
			display:inline-block;
			text-decoration: none;
			color: #7244FE;
			position:relative;
		}
		#paging li.active a, #paging li:hover a{
			color: white;
			font-weight: bold;
		}
		/* index.css에 적용할 것 */
		.active{
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
			<a href="#" id="pc">PC</a>
			<a href="#" id="PlayStation">PS</a>
			<a href="#" id="Xbox">XBox</a>
			<a href="#" id="Switch">Switch</a>
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
			<!-- pagination -->
			<div id="paging" role="toolbar" aria-label="Toolbar with button groups">
				<ul class="btn-group col-sm-2" role="group" aria-label="First group">
					<!-- 이전 페이지 버튼 -->
					<c:if test="${ pageMaker.prev }">
						<li class="btn btn-outline-primary"><a href="${ pageMaker.startPage-1 }">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
								</svg>
						</a></li>
					</c:if>
					<!-- 각 번호 페이지 버튼 -->
					<c:forEach begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" var="idx">
						<li class="btn btn-outline-primary ${ pageMaker.cri.pageNum == idx ? 'active': ''}">
							<a href="${idx}">${idx}</a>
						</li>
					</c:forEach>
					<!-- 다음 페이지 버튼 -->
					<c:if test = "${ pageMaker.next }">
						<li class="btn btn-outline-primary"><a href="${ pageMaker.endPage + 1 }">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
							</svg>
						</a></li>
					</c:if>
				</ul>
			</div>
			</div>
		</div>
	</div>
	
	<!-- platform & pageNum & amount정보를 전송 -->
	<form id="moveForm">
		<input type="hidden" name="platform" value="${ pageMaker.cri.platform}">
		<input type="hidden" name="pageNum" value="${ pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${ pageMaker.cri.amount }">
		
	</form>
	
	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>