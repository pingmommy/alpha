<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>race.jsp</title>

<style type="text/css">
#table1 {
	border-collapse: collapse;
	font-size: 2em;
	font-family: monospace;
	background-image: url("/media/fubao.jpg");
	background-size: 100%;
	background-repeat: no-repeat;
}

#startbtn {
	padding: 5px 10px 5px 10px;
}

td {
	text-align: right;
}

section > table, ul{
	float: left;
}

</style>

<script type="text/javascript">
window.onload = function() {
	 
	startbtn.onclick = e => {
		
		
		fetch('/alpha/data')
		.then(r => r.json())
		.then(alpha => {
			console.log(alpha)
			race(alpha);		
			
		}); }
	
	
	
	
}

function race(alpha){
	
	console.log(alpha);
	let cnt = 0;
	let speed = Math.random()*1000+10;
	alpha.line =1;
	alpha.column =1;
	let direction = 0;  //0 :right 1: left 2: up 3: down 
	
	
	
	let td = table1.rows[alpha.line-1].cells[alpha.column-1]
	td.style.color = alpha.fg;
	td.style.background = alpha.bg;
	td.innerText = alpha.ch;
	
	
	let table = document.getElementById('alp');
	
	
	let x = document.createElement('li');
	x.innerText = alpha.ch;
	x.style.color = alpha.fg;
	table.appendChild(x);
		
	let roundTable = document.getElementById('roundCount');
	let y = document.createElement('li');
	roundTable.appendChild(y);
	y.innerText = 0;
	
	
	
	
	setTimeout(function move() {
		
		//cnt += cnt;
	//console.log(cnt +", speed" + speed);
	//console.log(cnt);
	
	let td = table1.rows[alpha.line-1].cells[alpha.column-1]
	td.style.color = 'black';
	td.style.background = 'black';
	
	
	
/* 	if(cnt == 3){
		console.log("DONE!!!")
		//clearTimeout(id);
	} */
		
	switch(direction){
	case 0: //right
		alpha.column++;
		break;
	case 1: //left
		alpha.column--;
		break;
	case 2: // up
		alpha.line--;
		break;
	case 3: //down
		alpha.line++;
		break;
	}
	
	if(alpha.line == 1 && alpha.column == 1){
		direction =0; //right
		round.innerText = ++round.innerText;
		cnt++;
	//	console.log(cnt);
		
	
	y.innerText = ++y.innerText;
	
		
	}
	else if(alpha.line == 20 && alpha.column == 40){
		direction =1;	//left	
	}
	else if(alpha.line == 20 && alpha.column == 1){
		direction =2; //up		
	}
	else if(alpha.line == 1 && alpha.column == 40){
		direction =3; //down		
	}
	
	//console.log('line'+alpha.line);
	//console.log(alpha.column);
	td = table1.rows[alpha.line-1].cells[alpha.column-1]
	td.style.color = alpha.fg;
	td.style.background = alpha.bg;
	td.innerText = alpha.ch;
	
	setTimeout(move, 100)
	}, 100);
	
	count.innerText = ++count.innerText;
	if(count.innerText==1){
		setInterval(function() {
			ellipse.innerText = ++ellipse.innerText;
		}, 1000)
	}
}
</script>


</head>
<body>
<h1>Ajax = fetch 활용</h1>
<hr>
<button id="startbtn">start</button>
<button>run</button>


<table border="1px" width="400" >
	<th>round</th><th>count</th><th>second</th>
<thead>
</thead>
<tbody>
	<td id="round">0</td><td id="count">0</td><td id="ellipse">0</td>
</tbody>
</table>
<hr>

<section>
<table id="table1" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="j" begin="0" end="${surface.get(i).size()-1}">
			<c:set var="alpha" value="${surface[i][j]}" />
			<td style="background:black; color:black; opacity:0.5">${alpha.ch}</td>			
		</c:forEach>
		</tr>
	</c:forEach>
</tbody>
</table>
<ul>
	<li>
		<h3>alpha</h3>
		<ol id="alp">
			
		</ol>
	</li>
	<br>
	<li>
		<h3>round</h3>
		<ol id="roundCount">
			
		</ol>
	</li>
</ul>
</section>
</body>
</html>