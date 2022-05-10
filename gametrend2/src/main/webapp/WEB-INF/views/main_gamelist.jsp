<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/jquery-3.6.0.min.js"></script>    
<script type="text/javascript">
	$(document).ready(function(){

		var dragFlag = false;
		var x, y, pre_x, pre_y;

		$(function () {
			$('#gameListCards').mousedown(
				function (e) {
					dragFlag = true;
					var obj = $(this);
					x = obj.scrollLeft();
					y = obj.scrollTop();

					pre_x = e.screenX;
					pre_y = e.screenY;					

					$(this).css("cursor", "pointer");

					//$('#result').text("x:" + x + "," + "y:" + y + "," + "pre_x:" + pre_x + "," + "pre_y:" + pre_y);
					$('#result').text(dragFlag);

				}
			);

			$('#gameListCards').mousemove(
				function (e) {
					if (dragFlag) {
						var obj = $(this);
						obj.scrollLeft(x - e.screenX + pre_x);
						obj.scrollTop(y - e.screenY + pre_y);

						//$('#result').text((x - e.screenX + pre_x) + "," + (y - e.screenY + pre_y));
						return false;
					}

				}
			);

			$('#gameListCards').mouseup(
				function () {
					dragFlag = false;
					//$('#result').text("x:" + x + "," + "y:" + y + "," + "pre_x:" + pre_x + "," + "pre_y:" + pre_y);
					$('#result').text(dragFlag);
					$(this).css("cursor", "default");
				}


			);

			$('body').mouseup(
				function () {
					dragFlag = false;					
					$('#result').text(dragFlag);
					$(this).css("cursor", "default");
				}
			);
		});
		
	
	});
</script>
<style>
#box2 {
	width: 100%;
	padding: 50px;
}
#box2 a {
	color: #716F6F;
}

#box2 a:hover  {
	color: white;
	text-decoration: none;
}
#box2 a button{
	display: hidden;
	position: relative;
	top: 10px;
	left: 10px;
	z-index: 10;
	
}
#box2 a:hover button{
	display: inherit;
	
}
#box2 h4 {
	display: inline;
	font-weight: bold;
	text-align: center;
	line-height: 100%;
}
#box2 h4:hover{display: inline;}
#gameListCards {
	overflow-x: hidden;
	width: 80vw;
	height: 50vh;
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
#image{
filter: darkness(85%);
}
.gameCardStyle {
	width: 15em;
	height: 15em;
	display: inline-block;
	margin: 1em;
	border-radius: 2em;
}

.cardTextCenter {
	text-align: center;
	margin-top: 3em;
}
#gameList{
display: inline-block;
text-align: center;
margin: 0 auto;
padding : 10px;
}

</style>
<body><br><br><br>
	<div class="container-fluid">
		<div class="btn-group d-flex col-md-2">
			<a class="btn btn-primary" href="" role="button" id="pc">PC</a>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div id="box2">
				<div id="gameListCards">
					<c:forEach items="${ toptenlist }" var="dto">
						<div class="inline" >
							
								<button class="btn btn-primary rank position-relative"><b>${dto.ranking}</b></button>
								<a href="/gamedetail?no=${ dto.no }" >
						      	<img src="/images/thumbnail/${dto.thumbnail}" class="card-img text-white shadow gameCardStyle" onmouseover="this.style.opacity='0.5'" onmouseout="this.style.opacity='1'"> 				      
						     	</a><%-- <h4 class="card-body  "> ${ dto.name } </h4> --%>
						     	<div class="card-img-overlay">
									<h5 class="card-title inline cardTextCenter">${ dto.name } </h5>
									<span class="badge hashtag btn-outline-primary rounded-outline-pill">장르</span>
								</div>
						    
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>