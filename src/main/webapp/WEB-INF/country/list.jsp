<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">
.input {
	border-radius: 5px;
	border: none;
	background: lightgrey;
	font-size: 1.2em;
	width: 100px;
	height: 40px;
}

.input:hover {
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

tbody > tr:hover{
	background: #dbd6f7;
}

#continent option {
	color: purple;
}

select {
	width: 300px;
	 height: 40px; 
	 font-size: 1.2em;
	 border-radius: 5px;
}

a{
	padding: 8px 15px;
	text-decoration: none;
	color: black;
}

div {
	margin-bottom: 30px;
}
	
</style>

<script type="text/javascript">
window.onload = function(){
	
    let continent =  document.forms[0].continent;
	
	continent.onchange = function(){
		
		console.log(this.value);
		
		let xhr = new XMLHttpRequest();
		
		xhr.open('GET', `/country/region?continent=\${this.value}`);
		
		xhr.send();
		xhr.onload = e => {
			setRegions(JSON.parse(xhr.responseText));
		}
		console.log(continent);
	}
	continent.onchange();
	
}

function setRegions(regions){
	console.log(regions);
	let region = document.forms[0].region;
	
	region.innerText="";
	
	let regionParam = new URL(location.href).searchParams.get("region");
	
	
		let option = document.createElement('option');
		option.value= '';
		option.innerText= '전체';
		
		if(regionParam == null || regionParam == ""){
			option.selected = true;
		}
		
		region.append(option);
		
	for(let re of regions){
		let option = document.createElement('option');
		option.value= re;

		option.innerText =re;	
		
		if(re == regionParam){
			option.selected= true;
		}
		
		region.append(option);
	}
}

</script>
</head>
<body class="white">
<h1 class="text_center" style="margin: 35px;">나라정보</h1>
<div>
<form action="/country/list" class="text_center">
<select name="continent" id="continent" onchange="changeSelect()" style="width: 300px; height: 40px;">
 <c:choose>
 <c:when test="${empty param.continent}">
 	<option id="con_value" value="" selected="selected">전체</option>
 </c:when>
 <c:otherwise>
 	<!-- <option value="">전체</option> -->
 </c:otherwise>
 </c:choose>
 <c:forEach var="continent" items="${continents}">
<c:choose>
<c:when test="${!empty param.continent and param.continent eq continent}">
	<option value="${continent}" selected="selected">${continent}</option>
</c:when>
<c:otherwise>
	<option value="${continent}">${continent}</option>
</c:otherwise>
</c:choose>		
 </c:forEach>
</select>
<select name="region" id="region">
</select>
<input class="input" type="submit" value="검색">
<a href="/country/list" class="input">처음으로</a>
</form>
</div>
<hr style="border: 5px solid #b7adf0;">
<table width="1500"  class="margin_center"style="margin-top: 30px;">
	<thead>
	  <tr>
		<th>NO</th>
		<th>CODE</th>
		<th>CODE2</th>
		<th>CONTINENT</th>
		<th>NAME</th>
		<th>LOCALNAME</th>
		<th>CAPITAL</th>
		<th>HEADOFSTATE</th>
		<th>GOVERMENTFORM</th>
		<th>GNP_OLD</th>
		<th>GNP</th>
		<th>LIFE_EXPECTANCY</th>
		<th>POPULATION</th>
		<th>INDEP_YEAR</th>
		<th>SURFACE_AREA</th>
		<th>REGION</th>
	   </tr>	
	</thead>
	<tbody>
	 <c:forEach var="country" items="${list}" varStatus="status">
	 <tr>
	 	<td>${status.count}</td>
	 	<td>${country.code}</td>
	 	<td>${country.code2}</td>
	 	<td>${country.name}</td>
	 	<td>${country.continent}</td>
	 	<td>${country.localName}</td>
	 	<td>${country.capital}</td>
	 	<td>${country.headOfState}</td>
	 	<td>${country.governmentForm}</td>
	 	<td>${country.gnpOld}</td>
	 	<td>${country.gnp}</td>
	 	<td>${country.lifeExpectancy}</td>
	 	<td>${country.population}</td>
	 	<td>${country.indepYear }</td>
	 	<td>${country.surfaceArea }</td>
	 	<td>${country.region}</td>
	 </tr>
	 </c:forEach>
	
	</tbody>
</table>
</body>
</html>