<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>할인정보 안내</title>

	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/index.css"/>
	<link rel="stylesheet" href="/css/chat.css"/>
	
	<script src="/js/chat.js"></script>
	<script src="/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
	</script>
	
	<style>
	#promotion {
		text-align: center;
		margin:0 auto;	
	}
	#box2{
		width: 100%;
		height: 100%;
	}
	.row{ 
		margin:0 auto; 
	}
	.promotion-info{
		width: 250px;
		height: 300px;
		border: 0px solid #c165dd;
		border-radius: 5em 0 0 5em;
		margin-right: 2em;
		display: inline-block;
		text-align: center;
		vertical-align: middle;
	}
	.underline{
	/* text-decoration: underline 10px lime; */
	display: inline;
  	box-shadow: inset 0px -6px 0px 0px #c165dd;
  	border-radius: 1px;
	}
	.promotion-info h4{ 
		margin-top: 13vh; 
	}
	.promotion-img, .game-list{ 
		display: inline-block; 
	}
	.promotion-img img{ 
		box-shadow: 5px 5px 10px 80%; 
	}
	.line { 
		display:inline-block;
		border: 1px solid  #d0c1ff; 
		width: 0.1px; 
		height: 15em;
		vertical-align: middle;
		margin: 0 20px;
	}
	.line2 {
		text-aling: center;
	}
	.line2:after {
        content: "";
        display: block;
		border: 1.5px solid rgba(0,0,0,10%); 
		width: 1345px;
		height:0.1px;
		margin-left:10vw;
	}
	</style>
	
</head>

<body>

	<!-- navbar -->
	<%@ include file="navbar.jsp" %>
	
	<div class="space" style="height:150px"></div>  
	<section id="section">
	  <div class="col-lg-12 mainTitle d-flex">
		<input type="button" id="title" class="btn btn-primary btn-lg" value="플랫폼별 할인 이벤트" readolny />
	  </div>	
	  <div class="space" style="height:130px"></div>
	</section>
	<div class="container-fluid" id="promotion">
	  <div class="row">
	    <div class="line2"></div> 
	    <c:forEach items="${Event}" var="event" varStatus="number">
		  <div id="box2">
		    <div class="space" style="height:100px"></div> 
		    
		    <div class="promotion-info ">
		    <h4> <span class="underline" style="font-size:1.13em;">${event.platform}</span> </h4> 
		    <br> 
		    ${event.startDate} ~ ${event.endDate}
		    </div>
		    
		    <div class="promotion-img">
		      <a href="${event.link}"> 
		        <img src="images/jm/${event.mainImage}" width="350" height="300" alt="no search image">
		      </a>
		    </div>
		    <div class="line"></div>
		   	<div class="game-list">
		      <a href="${event.link}">
		        <img src="images/jm/${event.image}" width="670" height="300" alt="no search image">
		      </a> 
		    </div>
		    <div class="space" style="height:100px"></div>  
		  </div>
		  <div class="line2"></div>
		</c:forEach> 
	  </div>
	</div>
	<div class="space" style="height:210px"></div> 

	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<%@ include file="chatbottest.jsp" %>
	
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
</body>

</html>
