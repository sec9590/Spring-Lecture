<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 정보</title>
<%@ include file="../include/header.jsp"%>
<script>
	$(function() {
		$("#btnUpdate").click(function() {
			document.form1.action = "${path}/address/update.do";
			document.form1.submit();
		});

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/address/delete.do";
				document.form1.submit();
			}
		});
	});
</script>
<style>
body {
	font-family: "빙그레체"
}

tr, td {
	text-align: center;
	font-weight: bold;
}

.myButton {
	background-color: transparent;
	-moz-border-radius: 28px;
	-webkit-border-radius: 28px;
	border-radius: 28px;
	border: 2px solid #ddd;
	display: inline-block;
	cursor: pointer;
	color: black;
	font-size: 14px;
	padding: 9px 11px;
	text-decoration: none;
	font-family: "빙그레체";
	font-weight:bold;
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

input[type=text] {
	width: 250px;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: none;
	border-bottom: 2px solid #f1f1f1;
	font-family: "빙그레체";
	font-weight:bold;
}
label {
	font-weight: bold;
	margin: 10px;
}
input:hover, textarea:hover { /* 마우스 올라 올 때 */
	background: aliceblue;
}

input[type=text]:focus, input[type=password]:focus { /* 포커스 받을 때 */
	font-size: 100%;
}
input[type=text]{
font-family: "빙그레체";
	font-weight:bold;
}
</style>
</head>
<body>
	<hr>
	<h2 align=center>주소록 정보</h2>
	<hr>
	<br>
	<form name="form1" method="post">
		<div align=center>
			<label for="name">&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="text" id="name" value="${dto.name }" name="name"><br>
			<br>
			<div style="margin-left: -93px">
					<label for="gender">&nbsp;&nbsp;&nbsp;성별&nbsp;&nbsp;&nbsp;</label>
				<c:if test="${dto.gender eq '남자'}">
					<input type="radio" id="radio-one" name="gender" value="남자" checked />
					<label for="radio-one">남자</label>
					<input type="radio" id="radio-two" name="gender" value="여자" />
					<label for="radio-two">여자</label>
				</c:if>
				<c:if test="${dto.gender eq '여자'}">
					<input type="radio" id="radio-one" name="gender" value="남자" />
					<label for="radio-one">남자</label>
					<input type="radio" id="radio-two" name="gender" value="여자" checked />
					<label for="radio-two">여자</label>
				</c:if>
			</div>
			<br><br> 
			<label for="birthday">생년월일&nbsp;</label> 
			<input type="text" value="${dto.birthday }" id="birthday" name="birthday">
			<br><br> 
			<label for="phone">전화번호&nbsp;</label> 
			<input type="text" value="${dto.phone }" id="phone" name="phone">
			<br><br>
			<label for="address">&nbsp;&nbsp;&nbsp;주소&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="text" value="${dto.address }" id="address"	name="address">
			<br><br> 
			<input type="button" class="myButton" value="수정" id="btnUpdate">&nbsp;&nbsp;
			<input type="button" class="myButton" value="삭제" id="btnDelete">
		</div>
	</form>
</body>
</html>