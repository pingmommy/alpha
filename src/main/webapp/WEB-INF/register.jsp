<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<style type="text/css">


section {
	display: flex;
	justify-content: center;
	
}

 .input_box {
	margin: 50px;
	width: 700px;
	
}

.input_box > .first {
	background: transparent;
	border: none;
	border-bottom: 3px solid gray;
	padding: 20px 10px;
	font-size: 20px;
	width: 100%
}


.box{
  border-radius: 15px;
  background: #ff9bc1;
  width: 60%;
  margin: 10px auto;
  padding: 15px 0px;
  text-align: center;
}


.box:hover{
  border-radius: 15px;
  background: gray;
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

<script type="text/javascript">
window.onload = function(){

submit.onclick = function(){
	alert("가입을 축하드립니다!");
}
}
</script>
</head>
<body>
<h1 style="text-align: center; margin-top: 100px;">SIGN IN</h1>
<section>
<form action="/signup" method="post">
<div class="input_box">
			<input id="id" name="id" placeholder="아이디" class="first"/>
		</div>
		
		<div class="input_box">
			<input id="pw" type="password"  name="password" placeholder="비밀번호" class="first"/>
	    </div>
		
		<div class="input_box box">
			<input id="submit" type="submit" value="SIGNIN" class="in" />
		 </div>
</form>
</section>
</body>
</html>