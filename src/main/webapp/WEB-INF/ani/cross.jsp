<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani.cross</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">

.spinner-box {
	width: 478px;
	height: 485px;
	background-color: transparent;
	margin:150px auto;
 }
#surface {
	border-collapse: collapse;
	font-size: 150%;
	font-family: monospace;
	background: black;
	margin-bottom: 50px;
	transform:rotate(45deg);
	animation: configure-xclockwise 3s ease-in-out 0s infinite alternate; 
	left: -115px;
}


div.center{
 margin-bottom: 20px;
}

#div_auto {
	display: inline-block; 
	font-size: 2.0em;
	padding: 5px 0px 0px 0px ;
}

.confiqure-border-1 {
	width: 478px;
	height: 485px;
	position:absolute;
	background:lightgrey;
	animation: configure-clockwise 3s ease-in-out 0s infinite alternate; 
	border: 10px solid #b7adf0;

	}
	
		@keyframes configure-clockwise {
  		0%{
  			transform: rotate(0);
  		}
  		25%{
  			transform:rotate(90deg);
  		}
  		50%{
  			transform:rotate(180deg);
  		}
  		75% {
  			transform:rotate(270deg);
  		}
  		100%{
  			transform:rotate(360deg);
  		}
  	}
  	
  	
@keyframes configure-xclockwise{
  	   0%{
  	   		transform:rotate(45);
  	   }
  	   25%{
  	   		transform:rotate(-45deg);
  	   }
  	   50%{
  	   		transform:rotate(-135deg);
  	   }
  	   75% {
  	   		transform:rotate(-225deg);
  	   }
  	   100% {
  	   		transform:rotate(-315deg);
  	   }
  	}
  	
	
</style>
<script type="text/javascript">

function sleep(millis){
	
	return new Promise(function(resolve, reject) {
	 setTimeout(resolve, millis)
	});
}


class Cross{
	
	constructor(){
		this.direction =parseInt(Math.random()*4);
	    this.speed = Math.random()*200+10;
	}

   show(){
	 let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1]; 
   	 td.style.color = this.alpha.fg;	
   	 td.style.background = this.alpha.bg;	
   	 td.innerText = this.alpha.ch;
   }
   
   hide(){
	   let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1]; 
	   	 td.style.color = 'black';	
	   	 td.style.background ='black';
   }
   
   
    move(){
	 
	 this.hide(); 
	   switch(this.direction){
	   case 0:	// TOP
			this.alpha.line--;
			break;
		case 1:	// RIGHT
			this.alpha.column++;
			break;	
		case 2:	// BOTTOM
			this.alpha.line++;
			break;
		case 3:	// LEFT
			this.alpha.column--;
			break;
	   }
	   
	   
	  if(this.alpha.column==0 || this.alpha.line==0 || this.alpha.column==41 || this.alpha.line==21){
		  surface.rows[0].cells[19].style.visibility ='hidden';
		  surface.rows[19].cells[19].style.visibility ='hidden';
		  surface.rows[9].cells[0].style.visibility ='hidden';
		  surface.rows[9].cells[39].style.visibility ='hidden';   
		  return false;
	   }	  
	  
	     this.show();
	     return true;
	   
   }
	
	async run(){
	  	let response = await fetch('/alpha/data');
	   	this.alpha = await response.json();
	   	this.alpha.line=10;
	   	this.alpha.column=20;
		/* console.log(this.alpha); */
		
		this.show();
		
	  for(;;){		 
		
		 await sleep(this.speed);
		 
		 if(!this.move()){
			 break;
		 }		 	
	   }
	}
}


window.onload = () => {
	
	createbtn.onclick = async function(){
		for(;;){
		await sleep(100);	
		let cross = new Cross();
		cross.run();
		}
	}

}
</script>


</head>
<body class="white">
<h1 class="text_center t_purple">AnimationCROSS ALPHA</h1>

	<button id="createbtn" class="button_2">create</button>

<div class="spinner-box">	
<div class="confiqure-border-1"></div>	
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
</div>
</body>
</html>