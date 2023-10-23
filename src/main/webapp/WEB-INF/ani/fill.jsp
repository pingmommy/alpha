<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani.fill</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">

#surface {
	border-collapse:collapse;
 	font-family: monospace;
 	font-size: 1.5em;
 	
 	margin-bottom: 50px;
 	margin-left: 250px;
}

#surface td {
 	position: relative;
 	transition : left 3s, transform 4s;
    transition-delay : 500ms;
 	
 	
 	top: 0px;
 	left:0px;
}

#out_div {
display: flex;
justify-content: flex-start;
margin: 15px;
margin-left: 250px;
}

#clear {
	margin-right: 15px;
}


</style>

<script type="text/javascript">

window.onload = function() {
	
	surface.oncontextmenu = function(e) {
		e.preventDefault();
	}
}

function startBtn_click(e){
	console.log("start..");
		start.disabled = true;
		clear.disabled = true;
		
	let sid =  setInterval(function() {
		seconds.innerText = ++seconds.innerText;
	}, 1000)	
		
	let tid = setInterval(function() {
			
		forecount.innerText= ++forecount.innerText;	
		
		if(count.innerText == 800){
			clearInterval(tid);
			clearInterval(sid);
			start.disabled = false;
			clear.disabled = false;
			return;
		}
			
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/alpha/data')
		xhr.responseType='json';
		
		// 비동기방식으로 진행하는데, xhr이 제대로 동작하면 온로드가 수행된다. 
		xhr.onload = e =>{
			let alpha =  xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			
			if(td.style.color =='black' && td.style.background=='black') {
				count.innerText = ++count.innerText;
					
					td.style.left = "700px";
					td.style.opacity="0.5";
					td.style.transform = `rotate(\${360*10}deg)`;
			}
			
			td.style.background = alpha.bg;
			td.style.color = alpha.fg;
			td.innerText = alpha.ch;									
			
		}
		xhr.send();
		}, 10);
}
function clearBtn_click(e){
	Array.from(surface.rows).forEach(function(row) {
		Array.from(row.cells).forEach(function(td) {
			td.style.color ='black';
			td.style.background ='black';
			td.style.left="0px";
		});
	});
	count.innerText =0;
	seconds.innerText =0;
	forecount.innerText =0;
}
</script>

<!-- XMLHttpRequest - 웹브라우저에 기본적으로 있는 객체  -->
</head>
<body class="white">
<h1 class="text_center t_green">AnimationFill-ALPHA</h1>
<div id="out_div">
<button id="start" onclick="startBtn_click(event)" class="shape">START</button>
<button id="clear" onclick="clearBtn_click(event)" class="shape">CLEAR</button>
<table width="200">
<thead>
<tr>
 <th>Forecount</th><th>Count</th><th>Second</th>
</tr>
</thead>
<tbody>
<tr>
  <td id="forecount" align="right">0</td>
  <td id="count" align="right">0</td>
  <td id="seconds" align="right">0</td>
</tr>
</tbody>
</table>
</div>
<table id="surface" onmousedown="event.preventDefault();" class="l_pink">
 <tbody>
	<c:forEach var="row" items="${surface}">
	<tr>
		<c:forEach var="cells" items="${row}">
			<td style="background:${cells.bg}; color:${cells.fg}; opacity:1.0">${cells.ch}</td>
		</c:forEach>
	</tr>
	</c:forEach>
</tbody>
</table>


</body>
</html>