<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/css/cal.css" rel="stylesheet"/>
<script src="/jquery-3.6.0.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
<script type="text/javascript">
var CDate = new Date(); 
var today = new Date();
var selectCk = 0;

var buildcalendar = function(){
	var htmlDates = ''; 
	var prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
	var thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
	var thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
	document.querySelector(".year").innerHTML = CDate.getFullYear() + "년";  // year에 년도 출력
	document.querySelector(".month").innerHTML = (CDate.getMonth() + 1) + "월";  //month에 월 출력
	const dates = []; 
	if(thisFirst.getDay()!=0){ 
		for(var i = 0; i < thisFirst.getDay(); i++){
			dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
		} 
	} 
	for(var i = 1; i <= thisLast.getDate(); i++){
			 dates.push(i); // 이번 달 날짜 채우기 
	} 
	for(var i = 1; i <= 13 - thisLast.getDay(); i++){ 
			 dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
	} 
	
	for(var i = 0; i < 42; i++){
		if(i < thisFirst.getDay()){
			htmlDates += '<div class="date last">'+dates[i]+'</div>'; 
		}else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
			 htmlDates += '<div id="date_'+dates[i]+'" class="date today" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		}else if(i >= thisFirst.getDay() + thisLast.getDate()){
			 htmlDates += '<div class="date next">'+dates[i]+'</div>'; 
		}else{
			htmlDates += '<div id="date_'+dates[i]+'" class="date" onclick="fn_selectDate('+dates[i]+');">'+dates[i]+'</div>'; 
		}
	 } 
document.querySelector(".dates").innerHTML = htmlDates; 
} 

function prevCal(){
	 CDate.setMonth(CDate.getMonth()-1); 
	 buildcalendar(); 
} 
function nextCal(){
	 CDate.setMonth(CDate.getMonth()+1);
	 buildcalendar(); 
}

function fn_selectDate(date){
	
	var year = CDate.getFullYear();
	var month = CDate.getMonth() + 1;
	var date_txt = "";
	if(CDate.getMonth + 1 < 10){
		month = "0" + (CDate.getMonth() + 1);
	}
	if(date < 10){
		date_txt = "0" + date;
	}
	
	if(selectCk == 0){
		$(".date").css("background-color", "");
		$(".date").css("color", "");
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");
		
		$("#period_1").val(year+"-"+month+"-"+date);
		$("#period_2").val("");
		selectCk = date;
	}else{
		$("#date_"+date).css("background-color", "red");
		$("#date_"+date).css("color", "white");		
		for(var i = selectCk + 1 ; i < date ; i++){
			$("#date_"+i).css("background-color", "#FFDDDD");
		}
		
		$("#period_2").val(year+"-"+month+"-"+date);
		selectCk = 0;
	}
	
}

buildcalendar();
</script>

<title>테스트 페이지</title>
</head>

<body>

	설명 페이지로 이동할 거임 <br><br> 
	
	<input type="button" name="movetoexpla" value="설명 페이지로 이동(onclick)" onClick="location.href= 'http://localhost:8081/explanation' " /> 
	<br>
	<br>
	
	<form method="POST" action="/explanation1a" > 
		<input type="hidden" name="thisis" value="PC" /> 
		<input type="submit" name="loadbtnA" value="설명 페이지로 이동(POST)" />  
	</form>
	<br> 
	<br>
	
			현재 플랫폼 변수 테스트 1: ${flatExpla} <br> 
			현재 플랫폼 변수 테스트 2 : <c:out value='${flatExpla}'/> <br>
			<br>  
	
	<form method="POST" action="/promotion" > 
		<input type="submit" name="movebtnA" value="할인 페이지로 이동(POST)" />  
	</form>
	<br> 
	<br> 
	
	<form method="POST" action="/calendar" > 
		<input type="submit" name="movebtnB" value="달력 페이지로 이동(POST)" />  
	</form>
	<br> 
	<br> 
	
	<!-- 달력 테스트 -->
	<br> 
	
	<div class="calendar">
	
	<div class="header">
		<button class="calendar_btn" onclick="prevCal();">&lt;</button>
		<div class="title"><span class="year"></span><span class="month"></span></div>
		<button class="calendar_btn" onclick="nextCal();">&gt;</button>
	</div>
	
	<div class="day">
		<div>S</div>
		<div>M</div>
		<div>T</div>
		<div>W</div>
		<div>T</div>
		<div>F</div>
		<div>S</div>
	</div>
	
	<div class="dates"></div>
	
	</div>
	
	<input type="text" id="period_1"> ~ <input type="text" id="period_2"> 

	<br> 

</body>

</html>