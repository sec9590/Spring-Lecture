<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>
	$(function() {
		$("#btnAdd").click(function() {
			location.href = "${path}/write.do";
		});
	});
</script>
<style>
body {
	font-family: '빙그레체';
}

table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	width: 70%;
	text-align: center;
	font-family: '빙그레체';
	font-size: 15px;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: center;
	color: #369;
	border-bottom: 3px solid #036;
	text-align: center;
}

table.type09 tbody th {
	padding: 10px;
	font-weight: bold;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
	text-align: center;
}

table.type09 td {
	padding: 10px;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
	text-align: center;
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: #369;
	text-decoration: solid;
	font-weight: bold;
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
<%@ include file="../include/filemenu.jsp"%>
	<center>
		<h2>게시판목록</h2>
		<hr>
		<br>
		<table class="type09">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>최근수정날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}">
					<tr>
						<th>${row.bno}</th>
						<td><a href="${path}/detail.do?bno=${row.bno}">${row.title }</a></td>
						<td>${row.writer }</td>
						<td>${row.regdate }</td>
						<td>${row.viewcnt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<br><br>
		<button type="button" class="myButton" id="btnAdd">게시물등록</button>
	</center>
</body>
</html>