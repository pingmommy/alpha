<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">

table {
	border-collapse:collapse;
 	font-family: monospace;
 	font-size: 1.5em;
}
.shape {
 	width: 120px;
 	height: 50px;
 	font-size: 1.5em;
 	border-radius: 20px;
 	display: inline-block;
}

.line{
	border: 15px solid #fffe72;
}

div.flex-center{
	margin-bottom: 20px;
}
#clear{
	margin-right: 10px;
}
#surface{
	margin-bottom: 50px;
}
</style>

<script type="text/javascript">

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
		
		xhr.onload = e =>{
			let alpha =  xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			
			if(td.style.color =='black' && td.style.background=='black') {
				count.innerText = ++count.innerText;
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
		});
	});
	count.innerText =0;
	seconds.innerText =0;
	forecount.innerText =0;
}

function handleBtn_click(e) {
	let d = document.querySelector('#skill');
	let isOpen = false;
	console.log("btn..");
	if(!isOpen)
		d.style.opacity="1.0";	
	else 
		d.style.opacity="0.0";			
     isOpen=!isOpen;
}
</script>

</head>
<body style="background: white; ">
<h1 style="text-align: center;" class="t_blue">FILL THE SURFACE</h1>
<div class="flex-center">
	<button id="start" onclick="startBtn_click(event)" class="button shape">START</button>
	<button id="clear" onclick="clearBtn_click(event)" class="shape">CLEAR</button>
	<table width="200">
		<thead>
			<tr>
			 <th>Forecount</th><th>Count</th><th>Second</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			  <td id="forecount" align="center">0</td>
			  <td id="count" align="center">0</td>
			  <td id="seconds" align="center">0</td>
			</tr>
		</tbody>
	</table>
</div>
<table id="surface" onmousedown="event.preventDefault();" class="line margin_center">
 <tbody>
	<c:forEach var="row" items="${surface}">
	<tr>
		<c:forEach var="cells" items="${row}">
			<td style="background:${cells.bg}; color:${cells.fg}; opacity:0.5">${cells.ch}</td>
		</c:forEach>
	</tr>
	</c:forEach>
</tbody>
</table>

</body>
</html>