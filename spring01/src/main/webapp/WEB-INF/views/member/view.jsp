<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<%@ include file="../include/header.jsp"%>
<script>
$(function(){
	$("#btnUpdate").click(function(){
		document.form1.action="${path}/member/update.do";
		document.form1.submit();
	});
	
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
		document.form1.action="${path}/member/delete.do";
		document.form1.submit();
		}
	});	
});
</script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
	<h2>회원정보</h2>
	<br>
		<div style="width:300px; margin:auto">
				<form name="form1" method="post" action="${path }/member/insert.do">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userid" value="${dto.userid }" readonly maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호입력하세요." name="password" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" value=${dto.name } class="form-control" placeholder="이름" name="name" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control"  value=${dto.email } placeholder="이메일" name="email" maxlength="20">
					</div>
					<input type="button" class="myButton" value="수정" id="btnUpdate">&nbsp;&nbsp;<input type="button" class="myButton"  value="삭제" id="btnDelete">
				</form>
			</div>
</body>
</html>