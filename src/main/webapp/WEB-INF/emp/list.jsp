<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpList</title>
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

td {
	border-bottom: 3px solid lightgrey;
	height: 40px;
}

th {
  height : 40px;
  border-bottom: 5px solid grey;
  font-size: 15pt;
 }

 div{
	margin-bottom: 30px;
 
}

section {
	width: 1000px;
	margin: 0px auto;
	
}
	
</style>
</head>
<body class="white" style="height: 1000px;">
<h1 class="text_center" style="margin-top: 50px;">직원정보</h1>
<div>
<form action="/emp/list" class="text_center">
	<select name="deptno" style="width: 150px; height:38px; border-radius: 5px; font-size: 1.1em;">
		<c:choose>	
			<c:when test="${empty param.deptno}">
				<option value="" selected="selected">전체부서</option>
			</c:when>
			<c:otherwise>
				<option value="">전체부서</option>
			</c:otherwise>
		</c:choose>
		<c:forEach var="dept" items="${depts}">
		<c:choose>
			<c:when test="${param.deptno eq dept.deptno}">
				<option value="${dept.deptno}" selected="selected">${dept.dname}</option>
			</c:when>
			<c:otherwise>
				<option value="${dept.deptno}">${dept.deptno} ${dept.dname}</option>
			</c:otherwise>
		</c:choose>
		</c:forEach>
	</select>
	<input type="text" name="search"  style="width: 300px; height:35px; border-radius: 5px;" placeholder="부서명">
	<input id="input" type="submit" value="검색" style="width: 120px; height: 40px;">
</form>
</div>
<section>
<hr style="border: 5px solid #5eecfa; opacity: 0.5">
<table width="800" class="margin_center" style="margin-top: 30px;">
<thead>
	<th>사  번</th>
	<th>직원명</th>
	<th>성  별</th>
	<th>직  급</th>
	<th>직속상사사번</th>
	<th>입사일</th>
	<th>연  봉</th>
	<th>커미션</th>
	<th>부서번호</th>
	</thead>
<tbody>
	<c:forEach var="emp" items="${list}">
	<tr>
		<td style="text-align: center;">${emp.empno}</td>
		<td style="text-align: center;">${emp.ename}</td>
		<td align="center">${emp.gender}</td>
		<td style="text-align: center;">${emp.job}</td>
		<td style="text-align: right; padding-right: 15px;">${emp.mgr}</td>
		<td style="text-align: right; padding-right: 15px;">${emp.hiredate}</td>
		<td style="text-align: right; padding-right: 15px;">${emp.sal}</td>
		<td style="text-align: right; padding-right: 15px;">${emp.comm}</td>
		<td style="text-align: right; padding-right: 15px;">${emp.deptno}</td>
	</tr>
	</c:forEach>
</tbody>
</table>
</section>
</body>
</html>