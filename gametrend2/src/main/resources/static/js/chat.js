/*chatbot.js */

 $(document).ready(function() {	
		/*챗봇 버튼 클릭 시 웰컴 메세지 출력*/
		$(".floating-button").click( function(){
			$("#ch-window").fadeToggle();
			$.ajax({
				url : "/chatbot",
				data : {"request": "", "event":"대화시작"}, //입력,대화시작 
				type : "get",
				dataType : "json",
				success : function(serverdata){
					$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
					parser(serverdata)
				}//function end
			});// ajax end
				
			$("#close").on('click',function(){
				$("#ch-window").fadeOut();
			});
		});
		/*초기 리스트 선택시*/
		$(".initialQuestionList span").on('click',function(){
			$("#record").append("<div class='question'>" + $(this).text() + "</div>");	//선택한 것출력
			
			/*초기 리스트*/
			var kindQ =  $(this).attr("id");
			var login =  '<%=String.valueOf(session.getAttribute("sessionid"))%>';
			$.ajax({
				url : "/chatbot",
				data : {"request": $(this).html(), "event":"입력"}, //request: 인사/생활습관병/식재료/맞춤/후기
				type : "get",
				dataType : "json",
				success : function(serverdata){
					parser(serverdata);
					$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
					//내가 가진 플랫폼 선택시
					if (kindQ == "platform"){
						$.ajax({
								url : "/chatplatform",
								type : 'get',
								success : function(list){
									$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
									var textlist = "<div class='list-wrap platform-li'>";
									for(var i = 0 ; i < list.length; i++){
										textlist += "<div class='link'>" + list[i] +"</div>";
									}
									$("#record").append(textlist + "</div>");
									$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
									/*플랫폼 종류 중 하나를 선택하면*/
									$(".platform-li .link").on('click',function(){
										$("#record").append("<div class='question'>" + $(this).text() + "</div>");
										var selected = $(this).text();
										$.ajax({
											url: "/selectplatform",
											type: 'get',
											data: {"platform": selected},
											success : function(genrelist){
												$("#record").append("<div class='answer'>[" + selected + "]에 포함된 장르들이에요.<br>이 중 어떤 장르의 게임추천을 원하시나요?</div>");
												var textlist = "<div class='list-wrap genre-li'>";
												for(var i = 0 ; i < genrelist.length; i++){
													textlist += "<div class='link'>" + genrelist[i] +"</div>";
												}
												$("#record").append(textlist + "</div>");
												$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
											}
										})
									});
								} // success function
							}); // ajax
					}
					//"내가 선택한 장르" 선택시
					else if(kindQ == "genre"){
						$.ajax({
							url : "/chatgenre",
							type : 'get',
							success : function(list){
									var textlist = "<div class='list-wrap genre-li'>";
									for(var i = 0 ; i < list.length; i++){
										textlist += "<div class='link'>" + list[i] +"</div>";
									}
									$("#record").append(textlist + "</div>");
									$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
									/*장르 선택 시 해당 장르 Top3게임 추천*/
									$(".genre-li .link").on('click',function(){
										var genre = $(this).text();
										$("#record").append("<div class='question'>" + genre +"</div>");
										$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
										$.ajax({
											url : "/recommendgame",
											data : {"genre": genre}, //request: 인사/생활습관병/식재료/맞춤/후기
											type : "post",
											success : function(gamelist){
												$("#record").append("<div class='answer'>[" + genre + "] 장르 Top" + gamelist.length + " 게임 추천</div>");
												$("#record").append("<div class='list-wrap'>");
												for(var i = 0; i < gamelist.length; i++){
													$("#record").append("<div class='link topgame'><div class='topgame-name'><b>"+ gamelist[i].name 
													+ "</b></div><br><div class='topgame-img'><img src='/images/thumbnail/" + gamelist[i].thumbnail
													+"'/></div><br><a href='/gamedetail?no="+gamelist[i].no+"'>자세히 보기 ▷</a></div>");
												}
												$("#record").append("</div>");
												$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
											}
										});//ajax end
									});
								} // success function
						});
						
					}
					
					//나의 위시리스트 선택시
					else if(kindQ == "mywishlist"){
						if(!login){
							$("#record").append("<div class='answer'>로그인이 필요해요. 로그인하러 가볼까요? </div><div class='link'><a href='login'>로그인</a></div>");
						}
						else{
							$.ajax({
								url : "/chatmywishlist",
								type : 'get',
								data : {"memberid" : sessionid},
								
								success : function(list){
										
										var textlist = "<div class='list-wrap genre-li'>";
										for(var i = 0 ; i < list.length; i++){
											textlist += "<div class='link'>" + list[i] +"</div>";
										}
										$("#record").append(textlist + "</div>");
										$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
									} // success function
								
							});
						}
					}
					//내가 쓴 리뷰 선택시
					else if(kindQ == "mywishlist"){
						
					}

				}
			});//ajax end
		});  //li end
		
		//---입력 클릭시 
		$(".ch-bnt").on('click', function(){
			if($("#request").val() != ""){
				$("#record").append("<div class='question'>" + $("#request").val() + "</div>");	//질문출력
			}
			$.ajax({
				url : "/chatbot",
				data : {"request": $("#request").val(), "event":$(this).val()}, //입력,대화시작 
				type : "get",
				dataType : "json",
				success : function(serverdata){
					parser(serverdata)
					$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
					$("li").on('click',function(){
						console.log($(this).text());
						$("#record").append("<div class='question'>" + $(this).html() + "</div>");	//선택한 것출력
						$.ajax({
							url : "/chatbot",
							data : {"request": $(this).html(), "event":"입력"}, //request: 인사/생활습관병/식재료/맞춤/후기
							type : "post",
							dataType : "json",
							success : function(serverdata){
								parser(serverdata);
								$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
									$("li").on('click',function(){
										console.log($(this).text());
										$("#record").append("<div class='question'>" + $(this).html() + "</div>");	//선택한 것출력
										$.ajax({
											url : "/chatbot",
											data : {"request": $(this).html(), "event":"입력"}, //request: 인사/생활습관병/식재료/맞춤/후기
											type : "get",
											dataType : "json",
											success : function(serverdata){
												parser(serverdata);
												$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
												}
										});//ajax end
									});//li end
								}
						});//ajax end
					});//function end
				}
			});// ajax end
			$("#request").val(""); // 질문창 리셋
		}); // .ch-input input:button end
		
	}); //ready onclick
		
	function parser(serverdata){ // 값을 보냈을 때 화면에서 바뀌는 부분
		var bubbles = serverdata.bubbles;
		for(var b in bubbles){
			if(bubbles[b].type == "text"){ //기본답변일때
				var textanswer = "<div class='answer'>" + bubbles[b].data.description +"</div>"; 
				$("#record").append(textanswer);
			}
			else if(bubbles[b].type == "template"){
				if(bubbles[b].data.cover.type == "text"){ //멀티링크, 객관식 답변일때
					var textanswer ="<div class='answer'>" + bubbles[b].data.cover.data.description + "</div>";
					$("#record").append(textanswer);
				}
				var contentTable = bubbles[b].data.contentTable;	
				var addlink = "<ul class='link-group'>";//"<div class='link-group'>";
				for(var c in contentTable){
					for(var d in contentTable[c]){
						var text = contentTable[c][d].data.title;
						if( contentTable[c][d].data.data.action.type == "link" ) {
							addlink += "<li class='link'><a href='" + contentTable[c][d].data.data.action.data.url + "'>" +
									text + "</a></li>"	
						}
						else  {
							addlink += "<li class='link'>"+ text + "</li>" ;
						}
						//링크 있을때의 JSON 추출하기(맞춤정보, 후기정보)
					}
				}	
				$("#record").append(addlink+"</ul>");
			}
		}
		
		if(serverdata.quickButtons){
			var quickbnts = serverdata.quickButtons;	
			var quickbnt = "<ul class='link-group'>";
			for(var b in quickbnts){
				quickbnt += "<li class='link' >"+ quickbnts[b].title +"</li>";
			}
			$("#record").append(quickbnt+"</ul>");
		}
	} 