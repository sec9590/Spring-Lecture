<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<script>
	$(function() {
		$("#btnAdd").click(function() {
			location.href = "${path}/shop/product/write.do";
		});
	});
</script>
<style>
table.type09 {
	border-collapse: collapse;
	text-align: center;
	valign: middle;
	line-height: 1.5;
	width:50%;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	font-size: 17pt; 
	color: #369;
	border-bottom: 3px solid #036;
	vertical-align: top;
}

table.type09 tbody th {	
	padding: 10px;
	font-weight: bold;
	border-bottom: 1px solid #ccc;
	valign: middle;
	background: #f3f6f7;
}

table.type09 td {
	padding: 10px;
	valign: middle;
	font-size: 17pt;
	border-bottom: 1px solid #ccc;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: black;
}

a:hover{
	color:#369;
}

.myButton {
	background-color: transparent;
	-moz-border-radius: 18px;
	-webkit-border-radius: 18px;
	border-radius: 18px;
	border: 2px solid #369;
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
	background-color: #369;
	font-weight: bold;
	color: white;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>
</head>
<body>
	<%@ include file="../../include/filemenu.jsp"%>
	<hr>
	<h2>상품목록</h2>
	<hr>
	<br>
	<table class="type09" align=center>
		<thead>
			<tr>
				<th valign="middle">상품ID</th>
				<th valign="middle"></th>
				<th valign="middle">상품명</th>
				<th valign="middle">가격</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${list}">
				<tr>
					<td valign="middle">${row.product_id}</td>
					<td valign="middle"><img
						src="${path}/resources/images/${row.picture_url}" width="50" height="50"></td>
					<td valign="middle"><a
						href="${path}/shop/product/view.do?product_id=${row.product_id}">${row.product_name}</a></td>
					<td valign="middle"><fmt:formatNumber
							value="${row.price }" pattern="#,###" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br>
	<button type="button" class="myButton" id="btnAdd">상품등록</button>
	<br><br>
</body>
</html>