<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<%@ include file="../include/header.jsp"%>
<script>
	$(function() {
		$("#btnUpdate").click(function() {
			document.form1.action = "${path}/member/update.do";
			document.form1.submit();
		});

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path}/member/delete.do";
				document.form1.submit();
			}
		});
	});
</script>

<style>
.myButton {
	background-color: transparent;
	-moz-border-radius: 18px;
	-webkit-border-radius: 18px;
	border-radius: 18px;
	border: 2px solid #ddd;
	display: inline-block;
	cursor: pointer;
	color: black;
	font-family: '빙그레체';
	font-size: 15px;
	font-weight: bold;
	padding: 7px 10px;
	text-decoration: none;
}

.myButton:hover {
	background-color: #ddd;
	font-weight: bold;
	color: #white;
}

.myButton:active {
	position: relative;
	top: 1px;
}

h2 {
	font-family: "빙그레체";
	font-weight: bold;
}
/* Labels are titles for the text fields. You can use a placeholder instead if you like*/
label {
	display: block;
	margin-top: 20px;
	letter-spacing: 2px;
}

/* Centres the form within the page */
form {
	margin: 0 auto;
	width: 459px;
}

/* Styles the text boxes */
input, textarea, file {
	width: 439px;
	height: 27px;
	background-color: #efefef;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border: 1px solid #dedede;
	padding: 10px;
	margin-top: 3px;
	font-size: 0.9em;
	color: #3a3a3a;
}

input:focus, textarea:focus {
	border: 1px solid #97d6eb;
}

/* Styles the text area boxes (message field) */
textarea {
	height: 213px;
	background-color: #efefef;
}

/* Styles the submit button */
.submit {
	/* background:url(images/submit.png); */
	width: 80px;
	height: 40px;
	text-align: center;
	/* text-indent:-9999px; */
	border: none;
	margin-top: 20px;
}

/* Styles the submit hover */
.submit:hover {
	color: #fff;
	background-color: #74D36D;
	opacity: 0.9;
}
</style>
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<hr>
	<h2>회원정보</h2>
	<br>
	<div style="margin: auto">
		<form name="form1" method="post" action="${path }/member/insert.do">
			<div>
				<input type="text" placeholder="아이디" name="userid"
					value="${dto.userid }" readonly maxlength="20">
			</div>
			<div>
				<input type="password" placeholder="비밀번호입력하세요." name="password"
					maxlength="20">
			</div>
			<div>
				<input type="text" value=${dto.name } placeholder="이름" name="name"
					maxlength="20">
			</div>
			<div>
				<input type="text" value=${dto.email } placeholder="이메일"
					name="email" maxlength="20">
			</div>
			<input type="button" value="수정" class="submit" id="btnUpdate">&nbsp;&nbsp;<input
				type="button" class="submit" value="삭제" id="btnDelete">
		</form>
	</div>
</body>
</html>