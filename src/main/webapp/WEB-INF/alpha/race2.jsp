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
}
</style>
<script type="text/javascript">
window.onload = function(){
	start.onclick = function(){
		let xhr = new XMLHttpRequest();
		xhr.open('GET','/alpha/racing')
		xhr.responseType = 'json'
		xhr.send();
		
		xhr.onload = function(){
			let a = xhr.response;
	         console.log(a);
			table1.rows[1].cells[1].
		}
		
	}
	
}
</script>


</head>
<body>
<h1>RACE</h1>
<hr>
<button id="start">start</button>
<button id="clear">clear</button>
<hr>
<table id="table1">
<c:forEach var="row" items="${race}">
<tr>
	<c:forEach var="cells" items="${row}">
		<td style="background: ${cells.bg}; color: ${cells.fg}">${cells.ch}</td>
	</c:forEach>
</tr>
</c:forEach>
</table>


</body>
</html>