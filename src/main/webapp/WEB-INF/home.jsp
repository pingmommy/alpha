<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/webjars/jquery/jquery.js"></script>
<title>HELLO</title>
<link rel="icon" type="image/png" href="/favicon.png"/>
<link rel="stylesheet" href="/css/cube.css">
<style type="text/css">

 @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap');


html{
	background: #5eecfa;
	
}

nav {

 	height: 150px;
 	width: 100%;
 	background: #5eecfa;
 	position: fixed;
 }

ul{
/*   border: 2px solid red; */  
margin-top: 30px;
  
}

ol{
/*  border: 2px solid blue; */
 }

li{
 /*  border: 2px solid green; */
 }

li>div {
 /* border: 4px dotted gray; */
 
}

/* <a>태그는 인라인태그임. */
/* li>a {
/*  border: 4px dotted purple; 
 padding: 5px;
 display: inline-block;
 font-size: 15px;
  text-decoration: none;
  color: black;
 
} */


.menu-title {
 	padding: 15px 10px;
 	font-size: 35px;
 	/* font-weight: bold; */
 	color: white;
 	font-family: 'IBM Plex Sans KR', sans-serif;
 	 	
}

/* .menu-title:hover + .sub-menu {
	display: block;
} 글자를 벗어나면 다시 하위 메뉴가 사라져서 선택할 수 없다. */



.menu {
	display: flex;
	list-style: none;
	align-items:flex-start;
	position: fixed;
	width: 100%;
	top:10px;
	left: 10px;
}

/* login만 왼쪽으로 따로 떨어지게 레이아웃을 짰는데, fixed를 주었더니 계획했던 레이아웃이 적용되지 않았다. fixed는 문서를 벗어나서 절대적으로 고정되는 것을 
의미하기 때문에 고정되는 화면의 크기를 지정해주어야 한다. 그래서 width:80%를 주었다. */

.menu-item {
	/* float: left; ->예전에는 수평메뉴를 만들 때 float으로 했다.*/
	width: 230px;
	/* min width: 200px; */
	flex-shrink: 0;
 	text-align: center; 
 	background: #5eecfa;	
}
.menu-item:hover> .menu-title {
	font-weight: bold;
  	color: black;

}

.menu-item:hover> .sub-menu {
	max-height: 500px;
	transition: max-height 2s;
}


.menu-item:last-child {
	margin-left:auto;
	margin-right:10px;
}

.sub-menu {
	max-height:0px;
	overflow:hidden;
	list-style: none;
	padding-left: 0px;

}


.sub-item{

}

.sub-item:hover >a{

  font-weight: bold;
  color: black;
  text-shadow: 5px 5px 3px white;
}

.sub-item > a {
	display: block;
	padding: 10px;
	font-size: 20pt;
	text-decoration: none;
	color: white;
}

iframe {
 margin: 200px auto;
}

</style>

<script type="text/javascript">

function resize(){
	
	iframe = document.querySelector('iframe');
	iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
	
}

/* window.onload = () => {
	setInterval(resize,100);
} */

$(document).ready(function(){
	setInterval(resize,100);
});

</script>
</head>
<body>
<!-- nav에서 높이를 주고 넓이는 100% 배경색을 화이트로 하면 뒤가 안 보임.   -->
<nav>
<ul class="menu">
	<li style="padding: 0px 20px;">	
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
	</li>
	<li class="menu-item">
		<div class="menu-title">ALPHA</div>
		<ol class="sub-menu">
			<li class="sub-item"><a target="content" href="/alpha/fill">fill</a></li>
			<li class="sub-item"><a target="content" href="/alpha/cross">cross</a></li>
			<li class="sub-item"><a target="content" href="/alpha/race">race</a></li>
			<li class="sub-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
			<li class="sub-item"><a target="content" href="/earthworm.jsp">earthworm</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">ANIMATION</div>
		<ol class="sub-menu">
			<li class="sub-item"> <a target="content" href="/ani/fill"">ani_fill</a></li>
			<li class="sub-item"> <a target="content" href="/ani/cross"">ani_cross</a></li>
			<li class="sub-item"> <a target="content" href="/cube.jsp"">cube</a></li>
			<li class="sub-item"> <a target="content" href="/placeholder.jsp"">placeholder</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">REACT</div>
		<ol class="sub-menu">
			<li class="sub-item"><a target="content" href="/fill.jsp">fill</a></li>
			<li class="sub-item"><a target="content" href="/cross.jsp">cross</a></li>
			<li class="sub-item"><a target="content" href="/sort.jsp">sort</a></li>
			<li class="sub-item"><a target="content" href="/move.jsp">move</a></li>
			<li class="sub-item"><a target="content" href="/race.jsp">race</a></li>
			<li class="sub-item"><a target="content" href="/flow.jsp">flow</a></li>
			<li class="sub-item"><a target="content" href="/ping.jsp">ping</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">EMPLOYEE</div>
		<ol class="sub-menu">
			<li class="sub-item"><a target="content" href="/dept/list">dept</a></li>
			<li class="sub-item"><a target="content" href="/emp/list">emp</a></li>
			<li class="sub-item"><a target="content" href="/salgrade/race">salgrade</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">CITY</div>
		<ol class="sub-menu">
			<li class="sub-item"><a target="content" href="/city/list">city</a></li>
			<li class="sub-item"><a target="content" href="/country/list">country</a></li>
			<li class="sub-item"><a target="content" href="/language/list">language</a></li>
			<li class="sub-item"><a target="content" href="/search">search</a></li>
		</ol>
	</li>
	<li class="menu-item">
	    <div class="menu-title">LOGIN</div>
	</li>
</ul>
</nav>
<iframe src="/hello2.jsp" 
        name="content" 
        width="100%" 
        sendbox="allow-same-origin"
        scrolling="no"
        frameborder="0"
        onload="resize();"
       
        >
</iframe>	
</body>
</html>