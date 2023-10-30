<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>city</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">
#input {
	border-radius: 5px;
	border: none;
	background: lightgrey;
	font-size: 1.2em;
}

#input:hover {
	background: grey;
	color: white;
}

tbody > tr:nth-child(2n){
	background: #f8f7fd;
}

td {
	border-bottom: 3px solid lightgrey;
	height: 40px;
}

th {
  height : 40px;
  border-bottom: 5px solid grey;
  font-size: 15pt;
 }

 div {
	 margin: 25px;
}
</style>
<script type="text/javascript">
window.onload = function(){
	population.oninput = function (e) {

	    let value =parseInt(e.target.value);
	    
	    pop_value.innerText =value.toLocaleString();
	    
	}
	
	    pop_value.innerText =parseInt(population.value).toLocaleString();
	
}
</script>
</head>
<body class="white">
<h1 class="text_center" style="margin: 35px;">CITYLIST</h1>
<div>
<form action="/city/list" class="text_center">
<input  type="range" name="population"  value="${empty param.population? 0 : param.population}" id="population" min="0" max="10000000" step="100000">
<label><span id="pop_value"></span>이상</label>
<input type="search" list="codes" name="code" value="${param.code}" style="width: 300px; height: 40px; border-radius: 5px;"  placeholder="지역검색">
<datalist id="codes">
 <c:forEach var="c" items="${codes}">
  <option value="${c.code}">[${c.code}] ${c.name}</option>
 </c:forEach>
</datalist>
<input id="input" type="submit" value="도시검색" style="width: 120px; height: 40px;">
</form>
</div>
<hr style="border: 5px solid #b7adf0">
<table  width ="900" class="margin_center" style="margin-top: 20px;">
<thead>
	<tr>
	<th>NO</th>
	<th>id</th>
	<th>name</th>
	<th>countryCode</th>
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
 	 	<td>${city.countryCode}</td>
 	 	<td>${city.district}</td>
 	 	<td align="right"><fmt:formatNumber pattern="###,###,###,####" value="${city.population}"/></td>
 	</tr>
 	</c:forEach>
</tbody>
</table>


</body>
</html>