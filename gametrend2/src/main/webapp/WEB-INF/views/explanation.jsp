<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>플랫폼소개 페이지</title>
	<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/index.css"/>
	<link rel="stylesheet" href="/css/chat.css"/>
	
	<script src="/js/chat.js"></script>
	<script src="/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#pc").on('click',()=>{
				$.ajax({
					url: "/explanation1a",
					type: 'get',
					success : function(list){
						$('.btn-wrapper li').removeClass('active');
						$("#pc").addClass('active');
						
						$('#pc-ex').css("display","block");
						$('#ps-ex').css("display","none");
						$('#xbox-ex').css("display","none");
						$('#ns-ex').css("display","none");
					}
				});
			});
			$("#ps").on('click',()=>{
				$.ajax({
					url: "/explanation1b",
					type: 'get',
					success : function(list){
						$('.btn-wrapper li').removeClass('active');
						$("#ps").addClass('active');
						
						$('#pc-ex').css("display","none");
						$('#ps-ex').css("display","block");
						$('#xbox-ex').css("display","none");
						$('#ns-ex').css("display","none");
					}
				});
			});
			$("#xbox").on('click',()=>{	
				$.ajax({
					url: "/explanation1c",
					type: 'get',
					success : function(list){
						$('.btn-wrapper li').removeClass('active');
						$("#xbox").addClass('active');
						
						$('#pc-ex').css("display","none");
						$('#ps-ex').css("display","none");
						$('#xbox-ex').css("display","block");
						$('#ns-ex').css("display","none");
					}
				});
			});
			$("#ns").on('click',()=>{
				$.ajax({
					url: "/explanation1c",
					type: 'get',
					success : function(list){
						$('.btn-wrapper li').removeClass('active');
						$("#ns").addClass('active');
						/* $("#ns.btn").css('color','white'); */
						
						$('#pc-ex').css("display","none");
						$('#ps-ex').css("display","none");
						$('#xbox-ex').css("display","none");
						$('#ns-ex').css("display","block");
					}
				});
			});
		});
	</script>
	
	<style>
	.line2 {
		text-align: center;
	}
	.line2:after {
        content: "";
        display: block;
		border: 1.5px solid rgba(0,0,0,10%); 
		width: 88%;
		height:0.1px;
		margin: 10vh auto 10vh;
	}
	.center-cnts { 
		width: 70%;
		margin: 0 auto;
		font-size: 1.1em;
	}
	.description{
		margin: 0 auto;
		text-align: left;
		width: 70%;
		line-height: 2;
	}
	.underline{
		display: inline;
	  	box-shadow: inset 0px -4px 0px 0px #c165dd;
	  	border-radius: 1px;
	  	font-size: 1.2em;
	}
	.btn-wrapper{
		display: inline-block;
		text-align: center;
		align-items: center;
		margin: 0 auto;
	}
	.btn input[type=submit]{
		background-color:transparent;  
		border:0px transparent solid; 
		margin: 0 0;
		text-align: center;
		color: #7244FE;
		font-weight: bold;
	}
	
	.btn-wrapper ul{
		padding-left:0;
		align-content: center;
	}
	.btn-wrapper li.btn{
		margin: 0 0.5vw;
		width: 18%;
	}
	.btn-wrapper li{
		float: none;
	}
	.btn-wrapper li.btn-outline-primary:hover input{
		color: white;
	}
	.btn-wrapper li.active .title{
		color: white;
	}
	.number{
    	font-size:1.5em;
		font-weight: bold;
		color: #7244FE;
		margin-right: 10px;
	}
	.ex{
		display: none;
	}
	
	</style>
	
</head>

<body>

	<!-- navbar -->
	<%@ include file="navbar.jsp" %>

	<!-- section 안에 본인 코드 옮겨넣기 -->
	<section style="margin-top:60px;">
	
		<div class="space" style="height:100px"></div> 
		
		<section id="section">
			<div class="col-lg-12 mainTitle d-flex">
				<input type="button" id="title" class="btn btn-primary btn-lg" value="게임기와 게임에 대하여" readolny />
			</div>	
			<div class="space" style="height:30px"></div>
		</section>
		
		<div class="line2 center-cnts"></div> 
		

		<!-- 기본 내용 : 컴퓨터와 콘솔 게임기 설명 -->
		<div class="center-cnts"> 
			<div class="description">
			<span class="underline"><b>컴퓨터 & 콘솔 게임기</b></span><br><br> 
			
				우리가 게임을 하려면 게임을 구동시킬 하드웨어와 게임에 해당하는 소프트웨어가 필요합니다. <br><br> 
		
				이 중, 전통적인 하드웨어 플랫폼의 대표적인 것 들에는, PC와 게임기가 있습니다. <br> 
				2022년 기준 전통적인 플랫폼들 외에도 모바일이 새로운 메인 하드웨어로 위치해 있으며, 클라우드 게이밍을 위한 대규모 서버 시스템이 신흥 강자로 떠오르고 있지만, 
				본 설명에서는 PC와 콘솔 게임기에 치중해서 설명합니다. <br><br> 
		
				PC는 개인용 다목적 컴퓨팅 장치로서, 게임 이외에도 여러가지 소프트웨어 프로그램을 실행시키는데 용이합니다. <br> 
				특히 이러한 범용성 때문에, 다양한 게임이 개발 및 발매되어 왔으며, MS사의 DOS OS부터 지금의 Windows OS하의 DirectX 기반 게임들까지 명맥이 이어져오고 있습니다. <br> 
				콘솔 게임기는 게이밍 전용 컴퓨팅 장치로서 게임을 구동시키는 것에 주목적을 두고 설계된 하드웨어이다. <br> 
				이 때문에, 전용 OS가 설치되어 있으며 하드웨어와 OS 모두 게임 실행 하나에 큰 초점을 두기 때문에, 성능을 집중시킬 수 있어 PC 대비 게임 개발 및 구동에 이점을 가진다. <br> 
				게임기는 과거 많은 콘솔 게임기 개발사가 있었지만, 현재에는 Nintendo와 Sony와 MS의 3사 경쟁 구도로 좁혀져있는 상황입니다. <br><br> 
		
				소프트웨어, 즉 게임은, 해당 소프트웨어를 구동시킬 메인 하드웨어를 기본값으로 상정하고 개발을 하여 해당 하드웨어에 우선적으로 출시하게 됩니다. <br> 
				메인 하드웨어 출시 이후 다른 하드웨어 기종으로 이식을 하지 않는 경우, 이는 해당 하드웨어 전용 게임 타이틀이 됩니다. <br> 
				반면, 메인 하드웨어 출시 이후 다른 하드웨어 기종으로 이식을 수행하는 경우, 이는 멀티 플랫폼(다기종 하드웨어) 사양 게임 타이틀이 됩니다. <br><br> 
		
				과거에는 메인 하드웨어에만 출시하거나, 메인 하드웨어 출시 이후에 다른 하드웨어 기종으로 이식 출시를 하는게 보편적이었습니다.<br>	
				그러나, 요즘에는 출시 초기부터 멀티 플랫폼으로 개발을 시작하여 출시까지 이어지는 경우가 대부분입니다. <br>
				다만, 멀티 플랫폼 게임들 외에도 여전히 메인 하드웨어 전용 타이틀들이 출시되고 있으며, 이는 콘솔 게임기를 구매하게 하는 가장 큰 주요 원인 중 하나로 매김하고 있습니다. <br>
				즉, 특정 콘솔 게임기에서만 플레이 할 수 있는 게임들이 있기에 PC에서 멀티 플랫폼 게임들을 할 수 있음에도 불구하고, 여전히 콘솔 게임기의 인기와 수요가 유지되어 왔다고 할 수 있습니다. <br><br> 
				최근에는 이러한 독점작들의 경계가 더욱 흐릿하여 졌지만, 독점작 이외에도 편의성 등의 부가 이유들로 인하여, 한동안 콘솔 게임기의 명맥은 더 이어질 것으로 사료됩니다.<br>
				또한, 각 플랫폼별로 출시되는 게임들은 특성에 차이가 있습니다. <br> 
				이는, 플랫폼 자체의 특성 및 게임 강국 일본과 미국의 여러 환경에 차이로부터 발생하는 결과들입니다. <br>
				아래에서 각 플랫폼별 세부 설명 및 특성에 대해서 다루겠습니다. 
				
			</div>
		</div>
		
		<div class="line2 center-cnts second-line"></div> 
		<div class="center-cnts btn-wrapper d-flex" style="margin:0 auto;">
			<ul>
				<li id="pc" class="btn btn-outline-primary md-3">
					<input type="submit" class="title" value="PC와 PC 게임은?" style="font-size:1.0em;" readolny />
					
				</li>
				
				<li id="ps" class="btn btn-outline-primary md-3" > 
					<input type="submit"  class="title" value="PS와 PS 게임은?" style="font-size:1.0em;" readolny />
				</li>
				
				<li id="xbox" class="btn btn-outline-primary md-3" > 
					<input type="submit"  class="title" value="Xbox와 Xbox 게임은?" style="font-size:1.0em;" readolny />
				</li>
				
				<li id="ns" class="btn btn-outline-primary md-3">  
					<input type="submit" class="title" value="NS와 NS 게임은?" style="font-size:1.0em;" readolny /> 
				</li>
			 </ul>
		</div>

		<div class="space" style="height:80px"></div> 

		<!-- 추가 내용 : 각 플랫폼별 세부 설명 및 특성 --> 
		<!-- 페이지 포함 -->
		
		<div class="center-cnts"> 
			<div class="description"> 
				<div class="ex" id="pc-ex">
					<%@ include file="explanationP1.jspf" %>
				</div>
			
		
			
				<div class="ex" id="ps-ex">
					<%@ include file="explanationP2.jspf" %>  
				</div>
			
		
			
				<div class="ex" id="xbox-ex">
				<%@ include file="explanationP3.jspf" %>  
				</div>
			
	
			
				<div class="ex" id="ns-ex">
					<%@ include file="explanationP4.jspf" %>  
				</div>
			</div>
		</div> 
	

	</section>
	
	<div class="space" style="height:100px"></div> 

	<!-- footer -->
	<%@ include file="footer.jsp" %>
	<%@ include file="chatbottest.jsp" %>
	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script> -->
	
</body>

</html>
