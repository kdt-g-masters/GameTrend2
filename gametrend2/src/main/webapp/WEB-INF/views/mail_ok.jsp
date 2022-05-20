<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//jquery code
	});
</script>

<script type="text/javascript">

<%
String flag = (String)request.getAttribute("auth");
System.out.println( flag );
if( flag == "1") {
	out.println("alert('메일이 전송되었습니다.');");
	out.println("location.href='/login';");
} else if(flag == "0") {
	out.println("alert('아이디 또는 이메일 주소를 다시 확인해 주십시오.');");
	out.println("location.href='/login2';");
}
%>


</script>

</head>
<body>

</body>
</html>