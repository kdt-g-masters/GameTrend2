<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class=".carousel container-fluid" style="padding:0;">
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		  </div>
		  <div class="carousel-inner" data-bs-interval="2000" >
		    <div class="carousel-item active">
		      <img src="images/carousel/Pokemon.png" class="d-block w-100" alt="..." >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Pokemon Legends: Arceus</h5>
		        <p>포켓몬 시리즈의 RPG에 액션과 탐험을 결합한 Game Freak 사의 새로운 게임인 Pokémon Legends : Arceus 에서 새로운 종류의 웅장한 Pokémon 모험을 준비하세요.</p>
		      </div>
		    </div>
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="images/carousel/EldenRing.png" class="d-block w-100" alt="..." >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Elden Ring</h5>
		        <p>과거의 찬란한 영광과 세계의 힘인 축복이 사그러들어 가는 틈새의 땅에서, 필드와 호흡하고 거대한 보스들을 물리쳐, 엘데의 왕이 되어 틈새의 땅을 구원하세요.</p>
		      </div>
		    </div>
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="images/carousel/HorizonForbiddenWest.png" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Horizon Forbidden West</h5>
		        <p>먼 미래, Horizon 세계에서 먼 땅을 탐험하고, 놀라운 부족원들과 만나, 더 크고 경외심을 불러일으키는 기계와 싸우세요.</p>
		      </div>
		    </div>
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="images/carousel/Sifu.png" class="d-block w-100" alt="..." >
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Sifu</h5>
		        <p>Sifu는 Absolver의 독립 스튜디오인 Sloclap의 새로운 게임입니다. 강렬한 백병전이 특징인 3인칭 액션 게임으로, 복수의 길에 있는 쿵푸 청년을 조종하게 됩니다.</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	<%-- <div class=".carousel container-fluid">
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
		    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		   	 	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    	<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		    </div>
			<div class="carousel-inner" >
		    	<c:forEach items="${carousellist}" var="carouseldto">
		    		<div class="carousel-item active" data-bs-interval="2000">
		      			<img src="resources/carousel/'${carouseldto.image}'" class="d-block w-100" alt="...">
		      			<div class="carousel-caption d-none d-md-block">
		        			<h5>${carouseldto.title}</h5>
		        			<p>${carouseldto.subtitle}</p>
		      			</div>
		    		</div>
		  		</c:forEach>
		  	</div>
		  	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    	<span class="visually-hidden">Previous</span>
		  	</button>
		  	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
		    	<span class="visually-hidden">Next</span>
		  	</button>
		</div>
	</div> --%>