<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<script src="/jquery-3.6.0.min.js"></script>
<script src="/js/join.js"></script>

<!-- datePicker -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" crossorigin="anonymous">
<link rel="stylesheet" href="css/datepicker.css">
<link rel="stylesheet" href="css/datepicker_main.css">


<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/join.css" rel="stylesheet"/>
<link href="/css/index.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body id="joinBgColor">

  <!-- navbar -->
  <%@ include file="navbar.jsp" %>
	
  <main>
	<div id="joinBox">
	  <div class="row">
	    <div id="leftBox" class="col-lg-6">
		  <div class="container d-flex h-100">
		    <div class="row mx-auto text-center justify-content-center align-self-center" id="msgWelcome">
			  <div class="col-12 py-1">
			  	<img src='/images/logo.png' id="joinPageLogo" class="col-6"></img><br>
			    <h2 class="text-white">Game Trend</h2>
			  </div>
			  <div class="col-12 py-1">
			    <p class="sm_msg text-white">Game Trend<br>국내 각 게임 플랫폼별 게임 순위 및 정보를 알려주는 서비스를 제공합니다</p>
			  </div>
			</div>		
		  </div>
	    </div>
	    <div id="rightBox" class="col-lg-6">
	      <div class="row">
	        <div id="joinElements" class="col-lg-12 p-5 m-5">	        
	          <h3 class="mb-5">회원가입</h3>
	      	  <form action="/join" method="post" class="mx-5">
	      	  	<!-- 아이디 -->
	      	    <div class="row">
	      	      <div class="d-flex">
	      	        <h5 class="inline">아이디</h5>
	      	        <p class="sm_msg mx-2">최대 20자까지 입력 가능합니다.</p>
	      	      </div>
	      	      <div class="col-12 d-flex posRel"> 
	      	        <input type="text" id="inputMemberId" name="id" class="flex-fill" placeholder="아이디 입력" maxlength="20" size="31" pattern="[a-zA-Z0-9]{0, 20}" required />
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
	      	        <button type="button" id="btnCheckId" class="btn text-white btn-sm btn-primary col-2 mx-2" data-bs-toggle="modal" data-bs-target="#OverlappingCheck1">중복확인</button>
	      	      </div>
	      	      <div class="col-2">
		            	      	      
	      	      </div>
	              <!-- Modal -->
	              <div class="modal fade" id="OverlappingCheck1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	                <div class="modal-dialog">
	                  <div class="modal-content">
	                    <div class="modal-header">
	                      <h5 class="modal-title" id="staticBackdropLabel">ID 중복확인</h5>
	                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                    </div>
	                    <div class="modal-body" id="resultModal"></div>
	                    <div class="modal-footer">
	                      <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫 &nbsp;기</button>
	                    </div>
	                  </div>
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
		            <input type="password" id="password_1" name="password_1" class="flex-fill" size="21" required />&nbsp;&nbsp;
		            <!-- 비밀번호 확인 -->
		             <input type="password" id="password" name="password" class="flex-fill" size="21" required />                    
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
	              <input type="text" id="name" name="name" placeholder="이름 입력">		              	              
	            </div>
	            
		        <!-- 성별, 생년월일 --> 
		        <div class="row">
		         <div class="col-6">
			        <h5 class="col-12">생년월일</h5>
			        <div class="col-12">                        
					  <div class="docs-datepicker">
				        <div class="input-group">
				          <input type="text" class="form-control docs-date" name="birthdate" aria-label="birthdate" aria-describedby="btnCal" placeholder="날짜 선택" autocomplete="off" required>
				          <div class="input-group-append" >
				            <button id="btnCal" name="birthdate" type="button" class="btn btn-outline-secondary docs-datepicker-trigger" disabled>
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
		                <input type="radio" class="btn-check mainColor" name="gender" id="male" value="0" autocomplete="off" checked>
		                <label class="btn btn-outline-primary" for="male">남성</label>
		
		                <input type="radio" class="btn-check mainColor" name="gender" id="female" value="1" autocomplete="off">
		                <label class="btn btn-outline-primary" for="female">여성</label>
		              </div>
		            </div>		              
		          </div>		           
		        </div>
		        
	            <!-- 이메일 -->
	            <div class="row">
	              <div class="d-flex">
	                <h5 class="inline"> 이메일</h5>
	                <p class="sm_msg mx-2">에메일은 로그인 정보 분실시에 활용됩니다.</p>	               	            
	              </div>
	              <div class="col-12 d-flex">
	                <!-- 이메일 텍스트 -->
	                <input type="text" id="email" name="email" class="col-6 ml-2" required/>
	                <!-- 인증번호(모달) -->   
	                <!-- Button trigger modal -->
	                <button type="button" id="btnCerti" class="btn text-white btn-sm btn-primary col-3 mx-2" data-bs-toggle="modal" data-bs-target="#CertificationNumber">메일전송</button>		          
		            
		            
		        	<!-- Modal -->
		            <!-- 
		            <div class="modal fade" id="CertificationNumber" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		              <div class="modal-dialog">
		                <div class="modal-content">
		                  <div class="modal-header">
		                    <h5 class="modal-title" id="staticBackdropLabel">인증번호 발송</h5>
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                  </div>
		                  <div class="modal-body">
		                    인증번호 확인
		                  </div>
		                  <div class="modal-footer">
		                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
		                  </div>
		                </div>
		              </div>
		            </div>
		            	  -->               
	              </div>
	              <div class="col-12 d-flex">
	                <!-- 인증번호 텍스트칸 -->	              
		            	<div class="mail_check_wrap">
                    		<div class="mail_check_input_box" id="mail_check_input_box_false">
                        	<input type="text" id = "btnConfirm" name="certification" class="mail_check_input" placeholder="인증번호" disabled="disabled" required >
                    		<div class="clearfix"></div>
                    		</div> 
                    		<span id="mail_check_input_box_warn"></span>
                		</div>
	              </div>                	      
      	        </div>
		             
		           <!--  Button trigger modal -->
		            <!-- <button type="button" id="btnConfirm" class="btn text-white btn-sm btn-primary col-3 mx-2" data-bs-toggle="modal" data-bs-target="#Checking">확인</button>	 -->                
	               
	              
      	        
		        <div class="row d-flex center mt-5" id = "b">         
		            <!-- 가입하기 -->
		            <button type="submit" id="btnSubmit" class="btn btn-primary mx-1" >가입하기</button>
		            <!-- 취소하기 -->
		            <button type="button" id="btnCancel" class="btn btn-outline-primary mx-1">취소</button> 		     		            
		        </div>      	        	      	    
	      	  </form>
	      	</div>
	      </div>	      
	    </div>
	  </div>
	</div>
  </main>
  
  <!-- footer -->
  <%@ include file="footer.jsp" %>
  
  <!-- Scripts --> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script src="https://unpkg.com/bootstrap@4/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="https://fengyuanchen.github.io/shared/google-analytics.js" crossorigin="anonymous"></script>
  <script src="js/datepicker.js"></script>
  <script src="js/datepicker.ko-KR.js"></script>
  <script src="js/main.js"></script> 
</body>
</html>