<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
body {
	background : #EFF8FB;
	padding: 45px;
	text-align: center;
	font-family: '빙그레체';
}

h1 {
	color: #c0c0c0;
	font-weight: 100;
}

.btn {
	color: white;
	font-weight:bold;
	background: #0489B1;
	padding: 10px 20px;
	font-size: 12px;
	text-decoration: none;
	letter-spacing: 2px;
	text-transform: uppercase;
	margin:10px;
	
}

.btn:hover {
	border: 1px solid;
	background: #EFF8FB;
	padding: 20px 20px; #000;
	color: #1b1b1b;
}

</style>

</head>
<body>

	<div>
	<a class="btn" href="${path}/">Home</a>
	<a class="btn" href="${path}/gugu.do?dan=3">Gugu</a>
	<a class="btn" href="${path}/test.do">Test</a>
	<a class="btn" href="${path}/member/list.do">Member</a>
	</div>
	<br>
	<br>
</body>
</html>

