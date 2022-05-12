<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="carousel container-fluid">
		<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
		  </div>
		  <div class="carousel-inner" data-bs-interval="2000" >
		  <c:forEach items="${ carousellist }" var="dto">
		  	<c:choose>
			  	<c:when test="${dto.no == 1 }">
			    	<div class="carousel-item active">
			    </c:when>
			    <c:otherwise>
			  	  <div class="carousel-item">
			    </c:otherwise>
		    </c:choose>
		      <img src="images/carousel/${ dto.image }" class="d-block w-100" alt="..." >
		      <div class="carousel-caption d-none d-md-block">
		        <h1>${ dto.title }</h1>
		        <p>${ dto.subtitle }</p>
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
	</div>