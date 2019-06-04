<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	font-family:"빙그레체"
}
a {
	color: black;
	text-decoration: none;
}

a:hover {
	font-weight: bold;
	color: #74D36D
}

.wp-table tr:nth-child(odd) {
	background-color: #fff;
}

.wp-table tr:nth-child(even) {
	background-color: #f1f1f1;
}

.wp-table tr {
	border-bottom: 1px solid #ddd;
}

.wp-table th:first-child, .wp-table td:first-child {
	padding-left: 16px;
}

.wp-table td, .wp-table th {
	padding: 8px 8px;
	display: table-cell;
	text-align: center;
	vertical-align: top;
}

.wp-table th {
	font-weight: bold;
}

.wp-table {
	font-size: 15px !important;
	border: 1px solid #ccc;
	border-collapse: collapse;
	border-spacing: 0;
	width: 60%;
}

.myButton {
	background-color: transparent;
	-moz-border-radius: 18px;
	-webkit-border-radius: 18px;
	border-radius: 18px;
	border: 2px solid #ddd;
	display: inline-block;
	cursor: pointer;
	color: black;
	font-family: '빙그레체';
	font-size: 15px;
	font-weight: bold;
	padding: 10px 10px;
	text-decoration: none;
}

.myButton:hover {
	background-color: #ddd;
	font-weight: bold;
	color : white;
	text-shadow: 0 0 2px balck;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<hr>
	<h2 align=center>나의 주소록</h2>
	<hr>
	<br>
	<table class="wp-table" align=center>
		<tr>
			<th></th>
			<th>이름</th>
			<th>성별</th>
			<th>생년월일</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.seq}</td>
				<td><a href="${path}/address/view.do?name=${row.name}">${row.name}</a></td>
				<td>${row.gender}</td>
				<td>${row.birthday}</td>
				<td>${row.phone}</td>
				<td>${row.address}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
	<div align=center>
		<a href="${path}/address/write.do" class="myButton">회원등록</a>
	</div>
</body>
</html>