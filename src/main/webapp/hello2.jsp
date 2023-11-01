<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style type="text/css">

 @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&display=swap');

.wrapper {
  margin-top:270px;
  height: 70px;
  /*This part is important for centering*/
  display: grid;
  place-items: center;

}

.typing-demo {
  width: 22ch;
  animation: typing 2s steps(22), blink .5s step-end infinite alternate;
  white-space: nowrap;
  overflow: hidden;
  border-right: 3px solid;
  font-family: 'IBM Plex Sans KR', sans-serif,monospace;
  font-size: 5em;
  color: white;
 
}

@keyframes typing {
  from {
    width: 0
  }
  
}
    
@keyframes blink {
  50% {
    border-color: transparent
  }
}

.typing {
	background: #5eecfa;	
}

.box{
	width:100%;
	height: 700px;
}

.bor {
	border: 1px solid red;
}

img {
	margin:10px;
    margin-left: 500px;
  
 /* border: 1px solid red; */
}

#name {
/*  border: 1px solid green; */
   margin-top: 150px;
   margin-left: 1000px;
   font-size: xx-large;
   opacity: 0.8; 
   font-family: 'Black Han Sans', sans-serif;
   color: gray;  
}

span {
	width:70px;
	font-weight: 900;
	opacity: 1.0;
	animation : rotate 3s infinite alternate;
	 font-size: 50px;
}

@keyframes rotate {
from {color: pink;}
  to {color: yellow;}
}

</style>

<script type="text/javascript">
 $(document).ready(
		setInterval(function () {
		   $('img').fadeOut(0).fadeIn(5000).delay(2000).fadeOut(4000),1000
	})
		)

</script>

</head>
<body style="height: 300px;">
	<div class="wrapper typing">
    <div class="typing-demo ">
       안녕하세요! 조아라입니다 :)♥
    </div>
</div>
<div class="box">
</div>
</body>
</html>