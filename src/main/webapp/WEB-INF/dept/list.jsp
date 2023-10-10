<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>DeptList</h1>
<hr>
<form action="/dept/list">
	<input type="text" name="search" >
	<input type="submit" value="부서검색">
</form>

<table border="1" width="500">
	<thead>
	<tr>
		<th>dname</th><th>deptno</th><th>loc</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="dept" items="${list}">
	 <tr>
	  <td>${dept.dname}</td>
	  <td>${dept.deptno}</td>
	  <td>${dept.loc}</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</body>
</html>