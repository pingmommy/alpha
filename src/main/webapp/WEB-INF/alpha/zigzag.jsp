<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>zigzag.jsp</title>
<link rel="stylesheet" href="/css/zigzag.css">
<script type="text/javascript" src="/js/zigzag.js"></script>
</head>
<body>
<h1 style="text-align: center; color:#9af54c ">ZIGZAG ALPHA</h1>
<button id="btncreate">CREATE</button>

<table id="surface">
	<tbody>
	<c:forEach var="list" items="${surface}"> 
	 <tr>
		<c:forEach var="alpha" items="${list}">
			<td style="color:black; background: black; opacity: 0.6">${alpha.ch}</td>
		</c:forEach>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>