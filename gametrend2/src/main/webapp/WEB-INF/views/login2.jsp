<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/css/login.css" rel="stylesheet">
<script src="/jquery-3.6.0.min.js"></script>
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
#a{
	width : 300px;
    height : 300px;
    margin : 0 auto;
	}
	
input[type=text]{
	font-size: 15px;
	width: 299px;
	height: 40px;
	margin : 2px;
	}
	
#find{
	font-size: 15px;
	width : 297px;
	height: 40px;
	margin : 5px;
}
h4{
 text-align : center
}

img{
	width : 270px;
	height: 180px;
	margin: 20px;
	}

#id_pw_find{
	display: flex;
	justify-content: center;
}

</style>
<script>
$(document).ready(function(){	
	/* 
	// 아이디 찾기
	$("#button").on('click', function(){
		var name = $('#name').val()
		var phone = $('#phone').val()
		
		$.ajax({
			url: '/login2',
			data:{"name" : name, "phone" : phone},
			type : 'post', 
			//dataType: 'json',
			success: function(data){ 
				if(data == 0){
					alert("이름과 휴대폰 번호를 다시 확인해 주세요");
				} else {
					alert("찾으시는 아이디는" + " " + data + " " + "입니다");
				}
			}//success end
			
		});//ajax end
	
	});//onend
	 */	

}); //ready end 

</script>

<script type="text/javascript">

function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

</script>

</head>
<body>

<div id="box">
	<div id= 'a'>
		<a href = "index.jsp"><img src = 'images/logo.png'></img></a><br>
		<h4>아이디 / 비밀번호 찾기</h4>
		<!-- 아이디/비밀번호 찾기 radio -->
			<div id = id_pw_find>
				<label class="radio-inline" for="flexRadioDefault1">
				<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked" class="form-check-input" >
				아이디 찾기&nbsp; &nbsp; &nbsp;
				</label>
				<label class="radio-inline" for="flexRadioDefault2">
				<input type="radio" id="search_2" name="search_total" onclick="search_check(2)" class="form-check-input">
				비밀번호 찾기
				</label>
			</div><br>
	
		<!-- 아이디 찾기 텍스트 -->
			<div id="searchI">
				<div>이름을 입력하세요</div>
					<form method="get" action="/mail_ok2.do" name="mailFrm">
						<input id = "name" class = "form-control me-2" type = 'text' name = 'name' placeholder= "이름"><br>
				<div>이메일 주소를 입력하세요</div>
						<input type="text" id="email" name="email" class = "form-control me-2" placeholder= "이메일"><br>
						<input type="submit" id = "sendmail_id" value="이메일 전송" class="form-control me-2" />
					</form>
			</div>	
		
		<!-- 비밀번호 찾기 -->
			<div id="searchP" style="display: none;">
				<div>아이디를 입력 입력하세요</div>
					<form method="get" action="/mail_ok.do" name="mailFrm">
						<input type="text" name="id" placeholder="아이디"  class="form-control me-2" id="id"	name="inputEmail_2" /><br>
				<div>이메일 주소를 입력하세요</div>
						<input type="text" name="email" placeholder="이메일"  class="form-control me-2" id="email" name="inputEmail_2" /><br>
						<input type="submit" id = "sendmail_pw" value="이메일 전송" class="form-control me-2" />
					</form>
			</div>	
	</div> <!-- id a -->
</div>
    
            
</body>
</html>