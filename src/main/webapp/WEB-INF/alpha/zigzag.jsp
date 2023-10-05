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
<h1>zigzag(class + fetch + async/await)</h1>
<h2>external javascript(zigzag.js),css(zigzag.css)</h2>

<button id="btncreate">create</button>

<table id="surface">
	<tbody>
	<c:forEach var="list" items="${surface}"> 
	 <tr>
		<c:forEach var="alpha" items="${list}">
			<td style="color:green; background: green; opacity: 0.7">${alpha.ch}</td>
		</c:forEach>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>