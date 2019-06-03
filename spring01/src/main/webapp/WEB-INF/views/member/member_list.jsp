<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr, td {
	text-align: center;
	font-weight : bold;
}

.button {
	border: 1px solid powderblue;
	background: white;
}

.button:hover {
	background: powderblue;
	font-weight: bold;
}

input[type=submit] {
	width: 5em;
	height: 2.5em;
	font-weight: bold;
	font-size: 10pt;
	background: powderblue;
}

.list {
	text-decoration: none;
	color: steelblue;
	font-weight: bold;
}

a:hover {
	color: pink;
}

a {
	text-decoration: none;
	font-weight: bold;
	color: black;
}
</style>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<hr>
	<h2>회원 목록</h2>
	
	<table border=1 align=center style="border-collapse: collapse;"
		width=600>
		<tr height=30 style="background: powderblue">
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>가입일자</th>
			<th></th>
		</tr>
			<c:forEach var="row" items="${list}">
				<tr>
					<td>${row.userid}</td>
					<td><a href="${path}/member/view.do?userid=${userid}">${row.name}</a>
					</td>
					<td>${row.email}</td>
					<td>${row.join_date}</td>
					<td><input class="button" type="button" value="수정" name="B2"
						onClick="location.href='MemberProcServlet?action=update&id=${member.id}'" />
						&nbsp;<input class="button" type="button" value="삭제" name="B2"
						onClick="location.href='MemberProcServlet?action=delete&id=${member.id}'" />
					</td>
				</tr>
			</c:forEach>
	</table>
	<br>
	<br>
	<input type="button" value="회원등록"	onclick="location.href='${path}/member/write.do'">
</body>
</html>