<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sal.jsp</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">
td {
	border-bottom: 3px solid lightgrey;
	height: 40px;
}

th {
  height : 40px;
  border-bottom: 5px solid grey;
  font-size: 15pt;
 }
 
 section {
	width: 1000px;
	margin: 0px auto;
}
</style>
</head>
<body class="white" style="height: 1500px;">
<h1 class="text_center" style="margin-top: 50px;">직원별 급여정보</h1>
<section>
<hr style="border: 5px solid #5eecfa; opacity: 0.5">
<table width="800" class="margin_center" style="margin-top: 30px;">
	<thead>
		<th>사 번</th>
		<th>성 명</th>
		<th>부서번호</th>
		<th>직 급</th>
		<th>급 여</th>
		<th>급여등급</th>
	</thead>
	<tbody>
		<c:forEach var="emp" items="${list}">
		<tr>
			<td style="text-align: center;">${emp.empno}</td>
			<td style="text-align: center;">${emp.ename}</td>
			<td style="text-align: right; padding-right: 15px;">${emp.deptno}</td>
			<td style="text-align: right; padding-right: 15px;">${emp.job}</td>
			<td style="text-align: right; padding-right: 15px;">${emp.sal}</td>
			<td style="text-align: right; padding-right: 15px;">${emp.grade}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</section>
<section>
<h2 class="text_center" style="margin-top: 100px;">급여등급안내</h2>
<hr style="border: 3px solid #5eecfa; opacity: 0.5">
<table width="800" class="margin_center" style="margin-top: 30px;">
	<thead>
		<th>grade</th>
		<th>losal</th>
		<th>hisal</th>
	</thead>
	<tbody>
		<c:forEach var="sal" items="${sal}">
		<tr>
			<td style="text-align: right; padding-right: 15px;">${sal.grade}</td>
			<td style="text-align: right; padding-right: 15px;">${sal.losal}</td>
			<td style="text-align: right; padding-right: 15px;">${sal.hisal}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</section>
</body>
</html>