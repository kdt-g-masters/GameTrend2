<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/adminLogin.css" rel="stylesheet">
<script src="/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#btnAdminLogin").on('click', function(){
			$.ajax({
				url: '/adminLogin',
				data: {'id': $("#id").val(), 'password': $("#password").val()},
				type: 'post',
				dataType: 'json',
				success: function(result) {
					if (result == '1') {
						location.replace('/');
					}
					else {
						alert('로그인 실패');
						//$('#msgLoginFail').html("아이디 또는 비밀번호가 일치하지 않습니다.");
						//$('#msgLoginFail').css("visibility", "visible");
					}
				} // function end
			});	// ajax end
		}); // on end
	});
</script>
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
</style>
</head>
<body class="text-center">
	<main class="form-signin">
	  <form>
	    <img class="mb-4" src="/images/logo_sm.png" alt="로고" width="72" height="57">
	    <h1 class="h3 mb-3 fw-normal">관리자 로그인</h1>
	
	    <div class="form-floating">
	      <input type="email" class="form-control" id="id" placeholder="관리자 아이디">
	      <label for="floatingInput">아이디</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="password" placeholder="Password">
	      <label for="floatingPassword">비밀번호</label>
	    </div>
	
	    <div class="checkbox mb-3">
	    </div>
	    <button id="btnAdminLogin" class="w-100 btn btn-lg btn-primary" type="button">로그인</button>
	  </form>
	</main>
</body>
</html>