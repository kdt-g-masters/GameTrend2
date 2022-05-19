<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
	$(document).ready(function(){

		var dragFlag = false;
		var x, y, pre_x, pre_y;

		$(function () {
			/* $('.xscroll').scrollLeft(screenX + 500).delay(1000); */
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
						e.preventDefault();
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
	margin:0 auto;
	width: 40px;
	z-index: 10;
} 

#box2 a:hover .btn{
	margin: 0 auto;
}
#box2 h3 {
	font-weight: bold;
	text-align: center;
	line-height: 100%;
	font-size: 1.2em;
}
#gameListCards {
	overflow-x: hidden;
	width: 80vw;
	height: 40vh;
	white-space: nowrap;
	margin: 0 auto;
}
#gameListCards a {
	display: inline-block;
}
.inline {
	height: 100%;
	display: inline;
}
.gameCardStyle, .card-img-overlay{
	width: 13em;
	height: 13em;
	display: inline-block;
	border-radius: 2em;
	background-color: rgba(0,0,0,70%);
}
.cardTextCenter {
	text-align: center;
	margin-top: 2em;
	white-space : normal;
}
.shadow{
	box-shadow: 5px 5px 10px 50%;
}
#gameListCards .card{
	margin:1em;
	border-radius: 2em;
	border:0 none white;
}
.content{
	display: none;
	position: absolute;
	text-align: center;
}
#box2 a:hover .content{
	display: inline-block;
	border-radius: 2em;
}
.card-img{
	border-radius: 2em;
	object-fit:cover;
}

</style>

<body>
	<!-- PC -->
	<div class="container-fluid">
	  <div class="btn-group d-flex col-md-1">
		 <a class="platform btn btn-primary" href="" role="button" id="pc"><b>PC</b></a>
	  </div>
	  <div class="row">
		<div id="box2">
		  <div id="gameListCards" class="xscroll">
			<c:forEach items="${ pcTopten }" var="dto">
			  <a href="/gamedetail?no=${ dto.no }" >
			  <div class="gameCardStyle card text-white" >
				<img src="/images/thumbnail/${dto.thumbnail}" class="text-white shadow gameCardStyle " style="object-fit:cover;" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/> 			      
				  <div class="card-img-overlay content">
					<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
					<div class="card-title cardTextCenter content position-relative">
					  <h3>${ dto.name } </h3>
					  <c:forEach items="${ pcGenreTopten }" var="genredto">
					  	<c:if test="${ genredto.game_no == dto.no }" >
					    	<div class="badge hashtag btn-outline-primary rounded-outline-pill">${ genredto.genre }</div>
					    </c:if>
					  </c:forEach>
					</div>
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
	  <div class="btn-group d-flex col-md-1">
		 <a class="platform btn btn-primary" href="" role="button" id="ps"><b>Play Station</b></a>
	  </div>
	  <div class="row">
		<div id="box2">
		  <div id="gameListCards" class="xscroll">
			<c:forEach items="${ psTopten }" var="dto">
			  <a href="/gamedetail?no=${ dto.no }" >
			  <div class="gameCardStyle card text-white" >
				<img src="/images/thumbnail/${dto.thumbnail}" class="text-white shadow gameCardStyle " style="object-fit:cover;" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/> 			      
				  <div class="card-img-overlay content">
					<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
					<div class="card-title cardTextCenter content position-relative">
					  <h3>${ dto.name } </h3>
					  <c:forEach items="${ psGenreTopten }" var="genredto">
					  	<c:if test="${ genredto.game_no == dto.no }" >
					    	<div class="badge hashtag btn-outline-primary rounded-outline-pill">${ genredto.genre }</div>
					    </c:if>
					  </c:forEach>
					</div>
				  </div>
				</div>  
			  </a>
			</c:forEach>
		  </div>		
		</div>
	  </div>
	</div>
	<!-- xbox -->
	<div class="container-fluid">
	  <div class="btn-group d-flex col-md-1">
		<a class="platform btn btn-primary" href="" role="button" id="xbox"><b>Xbox</b></a>
	  </div>
	  <div class="row">
		<div id="box2">
		  <div id="gameListCards" class="xscroll">
			<c:forEach items="${ xboxTopten }" var="dto">
			  <a href="/gamedetail?no=${ dto.no }" >
			  <div class="gameCardStyle card text-white" >
				<img src="/images/thumbnail/${dto.thumbnail}" class="text-white shadow gameCardStyle " style="object-fit:cover;" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/> 			      
				  <div class="card-img-overlay content">
					<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
					<div class="card-title cardTextCenter content position-relative">
					  <h3>${ dto.name } </h3>
					  <c:forEach items="${ xboxGenreTopten }" var="genredto">
					  	<c:if test="${ genredto.game_no == dto.no }" >
					    	<div class="badge hashtag btn-outline-primary rounded-outline-pill">${ genredto.genre }</div>
					    </c:if>
					  </c:forEach>
					</div>
				  </div>
				</div>  
			  </a>
			</c:forEach>
		  </div>	
		</div>
	  </div>
	</div>
	<!-- switch -->
	<div class="container-fluid" style="background-color: #e8e0ff">
	  <div class="btn-group d-flex col-md-1">
		<a class="platform btn btn-primary" href="" role="button" id="switch"><b>Switch</b></a>
	  </div>
	  <div class="row">
		<div id="box2">
		  <div id="gameListCards" class="xscroll">
			<c:forEach items="${ switchTopten }" var="dto">
			  <a href="/gamedetail?no=${ dto.no }" >
			  <div class="gameCardStyle card text-white" >
				<img src="/images/thumbnail/${dto.thumbnail}" class="text-white shadow gameCardStyle " style="object-fit:cover;" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"/> 			      
				  <div class="card-img-overlay content">
					<div class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></div>
					<div class="card-title cardTextCenter content position-relative">
					  <h3>${ dto.name } </h3>
					  <c:forEach items="${ switchGenreTopten }" var="genredto">
					  	<c:if test="${ genredto.game_no == dto.no }" >
					    	<div class="badge hashtag btn-outline-primary rounded-outline-pill">${ genredto.genre }</div>
					    </c:if>
					  </c:forEach>
					</div>
				  </div>
				</div>  
			  </a>
			</c:forEach>
		  </div>	
		</div>
	  </div>
	</div>
</body>
</html>