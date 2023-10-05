<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cross.jsp</title>
<style type="text/css">
#surface {
	border-collapse: collapse;
	font-size: 150%;
	font-family: monospace;
	
	border: 20px outset pink;
}

body {
	/*  background: url("/media/small.png"); */
}

#surface td{
  opacity: 0.8
}
</style>
<script type="text/javascript">
window.onload = () => {
	
	createbtn.onclick = function(){
			let cnt;
		
		/* let tid = setInterval(() => {
			console.log(cnt++);
			
			if(i==10){
				clearInterval(tid)
			}
		}, 1000)
		 */
		 
		setTimeout(function inc() {
			
			console.log(cnt++);
			if(i<10){
			setTimeout(inc,1000);}
		}, 1000)
	}
	
}
</script>


</head>
<body>
<h1>Async/await +class 실습</h1>
<hr>
<button id="createbtn">create</button>
	<hr>
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
	<tbody>
	<c:forEach var="i" begin="0" end="${surface.size()-1}">
		<tr>
		<c:forEach var="alpha" items="${surface[i]}">
			<td style="color:black; background:black;" >${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	
	
	<%-- <c:forEach var="list" items="${surface}">
		<tr>
		<c:forEach var="alpha" items="${list}">
			<td>${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach> --%>
	</tbody>
</table>

</body>
</html>