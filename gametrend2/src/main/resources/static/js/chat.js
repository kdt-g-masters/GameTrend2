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
			if(kindQ == "myplatform" | kindQ ==  "genre"){
				$.ajax({
					url : "/chatbot",
					data : {"request": $(this).html(), "event":"입력"}, //request: 인사/생활습관병/식재료/맞춤/후기
					type : "get",
					dataType : "json",
					success : function(serverdata){
						parser(serverdata);
						$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
						//"내가 가진 플랫폼" 선택시
						if (kindQ == "myplatform"){
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
											var selectedPlatform = $(this).text();
											$.ajax({
												url: "/selectplatform",
												type: 'get',
												data: {"platform": selectedPlatform},
												success : function(genrelist){
													$("#record").append("<div class='answer'>[" + selectedPlatform + "]에 포함된 장르들이에요.<br>이 중 어떤 장르의 게임추천을 원하시나요?</div>");
													var textlist = "<div class='list-wrap genre-li'>";
													for(var i = 0 ; i < genrelist.length; i++){
														textlist += "<div class='link'>" + genrelist[i] +"</div>";
													}
													$("#record").append(textlist + "</div>");
													$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
													/*장르 선택 시 해당 장르 Top3게임 추천*/
													$(".genre-li .link").on('click',function(){
														var genre = $(this).text();
														rcmBasedOnPlatform(selectedPlatform,genre);
													});
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
											recommendGame(genre);
										});
									} // success function
							});
							
						}
					}
				});
			}
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
	function genreList(genrelist){
		console.log(genrelist);
		var textlist = "<div class='list-wrap genre-li'>";
		for(var i = 0 ; i < genrelist.length; i++){
			textlist += "<div class='link'>" + genrelist[i] +"</div>";
		}
		$("#record").append(textlist + "</div>");
		$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
		
		/*장르 선택 시 해당 장르 Top3게임 추천*/
		$(".genre-li .link").on('click',function(){
			var genre = $(this).text();
			recommendGame(genre);
		});
	}
	
	function recommendGame(genre){
		$("#record").append("<div class='question'>" + genre +"</div>");
			$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
			$.ajax({
				url : "/recommendgame4",
				data : {"genre": genre}, //request: 인사/생활습관병/식재료/맞춤/후기
				type : "post",
				success : function(gamelist){
					$("#record").append("<div class='answer'>[" + genre + "] 장르 TOP" + gamelist.length + " 게임 추천</div>");
					var textanswer = "<div class='topgame-wrapper'><ul class='topgames'>"; 
					
					for(var i = 0; i < gamelist.length; i++){
						textanswer += "<li class='card topgame'>"
							+"<img class='card-img-top' src='/images/thumbnail/" + gamelist[i].thumbnail+"' alt='"+gamelist[i].name
							+"'><div class='card-body'><h5 class='card-title topgame-name'>"+gamelist[i].name
							+"</h5><a href='/gamedetail?no="+gamelist[i].no+"' class='btn btn-primary'>자세히 보기</a></div></li>"; 
					}
					textanswer += "</ul></div><div class='include-control'><div class='controls'><span class='prev'>"
						+"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-arrow-left-circle' viewBox='0 0 16 16'>"
						+"<path fill-rule='evenodd' d='M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z'/>"
					    +"</svg></span><span class='next'>"
			    		+"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-arrow-right-circle' viewBox='0 0 16 16'>"
						+"<path fill-rule='evenodd' d='M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z'/>"
						+"</svg></span></div></div>";
					$("#record").append(textanswer);
					$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
				}
			});//ajax end
	}
	function rcmBasedOnPlatform(selectedPlatform, genre){
		$("#record").append("<div class='question'>" + genre +"</div>");
			$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
			$.ajax({
				url : "/recommendgame3",
				data : {"platform": selectedPlatform, "genre": genre}, //request: 인사/생활습관병/식재료/맞춤/후기
				type : "post",
				success : function(gamelist){
					$("#record").append("<div class='answer'>[" + genre + "] 장르 TOP" + gamelist.length + " 게임 추천</div>");
					var textanswer = "<div class='topgame-wrapper'><ul class='topgames'>"; 
					
					for(var i = 0; i < gamelist.length; i++){
						textanswer += "<li class='card topgame'>"
							+"<img class='card-img-top' src='/images/thumbnail/" + gamelist[i].thumbnail+"' alt='"+gamelist[i].name
							+"'><div class='card-body'><h5 class='card-title topgame-name'>"+gamelist[i].name
							+"</h5><a href='/gamedetail?no="+gamelist[i].no+"' class='btn btn-primary'>자세히 보기</a></div></li>"; 
					}
					textanswer += "</ul></div><div class='chat-include-control'><div class='chat-controls'><span class='prev'>"
						+"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-arrow-left-circle' viewBox='0 0 16 16'>"
						+"<path fill-rule='evenodd' d='M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z'/>"
					    +"</svg></span><span class='next'>"
			    		+"<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-arrow-right-circle' viewBox='0 0 16 16'>"
						+"<path fill-rule='evenodd' d='M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z'/>"
						+"</svg></span></div></div>";
					$("#record").append(textanswer);
					$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
				}
			});//ajax end
	}
	 function basedOnReview(memberid){
		 if(memberid == "null"){
			$("#record").append("<div class='answer'>로그인이 필요해요. 로그인하러 가볼까요? </div><div class='link-group'><div class='link'><a href='/login'>로그인하러 가기</a></div></div>");
			$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
		}
		else{
			$.ajax({
				url : "/chatmyreview",
				type : 'get',
				data : {"member_id" : memberid},
				success : function(reviewlist){
					console.log(reviewlist);
					if(reviewlist.length == 0){
						$("#record").append("<div class='answer'>["+ memberid +"]님 아직 리뷰를 작성하지 않으셨군요?<br>인기게임순위에서 리뷰를 작성해보세요.</div>");
						$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
					}
					else{
						var approveReview = 0;
						for(var i in reviewlist){
							approveReview += reviewlist[i].approve;
						}
						console.log(approveReview);
						if(approveReview == 0){
							$("#record").append("<div class='answer'>["+ memberid +"]님의 리뷰가 아직 승인되지 않았어요. 조금만 기다리시면 곧 승인여부를 알려드릴께요.</div>");
							$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
						}
						else{
							$("#record").append("<div class='answer'>["+ memberid +"]님의 리뷰리스트에 포함된 게임들의 장르에요.<br>이 중 가장 좋아하는 장르는 무엇인가요?</div>");
							$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
							$.ajax({
								url : "/genreOfReviewlist",
								type : 'get',
								data : {"member_id" : memberid},
								success : function(genrelist){
									genreList(genrelist);
									
								} //success
							}); //ajax
						} //else
					} //else
				} //success
			}); //ajax
		} //else
	 }
	 function basedOnWishlist(memberid){
		if(memberid == "null"){
			$("#record").append("<div class='answer'>로그인이 필요해요. 로그인하러 가볼까요? </div><div class='link-group'><div class='link'><a href='/login'>로그인하러 가기</a></div></div>");
			$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
		}
		else{
			$.ajax({
				url : "/chatmywishlist",
				type : 'get',
				data : {"member_id" : memberid},
				success : function(wishlist){
					console.log(wishlist);
					if(wishlist.length == 0){
						$("#record").append("<div class='answer'>["+ memberid +"]님의 위시리스트가 없어요ㅠㅠ <br>인기게임순위에서 ♡를 눌러 위시리스트를 추가해보세요.</div>");
						$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
					}
					else{
						$("#record").append("<div class='answer'>["+ memberid +"]님의 위시리스트에 포함된 게임들의 장르에요.<br>장르 하나를 선택하면 게임을 추천해드릴께요.</div>");
						$("#record-box").scrollTop($("#record-box")[0].scrollHeight);
						$.ajax({
							url : "/genreOfWishlist",
							type : 'get',
							data : {"member_id" : memberid},
							success : function(genrelist){
								genreList(genrelist);
								
							} //success
						}); //ajax
					} // else
				} //success
			});
		}
	}
	