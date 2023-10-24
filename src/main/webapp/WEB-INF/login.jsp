<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">


section {
	display: flex;
	justify-content: center;
	
}

 .input_box {
	position: relative;
	margin: 50px;
	width: 700px;
	
}

.input_box > .first {
	background: transparent;
	border: none;
	border-bottom: 3px solid red;
	padding: 20px 10px;
	font-size: 20px;
	width: 100%
}


.box{
  border-radius: 15px;
  background: lightpink;
  width: 60%;
  margin: 10px auto;
  padding: 15px 0px;
  text-align: center;
}

.in{
	 font-size: 1.2em;
	 background: transparent;
	 outline: none;
	 border: none;
	 color: white;
}
 
 .error {
  	font-weight: bold;
  	color: purple;
  	text-align: center;
  	font-size: 1.5em;
  	padding: 0.5em; 
 }
 

</style>

<title>login</title>
</head>
<body>
<h1>LOGIN</h1>
<hr>
<c:if test="${param.error==''}">
	<div class="error">사용자 ID 또는 비밀번호를 확인해주세요.</div>
</c:if>
<section>


<form action="/login" method="post">
		<div class="input_box">
		
		<input id="id" name="username" placeholder="아이디" class="first"/>
		</div>
		
		<div class="input_box">
	    
		<input id="pw" type="password"  name="password" placeholder="비밀번호" class="first"/>
	    </div>
		
		<div class="input_box box">
		<input type="submit" value="LOGIN" class="in" />
		 </div>

</form>
</section>

</body>
</html>