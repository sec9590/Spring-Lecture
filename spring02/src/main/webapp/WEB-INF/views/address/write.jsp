<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 쓰기</title>
<%@ include file="../include/header.jsp"%>
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
input[type=text] {
	width: 250px;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	border: none;
	border-bottom: 2px solid #f1f1f1;
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
	<h2 align=center>주소록 쓰기</h2>
	<hr>
	<br>
	<form name="form1" method="post" action="${path }/address/insert.do">
		<div align=center>
			<label for="name">&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<input type="text" id="name" name="name">
			<br><br>
			<div style="margin-left: -93px">
				<label for="gender">&nbsp;&nbsp;&nbsp;성별&nbsp;&nbsp;&nbsp;</label>
				<input	type="radio" id="radio-one" name="gender" value="남자" /> 
				<label for="radio-one">남자</label> 
				<input type="radio" id="radio-two" name="gender" value="여자" /> 
				<label for="radio-two">여자</label>
			</div>
			<br>
			<label for="birthday">생년월일&nbsp;</label>
			<input type="text"	id="birthday" name="birthday"><br><br> 
			<label for="phone">전화번호&nbsp;</label>
			<input type="text" id="phone" name="phone"><br><br>
			<label for="address">&nbsp;&nbsp;&nbsp;주소&nbsp;&nbsp;&nbsp;&nbsp;</label> 
			<input type="text" id="address" name="address"><br><br>
			<input type="submit" class="myButton" value="등록" >
			<input type="reset" class="myButton" value="취소" >
		</div>
	</form>
</body>
</html>