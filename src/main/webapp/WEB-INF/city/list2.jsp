<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>city</title>
</head>
<body>
<h1>CITYLIST</h1>
<form action="/city/list2">
<select name="code">
<c:choose>
<c:when test="${ empty param.code}">
<option value="" selected="selected">전체</option>
</c:when>
<c:otherwise>
<option value="">전체</option>
</c:otherwise>
</c:choose>

<c:forEach var="m" items="${codes}">	
<c:choose>
<c:when test="${!empty param.code and param.code eq m.code }">
	<option value="${m.code}" selected="selected">[${m.code}] ${m.name}</option>
</c:when>
<c:otherwise>
	<option value="${m.code}">[${m.code}] ${m.name}</option>
</c:otherwise>
</c:choose>
</c:forEach>	
</select>

<input type="search" list="co" >
<datalist id="co">
 <c:forEach var="m" items="${codes}">
  <option value="${m.code}">[${m.code}] ${m.name}</option>
 </c:forEach>
</datalist>

</form>
<table border="1" width ="500">
<thead>
	<tr>
	<th>NO</th>
	<th>id</th>
	<th>name</th>
	<th>country_code</th>
	<th>district</th>
	<th>population</th>
	</tr>
</thead>

<tbody>
 	<c:forEach var="city" items="${list}" varStatus="status">
 	<tr>
 		<td>${status.count}</td>
 	 	<td>${city.id}</td>
 	 	<td>${city.name}</td>
 	 	<td>${city.country_code}</td>
 	 	<td>${city.district}</td>
 	 	<td>${city.population}</td>
 	</tr>
 	</c:forEach>
</tbody>
</table>


</body>
</html>