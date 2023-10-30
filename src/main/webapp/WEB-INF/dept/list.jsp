<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
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

div{
 padding: 10px;
 background: #dffbfe;
 
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


</style>
</head>
<body class="white" style="height: 700px;">
<h1 class="text_center">부서목록</h1>
<div>
<form action="/dept/list" class="text_center">
	<input type="text" name="search" style="width: 300px; height: 30px;" >
	<input id="input" type="submit" value="부서검색" style="width: 120px; height: 40px;" >
</form>
</div>
<table width="500" class="margin_center" style="margin-top: 30px;">
	<thead>
	<tr>
		<th>부서번호</th><th>부서명</th><th>위치(지역)</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="dept" items="${list}">
	 <tr>
	  <td style="text-align: center;">${dept.deptno}</td>
	  <td style="text-align: right; padding-right: 15px;">${dept.dname}</td>
	  <td style="text-align: right;  padding-right: 15px;">${dept.loc}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>