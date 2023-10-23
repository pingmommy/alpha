<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cube4.jsp</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">

body {

	height: 1000px;
}

.perspective {
/* 	 border: 20px dashed plum;
 */	 display: inline-block;
	 margin: 200px 0px 0px 200px;
	
 	perspective: 500px;
 
	
}

.cube {
	/* border: 10px dotted gray; */
	display: inline-block;
	transform-style: preserve-3d;
	
	animation : rotate 10s infinite linear;
	
	/* transform: rotateX(45deg); */
}

.base {
	/* border: 2px solid pink; */
	width:200px;
	height: 200px;
	/* background: pink; */
	text-align: center;
	font-size: 1em;
	line-height: 200px;	
	
}

.front,.back,.left,.right,.top,.bottom {
	position: absolute;
	top:0px;
	left:0px; 
	opacity:0.5;
	box-shadow: 0px 0px 50px 10px gray;
}

.front {

	transform: translateZ(100px);
	background: lightpink;
}

.back {

	transform: rotateY(180deg) translateZ(100px);
	background: lightgray;
}

.left {
	transform: rotateY(-90deg) translateZ(100px);
	background: lightsalmon;
	
}

.right {
	transform: rotateY(90deg) translateZ(100px);
	background: plum;
	
}

.top {
	transform: rotateX(90deg) translateZ(100px);	
}

.bottom {
	transform: rotateX(-90deg) translateZ(100px);	
}

@keyframes rotate {
	from {
		transform: rotateX(0deg) rotateY(360deg) rotateZ(0deg);
	}
	
	to {
		transform: rotateX(360deg) rotateY(0deg) rotateZ(360deg);	
	}
}


</style>
</head>
<body class="white">
<h1 class="text_center t_green">CSS 3D 응용 큐브 만들기</h1>

<section class="perspective">
	<article class="cube">
		<div class="base"></div>	
		<div class="base front"></div>	
		<div class="base back"></div>	
		<div class="base left"></div>	
		<div class="base right"></div>	
		<div class="base top"></div>	
		<div class="base bottom"></div>	
	</article>
</section>
</body>
</html>