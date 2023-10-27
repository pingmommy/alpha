<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_cross.jsp</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">

.spinner-box {
	width: 478px;
	height: 485px;
	background-color: transparent;
	border: 1px solid red;
	margin:20px auto;
 }

#surface {
	border-collapse: collapse;
	font-size: 150%;
	font-family: monospace;
	margin-bottom: 50px;
	transform:rotate(45deg);
	animation: configure-xclockwise 3s ease-in-out 0s infinite alternate; 
	left: -115px;
}

#surface td{
  opacity: 0.8
}

div.text_center{
 margin-bottom: 10px;
}

#div_auto {
	display: inline-block; 
	font-size: 1.2em;
}

.confiqure-border-1 {
	width: 478px;
	height: 485px;
	padding 3px;
	position:absolute;
	background:  #fb5b53;
	animation: configure-clockwise 3s ease-in-out 0s infinite alternate; 
	border: 10px solid blue;
	
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
  	   		transform:rotate(225deg);
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
	
	createbtn.onclick = () =>{
		let cross = new Cross();
		cross.run();
	}
	
	d = document.querySelector('input');
	d.onchange=  async function() {
	    
		 c = d.checked;
		console.log(c);
	  	
		    while(c){
		      console.log("ddd"); 
		        await sleep(100);
		        
		        let cross = new Cross();
				cross.run();
				}
	      
	  } 

}
</script>


</head>
<body class="white">
<h1 class="text_center t_green2">CROSSING ALPHA</h1>
<div class="text_center" >
	<button id="createbtn" class="white shape">CREATE</button>
	<div id="div_auto" class="shape">
	<input type="checkbox" id="auto" name="auto" onchange="console.log(this.checked)" >
	<label>AUTO</label>
	</div>
</div>	

<div class="confiqure-border-1"></div>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();" class="l_orange">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="alpha" items="${surface[i]}">
			<td style="color:black; background:black;" >${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>