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

th td {
 
}
</style>
</head>
<body class="white" style="height: 700px;">
<h1 class="text_center">부서목록</h1>

<form action="/dept/list" class="text_center">
	<input type="text" name="search" style="width: 200px; height: 30px;" >
	<input type="submit" value="부서검색">
</form>

<table border="1" width="500" height="400" class="margin_center" style="margin-top: 30px;">
	<thead>
	<tr>
		<th>부서번호</th><th>부서명</th><th>위치(지역)</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="dept" items="${list}">
	 <tr>
	  <td style="text-align: center;">${dept.deptno}</td>
	  <td style="text-align: right;">${dept.dname}</td>
	  <td style="text-align: right;">${dept.loc}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>

</body>
</html>