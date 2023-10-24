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
#surface {
	border-collapse: collapse;
	font-size: 150%;
	font-family: monospace;
	border: 20px solid pink;
	background: black;
	margin-bottom: 50px;
}


div.center{
 margin-bottom: 20px;
}

#div_auto {
	display: inline-block; 
	font-size: 2.0em;
	padding: 5px 0px 0px 0px ;
	/* margin-bottom: 10px; */
	
	
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
		/* this.speed = Math.random()*200+10; */
	}

   show(){
	 let td = surface.rows[this.alpha.line-1].cells[this.alpha.column-1]; 
   	 td.style.color = this.alpha.fg;	
   	 td.style.background = this.alpha.bg;	
   	 td.innerText = this.alpha.ch;
   	 let keyframes =[{transform:"rotate(1000deg)"}];
   	 let option = { duration : 500, iterations: Infinity,};
   	 td.animate(keyframes,option);
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
		 
		
		 await sleep(500);
		 
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

}
</script>


</head>
<body class="white">
<h1 class="text_center t_purple">Ani ALPHA</h1>

	<button id="createbtn" class="button_2">create</button>
		
<table id="surface" onmousedown="event.preventDefault();" class="margin_center">
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