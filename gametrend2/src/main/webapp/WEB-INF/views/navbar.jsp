<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
 		svg {
			margin: 5px;
		}
		ul {
		    list-style:none;
		    width:100%;
		}
		li{
			float: left;
		    margin: 0 0 0 0;
		    padding: 0.25vh 1vw 0.25vh;
		    border-radius : 2em;
		} 	 	
		li:hover {
			color:white;
			background-color: #7244FE;
		}
		li:hover > a.active {
			color: white;
		} 
		.navbar-brand{
			margin:0;
		}
		
		.main-nav .navbar-nav{
			display: inline-block;
			text-align: center;
		}
		.main-nav li{
			width: 10em;
		}
		.main-nav .nav-link{
			font-weight: bold;
		}
		.nav-item input[type=submit]{
		    background-color:transparent;  
		    border:0px transparent solid; 
		    margin: 0 auto;
		}
.box {
    width: 150px;
    height: 150px; 
    border-radius: 70%;
    overflow: hidden;
    background: #FFFFFF;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}		 
	</style>
</head>
<body>
	<nav class="navbar navbar-light bg-light fixed-top">
	  <div class="container-fluid">
		  <div class="d-flex justify-content-start">			
		    <a class="navbar-brand " href="/" style="font-weight:900; font-size:14pt">
		    	<img src="/images/logo_sm.png" width="10%">	    	
		    	Game Trend
		    </a>	  	
		  </div>
		  <div class="main-nav d-flex justify-content-center"> 	 
	        <ul class=" navbar-nav me-auto">
	          <li class="nav-item">
	            <a class="nav-link active" href="gamelist">인기게임순위</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" href="calendar">게임출시정보</a>
	          </li>
	          <li class="nav-item">
	            <form method="POST" action="/promotion" > 
				   <input type="submit" class="nav-link active" name="movebtnA"  value="게임할인정보"/>  
				</form>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" href="explanation">게임플랫폼소개</a>
	          </li>	                  
	        </ul>
	       </div> 
	      
	      <c:choose>
	        <c:when test="${ isLogOn == true and not empty memberInfo }">
	      	  ${ sessionid }님 안녕하세요 :)
	      	  <form class="d-flex justify-content-end">
		      <a href="/member/logout.do" class="btn btn-primary me-2 mainColor" type="button" id="logoutBtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
				  <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
				</svg>	    	
		    	로그아웃
		      </a>
	  		  <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
		        <span class="navbar-toggler-icon"></span>
		      </button>		      	        
	        </c:when>
		    <c:otherwise>
			  <form class="d-flex justify-content-end">
			    <a href="login" class="btn btn-primary me-2 mainColor" type="button" id="loginBtn">
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16" style="display: inline">
					<path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
					<path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
				   </svg>		    	
			       로그인
			    </a>
			    <a href="join" class="btn btn-outline-primary me-2 mainColorOutline" type="button" id="joinBtn">
				  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
					<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
				  </svg>		    
			      회원가입
			    </a>
			  </form>      
		    </c:otherwise>	        
	      </c:choose>
		    		   		 		 
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	      <div class="offcanvas-header">
	        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">마이 페이지</h5>
	        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	      </div>
	      <div class="offcanvas-body">
	        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
	          <li class="nav-item mx-auto">
	            <a class="nav-link active" aria-current="page" href="#">
	              <c:choose>
	                <c:when test="${ memberInfoDTO.image eq null }">
					  <svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16" color="#7F7C82">
					    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					  </svg>	                
	                </c:when>
      	      		<c:otherwise>
      	      		  <div class="box">
      	      		    <img class="profile" src="/images/profile/${ memberInfoDTO.image }">
      	      		  </div>      	      		  
      	      		</c:otherwise>	                
	              </c:choose>
            	
	            </a>
	          </li>
	          <li class="nav-item">
	            <a id="wishlist" class="nav-link active" aria-current="page" href="wishlist?member_id=${ sessionid }&page=1">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-bookmark-star" viewBox="0 0 16 16">
					  <path d="M7.84 4.1a.178.178 0 0 1 .32 0l.634 1.285a.178.178 0 0 0 .134.098l1.42.206c.145.021.204.2.098.303L9.42 6.993a.178.178 0 0 0-.051.158l.242 1.414a.178.178 0 0 1-.258.187l-1.27-.668a.178.178 0 0 0-.165 0l-1.27.668a.178.178 0 0 1-.257-.187l.242-1.414a.178.178 0 0 0-.05-.158l-1.03-1.001a.178.178 0 0 1 .098-.303l1.42-.206a.178.178 0 0 0 .134-.098L7.84 4.1z"/>
					  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
					</svg>            
	            	위시리스트
	            </a>
	          </li>          
	          <li class="nav-item" >
	            <a class="nav-link active" href="/myreview?member_id=${ sessionid }">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-chat-square-quote" viewBox="0 0 16 16">
					  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1h-2.5a2 2 0 0 0-1.6.8L8 14.333 6.1 11.8a2 2 0 0 0-1.6-.8H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
					  <path d="M7.066 4.76A1.665 1.665 0 0 0 4 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112zm4 0A1.665 1.665 0 0 0 8 5.668a1.667 1.667 0 0 0 2.561 1.406c-.131.389-.375.804-.777 1.22a.417.417 0 1 0 .6.58c1.486-1.54 1.293-3.214.682-4.112z"/>
					</svg>       
	            	나의 리뷰
	            </a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" id="navEditMemberInfo" href="/editMemberInfoForm">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
					  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>         
	            	회원 정보 수정
	            </a>
	          </li>                   
	        </ul>       
	      </div>
	    </div>
      </div>             
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>