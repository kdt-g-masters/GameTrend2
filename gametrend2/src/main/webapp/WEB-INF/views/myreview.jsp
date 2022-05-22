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
	<link rel="stylesheet" href="/css/index.css"/>
	<script src="/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
	
		});
	</script>
<style>
	@font-face {
	    font-family: 'KoPubDotumMedium';
	     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/KoPubDotumMedium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	* {
		font-family: 'KoPubDotumMedium';		
	}
	main {
		width: 60%;
		margin: 200px auto;
	}
</style>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	<main>
	  <h2 class="pt-5 pb-5" style="display: inline-block">나의 리뷰</h2>
	  
	  <div class="row mb-2">
	    <h3 class="pt-5 pb-5" style="display: inline-block">승인된 리뷰</h3>
	    <c:forEach items="${ apprReviewList }" var="dto">
	      <div class="col-md-6">
	        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	          <div class="col p-4 d-flex flex-column position-static">
	            <strong class="d-inline-block mb-2 text-primary">승인</strong>
	            <h4 class="mb-0"><b>${ dto.gameDTO.name }</b></h4>
	            <div class="mb-1 text-muted">${ dto.reviewDTO.date }</div>
	            <p class="card-text mb-auto">${ dto.reviewDTO.contents }</p>
	            <p>
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#FFD37C" class="bi bi-star-fill" viewBox="0 0 16 16">
				    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				  </svg>
				  ${ dto.reviewDTO.stars }	              
	            </p>
	          </div>
	          <div class="col-auto d-none d-lg-block">
	            <!-- <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
	            <img class="bd-placeholder-img" width="200" height="200" src="/images/thumbnail/${ dto.gameDTO.thumbnail }" />
	          </div>
	        </div>
	      </div>
	    </c:forEach>
	  </div>
	  
	  <div class="row mb-2">
	    <h3 class="pt-5 pb-5" style="display: inline-block">승인을 기다리는 리뷰</h3>
	    <c:forEach items="${ notApprReviewList }" var="dto">
	      <div class="col-md-6">
	        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	          <div class="col p-4 d-flex flex-column position-static">
	            <strong class="d-inline-block mb-2 text-secondary">승인 진행중</strong>
	            <h4 class="mb-0"><b>${ dto.gameDTO.name }</b></h4>
	            <div class="mb-1 text-muted">${ dto.reviewDTO.date }</div>
	            <p class="card-text mb-auto">${ dto.reviewDTO.contents }</p>
	            <p>
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#FFD37C" class="bi bi-star-fill" viewBox="0 0 16 16">
				    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				  </svg>
				  ${ dto.reviewDTO.stars }	              
	            </p>
	          </div>
	          <div class="col-auto d-none d-lg-block">
	            <!-- <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
	            <img class="bd-placeholder-img" width="200" height="200" src="/images/thumbnail/${ dto.gameDTO.thumbnail }" />
	          </div>
	        </div>
	      </div>
	    </c:forEach>
	  </div>
	  
	  <div class="row mb-2">
	    <h3 class="pt-5 pb-5" style="display: inline-block">비승인된 리뷰</h3>
	    <c:forEach items="${ disApprReviewList }" var="dto">
	      <div class="col-md-6">
	        <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	          <div class="col p-4 d-flex flex-column position-static">
	            <strong class="d-inline-block mb-2 text-danger">비승인</strong>
	            <h4 class="mb-0"><b>${ dto.gameDTO.name }</b></h4>
	            <div class="mb-1 text-muted">${ dto.reviewDTO.date }</div>
	            <p class="card-text mb-auto">${ dto.reviewDTO.contents }</p>
	            <p>
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="#FFD37C" class="bi bi-star-fill" viewBox="0 0 16 16">
				    <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				  </svg>
				  ${ dto.reviewDTO.stars }	              
	            </p>
	            <p class="card-text mb-auto text-danger">${ dto.reviewDTO.disapprRsn }</p>
	          </div>
	          <div class="col-auto d-none d-lg-block">	          
	            <img class="bd-placeholder-img" width="200" height="200" src="/images/thumbnail/${ dto.gameDTO.thumbnail }" />
	          </div>
	        </div>
	      </div>
	    </c:forEach>
	  </div>	  
	</main>
	<div class="space" style="height:500"></div>
	<%@ include file="footer.jsp" %>
	
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>