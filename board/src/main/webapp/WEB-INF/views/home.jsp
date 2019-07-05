<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<%@ include file="include/header.jsp"%>
</head>
<body>
	<%@ include file="include/filemenu.jsp"%>
	<c:if test="${message == 'success' }">
	<h3>${sessionScope.name }(${sessionScope.userid })님 환영합니다.</h3>
	</c:if>	
</body>
</html>
