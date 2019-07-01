<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style>
table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	width: 70%;
	text-align: center;
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
	text-align:center;
}

table.type09 td {
	padding: 10px;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
	text-align:center;
}
</style>
</head>
<body>
	<center>
		<h2>게시판</h2>
		<hr>
		<br>
		<table class="type09">
			<thead>
				<tr>
					<th scope="cols">번호</th>
					<th scope="cols">제목</th>
					<th scope="cols">작성자</th>
					<th scope="cols">작성일</th>
					<th scope="cols">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${list}">
					<tr>
						<th scope="row">${row.bno}</th>
						<td><a href="${path}//detail.do?bno=${row.bno}">${row.title }</td>
						<td>${row.writer }</td>
						<td>${row.regdate }</td>
						<td>${row.viewcnt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</center>
</body>
</html>