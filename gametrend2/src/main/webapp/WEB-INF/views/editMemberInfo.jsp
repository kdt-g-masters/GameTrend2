<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Game Trend</title>

	<!-- datePicker -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" crossorigin="anonymous">
	<link rel="stylesheet" href="css/datepicker.css">
	<link rel="stylesheet" href="css/datepicker_main.css">
	
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/index.css"/>
	<link rel="stylesheet" href="/css/join.css"/>
	
	<script src="/jquery-3.6.0.min.js"></script>
	<script src="/js/join.js"></script>
	<script>
		$(document).ready(function(){
			$("form").attr('action', "/editMemberInfo");
			$("form").attr('method', 'post');
			$("form").attr('enctype', "multipart/form-data");
		});
	</script>
	<style>
		main {
			width: 60%;
			margin: 200px auto;
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
  <%@ include file="navbar.jsp" %>
  <main>
	<h2 class="pt-5 pb-5" style="display: inline-block">내 정보 수정</h2>

	<div class="row">
	    <div id="rightBox" class="col-lg-6">
	      <div class="row">
	        <div id="joinElements" class="col-lg-12 p-5 m-5">	        
	          
	      	  <form action="" class="mx-5">
	      	    <!-- 프로필 이미지 -->
	      	    <div class="row mb-3">
	      	      <div class="d-flex">
	      	      	<h5>프로필 이미지</h5>					
	      	      </div>
	      	      <div class="col-12">
	      	      	<div class="box mx-auto">
	      	      	  <c:choose>
	      	      		<c:when test="${ memberInfoDTO.image eq null }">
						  <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16" color="#7F7C82">
						    <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						    <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
						  </svg>	      	      		  
	      	      		</c:when>
	      	      		<c:otherwise>
	      	      		  <img class="profile" src="/images/profile/${ memberInfoDTO.image }">
	      	      		</c:otherwise>
	      	      	  </c:choose>					    					                            				   
					</div>
					<input type="file" class="custom-file-input" id="profileImg" name="multipartFile">
	      	      </div>
	      	    </div>
	      	  	<!-- 아이디 -->
	      	    <div class="row">
	      	      <div class="d-flex">
	      	        <h5 class="inline">아이디</h5>
	      	        <p class="sm_msg mx-2">최대 20자까지 입력 가능합니다.</p>
	      	      </div>
	      	      <div class="col-12 d-flex posRel">
	      	        <input type="text" id="inputMemberId" name="id" class="flex-fill" value="${ memberInfoDTO.id }" maxlength="20" size="31" readonly/>
		            <!-- 중복확인 결과 아이콘 -->
		            <div id="check">
		              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16" id="idAvailable">
					    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					    <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
					  </svg>		            
		            </div>
		            <div id="warning">
					  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16" id="idNotAvailable">
					    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					    <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
					  </svg>	      	        	      	      	      	    		            
		            </div>	      	            	      	      	        	            	      	        
	      	      </div>	              
	            </div>
	            
	            <!-- 비밀번호 -->
                <div class="row">
                  <div class="d-flex">
                    <h5 class="inline">비밀번호</h5>
                    <p class="sm_msg mx-2">영문/숫자/특수문자를 조합하여 기재하세요.</p>
                  </div>
		          <div class="col-12 d-flex posRel">
		            <input type="password" id="password_1" name="password_1" class="flex-fill" size="21" required value="${ memberInfoDTO.password }"/>&nbsp;&nbsp;
		            <!-- 비밀번호 확인 -->
		            <input type="password" id="password" name="password" class="flex-fill" size="21" required value="${ memberInfoDTO.password }" />
                    <div id="pwCheck">
	                  <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16" id="pwAvailable">
				        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				        <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
				      </svg>                   
                    </div>
                    <div id="pwWarning">
				      <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16" id="pwNotAvailable">
				        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
				      </svg>                                                       
                    </div>		             
		          </div>	                
                </div>
                
	            <!-- 이름 --> 
	            <div class="row d-flex">
	              <h5 class="inline col-12">이름</h5>
	              <input type="text" id="name" name="name" value="${ memberInfoDTO.name }">		              	              
	            </div>
	            
		        <!-- 성별, 생년월일 --> 
		        <div class="row">
		         <div class="col-6">
			        <h5 class="col-12">생년월일</h5>
			        <div class="col-12">                        
					  <div class="docs-datepicker">
				        <div class="input-group">
				          <input type="text" class="form-control docs-date" name="birthdate" aria-label="birthDate" aria-describedby="btnCal" value="${ memberInfoDTO.birthdate }" autocomplete="off">
				          <div class="input-group-append" >
				            <button id="btnCal" name="birthDate" type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled>
				              <i class="fa fa-calendar" aria-hidden="true"></i>
				            </button>
				          </div>
				        </div>
				        <div class="docs-datepicker-container"></div>
				      </div>
				    </div> 		            
		          </div>
		        
		          <div class="col-6">
		            <h5 class="col-12">성별</h5>
		            <div class="col-12">
		              <div class="btn-group gender col-12" role="group" aria-label="Basic radio toggle button group">
		                <input type="radio" class="btn-check mainColor" name="gender" id="male" value="0" autocomplete="off" <c:if test="${memberInfoDTO.gender eq 0}">checked</c:if>>
		                <label class="btn btn-outline-primary" for="male">남성</label>
		
		                <input type="radio" class="btn-check mainColor" name="gender" id="female" value="1" autocomplete="off" <c:if test="${memberInfoDTO.gender eq 1}">checked</c:if>>
		                <label class="btn btn-outline-primary" for="female">여성</label>
		              </div>
		            </div>		              
		          </div>		           
		        </div>
		        
	            <!-- 이메일 -->
	            <div class="row">
	              <div class="d-flex">
	                <h5 class="inline">이메일</h5>
	                <p class="sm_msg mx-2">에메일은 로그인 정보 분실시에 활용됩니다.</p>	               	            
	              </div>
	              <div class="col-12 d-flex">
	                <!-- 이메일 텍스트 -->
	                <input type="text" id="email" name="email" class="col-12 ml-2" value="${memberInfoDTO.email}" readonly/>	                            
	              </div>	                        	     
      	        </div>
      	        
		        <div class="row d-flex center mt-5">         
		          <!-- 취소 --> 
		          <button type="button" id="btnCancel" class="btn btn-outline-primary py-2 col-6">취소</button> 
		          <!-- 수정 -->
		          <input type="submit" id="btnSubmit" class="btn btn-primary py-2 col-6" value="수정">	     
		        </div>      	        	      	    
	      	  </form>	      	            
	        </div>
	      </div>	      
	    </div>
	  </div>
  </main>
  <div class="space" style="height:500"></div>
  <%@ include file="footer.jsp" %>
  
  <!-- Scripts -->
  <script src="https://unpkg.com/bootstrap@4/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="js/datepicker.js"></script>
  <script src="js/datepicker.ko-KR.js"></script>
  <script src="js/main.js"></script>		
</body>
</html>