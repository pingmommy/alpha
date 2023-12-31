<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

 	height: 100px;
 	width: 100%;
 	background: #5eecfa;
 	position: fixed;
 }

ul{
	margin-top: 30px;
}

.menu-title {
 	padding: 15px 10px;
 	font-size: 35px;
 	color: white;
 	font-family: 'IBM Plex Sans KR', sans-serif;
}

.menu-title > a {
	text-decoration: none;
	display: block;
	color: white;
}


.menu {
	display: flex;
	list-style: none;
	align-items:flex-start;
	position: fixed;
	width: 100%;
	top:10px;
	left: 10px;
}


.menu-item {
	width: 230px;
	flex-shrink: 0;
 	text-align: center; 
 	background: #5eecfa;
 	text-decoration: none;	
}
.menu-item:hover> .menu-title {
	font-weight: bold;
  	color: black;

}

.menu-item:hover> .sub-menu {
	max-height: 500px;
	transition: max-height 2s;
}


.menu-item:nth-last-child(2) {
	margin-left:auto;
	
}

.menu-item:last-child {

	margin-right:50px;
}


.sub-menu {
	max-height:0px;
	overflow:hidden;
	list-style: none;
	padding-left: 0px;
	font-family: 'IBM Plex Sans KR', sans-serif;

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

$(document).ready(function(){
	setInterval(resize,100);
});

</script>
</head>
<body>
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
			<li class="sub-item"><a target="content" href="/alpha/fill">FILL</a></li>
			<li class="sub-item"><a target="content" href="/alpha/cross">CROSS</a></li>
			<li class="sub-item"><a target="content" href="/alpha/race">RACE</a></li>
			<li class="sub-item"><a target="content" href="/alpha/zigzag">ZIGZAG</a></li>
			<li class="sub-item"><a target="content" href="/earthworm.jsp">EATHWARM</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">ANIMATION</div>
		<ol class="sub-menu">
			<li class="sub-item"> <a target="content" href="/ani/fill"">ANI_FILL</a></li>
			<li class="sub-item"> <a target="content" href="/ani/cross"">ANI_RACE</a></li>
			<li class="sub-item"> <a target="content" href="/cube.jsp"">CUBE</a></li>
			<li class="sub-item"> <a target="content" href="/placeholder.jsp"">PLACEHOLDER</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">REACT</div>
		<ol class="sub-menu">
			<li class="sub-item"><a target="content" href="/fill.jsp">FILL</a></li>
			<li class="sub-item"><a target="content" href="/cross.jsp">CROSS</a></li>
			<li class="sub-item"><a target="content" href="/sort.jsp">SORT</a></li>
			<li class="sub-item"><a target="content" href="/move.jsp">MOVE</a></li>
			<li class="sub-item"><a target="content" href="/race.jsp">RACE</a></li>
			<li class="sub-item"><a target="content" href="/flow.jsp">FLOW</a></li>
			<li class="sub-item"><a target="content" href="/ping.jsp">PING</a></li>
			<li class="sub-item"><a target="content" href="/rest/dept">DEPT</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">EMPLOYEE</div>
		<ol class="sub-menu">
			<li class="sub-item"><a target="content" href="/dept/list">DEPT</a></li>
			<li class="sub-item"><a target="content" href="/emp/list">EMP</a></li>
			<li class="sub-item"><a target="content" href="/emp/sal">SALGRADE</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">CITY</div>
		<ol class="sub-menu">
			<li class="sub-item"><a target="content" href="/city/list">CITY</a></li>
			<li class="sub-item"><a target="content" href="/country/list">COUNTRY</a></li>
			<li class="sub-item"><a target="content" href="/language/list">LANGUAGE</a></li>
		</ol>
	</li>
	<sec:authorize access="isAnonymous()">
		<li class="menu-item">
		    <div class="menu-title">
		    	<a href="/login">LOGIN</a>
		    </div>
		</li>
		<li class="menu-item">
		    <div class="menu-title">
		    	<a href="/register">REGISTER</a>
		    </div>
		</li>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<li class="menu-item">
		    <div class="menu-title">
		    	<a href="/logout">LOGOUT</a>
		    </div>
		</li>
		<li class="menu-item">
		    <div class="menu-title">
		    	<a href="#"><sec:authentication property="name"/>님♥</a>
		    </div>
		</li>
	</sec:authorize>
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