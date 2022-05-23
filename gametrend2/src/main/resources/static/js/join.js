/**
 * 회원가입
 */
var code = "";	
$(document).ready(function() {
	
	//메일로 인증번호 보내자
		$("#btnCerti").on('click', function() {
			var mail = $("#email").val(); //사용자의 이메일 입력값. 
			var cehckBox = $(".mail_check_input");// 인증번호 입력란
		    var boxWrap = $(".mail_check_input_box");  
			
			if (mail == "") {
				alert("메일 주소가 입력되지 않았습니다.");
			} 
			else {
				$.ajax({
					type : 'post',
					dataType :'json',
					url : '/join.do',
					data : {"mail" : mail},
					success:function(data){
			            
			            //console.log("data : " + data);
						cehckBox.attr("disabled",false);
			            boxWrap.attr("id", "mail_check_input_box_true");
			            code = data;			            
			        }
				});
				alert("인증번호가 메일로 전송되었습니다."); 

			}
	});
 		
		$(".mail_check_input").blur(function(){
		    var inputCode = $(".mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과   
		    
		    if(inputCode == code){                           
		        checkResult.html("인증되셨습니다.");
		        checkResult.attr("class", "correct");        
		    } else {                                 
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		    }    
		    
		});
	
	// 회원가입 아이디 중복
	
	var joinAvailable = false;
	$("#btnCheckId").on('click', function() {
		$.ajax({
			url: '/join/checkid',
			data: {'id': $("#inputMemberId").val()},
			type: 'post',
			dataType: 'json',
			success: function(r) {
				$("#resultModal").html(r.result);
				if (r.state == "available") {
					$("#idAvailable").css("display", "inline");
					$("#idNotAvailable").css("display", "none");
					joinAvailable = true;
				}
				else {
					$("#idAvailable").css("display", "none");
					$("#idNotAvailable").css("display", "inline");
					joinAvailable = false;
				}				
			} // success end
		}); // ajax end
	}); // on end
	
	$("#password_1").focusout(function() {
		if ($("#password_1").val() == $("#password").val()) {
			$("#pwAvailable").css("display", "inline");
			$("#pwNotAvailable").css("display", "none");
			joinAvailable = true;
		}
		else {
			$("#pwAvailable").css("display", "none");
			$("#pwNotAvailable").css("display", "inline");
			joinAvailable = false;
		}
	});
	$("#password").focusout(function() {
		if ($("#password_1").val() == $("#password").val()) {
			$("#pwAvailable").css("display", "inline");
			$("#pwNotAvailable").css("display", "none");
			joinAvailable = true;
		}
		else {
			$("#pwAvailable").css("display", "none");
			$("#pwNotAvailable").css("display", "inline");
			joinAvailable = false;
		}
	});
	
	$("form").on('submit', pass);
	function pass(e) {
		if (joinAvailable == false) {
			alert("아이디 또는 비밀번호 조건을 확인해주세요.");
			e.preventDefault();
		}
		if($("#password").val().length < 5 || $("#password").val().length > 10){
			alert("패스워드 형식을 다시 확인해주세요.");
			e.preventDefault();
		}
		if(!$("#name").val().match(/[A-Z가-힣]+/)) {
			alert("이름 형식을 다시 확인해주세요.");
			e.preventDefault();
		}
/*
		if(!$("#phone").val().match(/^010[0-9]{3,4}[0-9]{4}$/)) {
			alert("전화번호 형식을 확인해주세요.");
			e.preventDefault();
		}	
*/		
		if($(".mail_check_input").val() != code){
			alert("인증번호를 다시 확인해 주세요.");
			e.preventDefault();
		}
		
		if($("#btnConfirm").attr("disabled")){
			alert("인증번호를 입력해 주세요.");
			e.preventDefault();
		}
				
	}
	
	//인증번호 일치 여부
	$(".mail_check_input").blur(function(){
		    var inputCode = $(".mail_check_input").val();        // 입력코드    
		    var checkResult = $("#mail_check_input_box_warn");    // 비교 결과   
		    
		    if(inputCode == code){                           
		        checkResult.html("인증되셨습니다.");
		        checkResult.attr("class", "correct");        
		    } else {                                 
		        checkResult.html("인증번호를 다시 확인해주세요.");
		        checkResult.attr("class", "incorrect");
		    }    
		    
		});
}); // ready end