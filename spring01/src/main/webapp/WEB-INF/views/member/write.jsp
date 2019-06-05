<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<title>회원등록</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ include file="../include/header.jsp"%>
<style>
.myButton {
	background-color:transparent;
	-moz-border-radius:18px;
	-webkit-border-radius:18px;
	border-radius:18px;
	border:2px solid #ddd;
	display:inline-block;
	cursor:pointer;
	color:black;
	font-family:'빙그레체';
	font-size:15px;
	font-weight:bold;
	padding:7px 10px;
	text-decoration:none;
}
.myButton:hover {
	background-color:#ddd;
	font-weight : bold;
	color : #white;
	
}
.myButton:active {
	position:relative;
	top:1px;
}
h2{
font-family:"빙그레체";
font-weight:bold;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<hr>
	<h2>회원등록</h2>
	<br>
			<div style="width:300px; margin:auto">
				<form name="form1" method="post" action="${path }/member/insert.do">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userid" >
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="password" >
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="name" >
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이메일" name="email" >
					</div>
					<input type="submit" class="myButton" value="등록">&nbsp;&nbsp;<input type="reset" class="myButton"  value="취소">
				</form>
			</div>
</body>
</html>