<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>lang.jsp</title>
<link rel="stylesheet" href="/css/box.css">
<style type="text/css">
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
</style>
</head>
<body class="white">
<h1 class="text_center" style="margin: 35px;">LANGUAGE</h1>
<hr style="border: 5px solid #b7adf0;">
<table width="1200"  class="margin_center" style="margin-top: 30px;">
<thead>
	<tr>
		<th>NO</th>
		<th>국가코드</th>
		<th>국가명</th>
		<th>언 어</th>
		<th>공식언어확인</th>
		<th>사용비율</th>
	</tr>
</thead>
<tbody>
	<c:forEach var="lang" items="${list}" varStatus="status">
	<tr>
		 <td style="text-align: center;">${status.count}</td>
		 <td style="text-align: center;">${lang.countryCode}</td>
		 <td style="text-align: center;">${lang.name}</td>
		 <td style="text-align: center;">${lang.language}</td>
		 <td style="text-align: center;">${lang.isOfficial}</td>
		 <td style="text-align: right; padding-right: 15px;">${lang.percentage}</td>
	</tr>
	</c:forEach>
</tbody>
</table>
</body>
</html>