<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 10px;
}

#heading {
	color: blue;
}

td {
	border: 1px solid red;
}

#heading, td {
	text-decoration: underline;
}

tbody > tr:hover{
	background: lightpink;
}

#continent option {
	color: Green;
}

/*
#continent option ||  #heading, td 의 차이 : ,가 없으면 아이디에 해당하는 태그의 자식태그들 중 스타일타겟 중 2번 째 요소에 해당하는 태그들한테 스타일을 적용한다는 의미 
  */
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
		
		
		
		//var select = document.getElementById("continent");
		
		//var continent =  select.options[select.selectedIndex].value; // == document.forms[0].continent.value
		
		//var continent = stringify(selectValue);
		
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
<body>
<h1 id="heading">1.COUNTRY LIST</h1>

<hr>
<form action="/country/list">
<select name="continent" id="continent" onchange="changeSelect()">
 <c:choose>
 <c:when test="${empty param.continent}">
 	<option id="con_value" value="" selected="selected">전체</option>
 </c:when>
 <c:otherwise>
 	<option value="">전체</option>
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
<%-- 		<option value="">전체</option>
	 <c:forEach var="region" items="${regions}">
		<option value="${region}">${region}</option>
   </c:forEach> --%>
</select>
<%-- <input type="search" list="r" name="region"  value="${param.region}">
<datalist id="r">
   <c:forEach var="re" items="${region}">
	<option value="${re.region}">${re.region}</option>
   </c:forEach>
</datalist> --%>
<input type="submit" value="지역검색">
<a href="/country/list">뒤로가기</a>
</form>
<hr>
<table border="1" width="900">
	<thead>
	  <tr>
		<th>no</th>
		<th>code2</th>
		<th>capital</th>
		<th>headofstate</th>
		<th>governmentform</th>
		<th>localname</th>
		<th> gnp_old</th>
		<th> gnp</th>
		<th>life_expectancy</th>
		<th>population</th>
		<th>indep_year</th>
		<th>surface_area</th>
		<th>region</th>
		<th>continent</th>
		<th>name</th>
		<th>code</th>
	   </tr>	
	</thead>
	<tbody>
	 <c:forEach var="country" items="${list}" varStatus="status">
	 <tr>
	 	<td>${status.count}</td>
	 	<td>${country.code2}</td>
	 	<td>${country.capital}</td>
	 	<td>${country.headOfState}</td>
	 	<td>${country.governmentForm}</td>
	 	<td>${country.localName}</td>
	 	<td>${country.gnpOld}</td>
	 	<td>${country.gnp}</td>
	 	<td>${country.lifeExpectancy}</td>
	 	<td>${country.population}</td>
	 	<td>${country.indepYear }</td>
	 	<td>${country.surfaceArea }</td>
	 	<td>${country.region}</td>
	 	<td>${country.continent}</td>
	 	<td>${country.name}</td>
	 	<td>${country.code}</td>
	 </tr>
	 </c:forEach>
	
	</tbody>
</table>
</body>
</html>