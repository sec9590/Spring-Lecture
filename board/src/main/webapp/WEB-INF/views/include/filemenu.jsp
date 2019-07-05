<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background: white;	
	text-align: center;
	font-family: '빙그레체';
}
nav ul li:hover>ul {
	display: block;
}

nav ul {
	font-size : 20px;
	background-color: #fff;
	font-family: '빙그레체';
	font-weight : bold;
	margin-top: 10px;
	padding: 0 20px;
	list-style: none;
	position: relative;
	display: inline-table;
}

nav ul li {
	float: left;
}

nav ul li:hover {
	border-bottom: 5px solid #369;
	color: #fff;
}

nav ul li a:hover {
	color: #369;
}

nav ul li a {
	display: block;
	padding: 10px 10px;
	color: #000;
	text-decoration: none;
}
</style>
<%@ include file="../include/header.jsp"%>
</head>
<body>
	<nav>
		<ul>
			<li><a class="btn" href="${path }/list.do">게시판</a></li>	
		<c:choose>
			<c:when test = "${sessionScope.userid == null}">
						<li><a class="btn" href="${path }/member/login.do">로그인</a></li>
						</ul>
			</c:when>
			<c:otherwise>
			<li><a class="btn" href="${path }/member/logout.do">로그아웃</a></li>
						</ul>
			<p align="right"><b>${sessionScope.userid }</b> 님이 로그인 중입니다.</p>		
			</c:otherwise>
		</c:choose>		
	</nav>
</body>
</html>

