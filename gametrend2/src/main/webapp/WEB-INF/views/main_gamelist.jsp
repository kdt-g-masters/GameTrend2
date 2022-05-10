<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
	$(document).ready(function(){

		var dragFlag = false;
		var x, y, pre_x, pre_y;

		$(function () {
			$('.xscroll').mousedown(
				function (e) {
					dragFlag = true;
					var obj = $(this);
					x = obj.scrollLeft();
					y = obj.scrollTop();
					pre_x = e.screenX;
					pre_y = e.screenY;					
					$(this).css("cursor", "pointer");
				}
			);

			$('.xscroll').mousemove(
				function (e) {
					if (dragFlag) {
						var obj = $(this);
						obj.scrollLeft(x - e.screenX + pre_x);
						obj.scrollTop(y - e.screenY + pre_y);
						return false;
					}
				});
			$('.xscroll').mouseup(
				function () {
					dragFlag = false;
					$(this).css("cursor", "default");
				});
			$('body').mouseup(
				function () {
					dragFlag = false;					
					$(this).css("cursor", "default");
				});
		});
	
	});
</script>
<style>
.platform{
	margin-top: 15vh;
	margin-bottom: 5vh;
}
#box2 {
	width: 100%;
	padding: 50px;
}
#box2 a {
	color: #716F6F;
}

#box2 a:hover {
	color: white;
	text-decoration: none;
}
#box2 a .rank{
	display: none;
}
#box2 a:hover .rank{
	display: inherit;
	position: static;
	top: -80px;
	left: -240px; 
	z-index: 10;
}
#box2 a:hover .btn{
	margin: 0;
}
#box2 h3 {
position: static;
	left: -250px;
	display:none;
	color: #7244FE;
	font-weight: bold;
	text-align: center;
	line-height: 100%;
	z-index:10;
}
#box2 a:hover h3{
	display: inline;
	position: static;
	left: -250px;
}
#box2 img:hover + .card-img-overlay{
	display: inline;
	position: relative;
}
#gameListCards {
	overflow-x: hidden;
	width: 80vw;
	height: 40vh;
	white-space: nowrap;
	margin: 0 auto;
}
#gameListCards a {
	display: inline;
}
.inline {
	height: 100%;
	display: inline;
}
.shadow {
	box-shadow: 5px 5px 10px;	
}
.card-img:hover{
	filter: grayscale(80%);
}
.gameCardStyle, .card-img-overlay{
	width: 15em;
	height: 15em;
	display: inline-block;
	border-radius: 2em;
}
.card-title{
	display: inherit;
}
.cardTextCenter {
	text-align: center;
	margin-top: 3em;
}
.card{
	margin:1em;
}
</style>
<body>
	<!-- PC -->
	<div class="container-fluid">
	  <div class="btn-group d-flex col-md-2">
		 <a class="platform btn btn-primary" href="" role="button" id="pc">PC</a>
	  </div>
	  <div class="row">
		<div id="box2">
		  <div id="gameListCards" class="xscroll">
			<c:forEach items="${ pcTopten }" var="dto">
			  <a href="/gamedetail?no=${ dto.no }" >
				<img src="/images/thumbnail/${dto.thumbnail}" class="card-img text-white shadow gameCardStyle" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/> 			      
				  <div class="card-img-overlay">
					<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
					<div class="card-title cardTextCenter position-relative">
					  <h3>${ dto.name } </h3>
					  <!-- <div class="badge hashtag btn-outline-primary rounded-outline-pill">장르</div> -->
					</div>
				  </div>
			  </a>
			</c:forEach>
		  </div>
	    </div>
	  </div>
	</div>
	<!-- Play Station -->
	<div class="container-fluid" style="background-color: #e8e0ff">
		<div class="btn-group d-flex col-md-2">
			<a class="platform btn btn-primary" href="" role="button" id="ps">Play Station</a>
		</div>
		<div class="row">
			<div id="box2">
				<div id="gameListCards" class="xscroll">
					<c:forEach items="${ psTopten }" var="dto">
						<div class="card bg-dark text-white shadow gameCardStyle" width="20%" onclick="location.href='/gamedetail?no=${ dto.no }';" >
						  <img src="/images/thumbnail/${dto.thumbnail}" class="card-img gameCardStyle" alt="..." onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/>
						  <div class="card-img-overlay" style="display:none;">
						  	<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
						    <h3 class="card-title">${dto.name}</h3>
						  </div>
						</div>
					</c:forEach>
				</div> 
			</div>
		</div>
	</div>
	<!-- xbox -->
	<div class="container-fluid">
		<div class="btn-group d-flex col-md-2">
			<a class="platform btn btn-primary" href="" role="button" id="xbox">Xbox</a>
		</div>
		<div class="row">
			<div id="box2">
				<div id="gameListCards" class="xscroll">
					<c:forEach items="${ xboxTopten }" var="dto">
						<div class="card bg-dark text-white shadow gameCardStyle" width="20%" onclick="location.href='/gamedetail?no=${ dto.no }';" >
						  <img src="/images/thumbnail/${dto.thumbnail}" class="card-img gameCardStyle" alt="..." onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/>
						  <div class="card-img-overlay" style="display:none;">
						  	<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
						    <h3 class="card-title">${dto.name}</h3>
						  </div>
						</div>
					</c:forEach>
				</div> 
			</div>
		</div>
	</div>
	<!-- switch -->
	<div class="container-fluid" style="background-color: #e8e0ff">
		<div class="btn-group d-flex col-md-2">
			<a class="platform btn btn-primary" href="" role="button" id="switch">Switch</a>
		</div>
		<div class="row">
			<div id="box2">
				<div id="gameListCards" class="xscroll">
					<c:forEach items="${ switchTopten }" var="dto">
						<div class="card bg-dark text-white shadow gameCardStyle" width="20%" onclick="location.href='/gamedetail?no=${ dto.no }';" >
						  <img src="/images/thumbnail/${dto.thumbnail}" class="card-img gameCardStyle" alt="..." onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/>
						  <div class="card-img-overlay" style="display:none;">
						  	<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
						    <h3 class="card-title">${dto.name}</h3>
						  </div>
						</div>
					</c:forEach>
				</div> 
			</div>
		</div>
	</div>
</body>
</html>