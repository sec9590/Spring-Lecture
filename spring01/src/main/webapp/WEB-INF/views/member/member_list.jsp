<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
	color :black;
	text-decoration:none;
}
a:hover{
	font-weight:bold;
	color : #74D36D
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
	background-color:transparent;
	-moz-border-radius:18px;
	-webkit-border-radius:18px;
	border-radius:18px;
	border:1px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#44c767;
	font-family:'빙그레체';
	font-size:15px;
	font-weight:bold;
	padding:10px 10px;
	text-decoration:none;
}
.myButton:hover {
	background-color:#44c767;
	font-weight : bold;
	color : white;
	
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<hr>
	<h2>회원 목록</h2>

	<table class="wp-table" align=center>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>가입일자</th>
		</tr>
		<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.userid}</td>
				<td><a href="${path}/member/view.do?userid=${row.userid}">${row.name}</a>
				</td>
				<td>${row.email}</td>
				<td><fmt:formatDate value="${row.join_date}"
						pattern="yyyy-MM-dd HH:mm" /></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<br>
		<a href="${path}/member/write.do" class="myButton">회원등록</a>
</body>
</html>