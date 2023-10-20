<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fill</title>

<style type="text/css">

table {
	border-collapse:collapse;
 	font-family: monospace;
 	font-size: 2em;
 	/* border-left:15px solid green; */
 	margin: 0px auto;
}

.button{
	margin-left: 950px;
	margin-top: 30px;
	margin-bottom: 50px;
}

.shape {
 	width: 120px;
 	height: 50px;
 	font-size: 2em;
 	font-weight: bold;
 	border-radius: 20px;
}

.line{
	border: 20px solid lightpink;
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
<h1 style="text-align: center;">FILL THE SURFACE</h1>

<table width="500">
<thead>
<tr>
 <th>forecount</th><th>count</th><th>second</th>
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

<table id="surface" onmousedown="event.preventDefault();" class="line">
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
<button id="start" onclick="startBtn_click(event)" class="button shape">start</button>
<button id="clear" onclick="clearBtn_click(event)" class="shape">clear</button>
</body>
</html>