<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<title>게시물등록</title>
<%@ include file="../include/header.jsp"%>
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

/* Styles the text boxes */
input, textarea, file {
	width: 400px;
	height: 27px;
	background-color: #efefef;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border: 1px solid #dedede;
	padding: 10px;
	margin-top: 5px;
	font-size: 0.9em;
	color: #3a3a3a;
}

input:focus, textarea:focus {
	border: 1px solid #369;
}
/* Styles the text area boxes (message field) */
textarea {
	height: 213px;
	background-color: #efefef;
}

/* Styles the submit button */
#submit {
	/* background:url(images/submit.png); */
	width: 80px;
	height: 40px;
	text-align: center;
	/* text-indent:-9999px; */
	border: none;
	margin-top: 20px;
	cursor: pointer;
}

/* Styles the submit hover */
#submit:hover {
	color: #fff;
	background-color: #369;
	opacity: 0.9;
}
</style>
</head>
<body>
	<%@ include file="../include/filemenu.jsp"%>
	<center>
		<h2>게시물등록</h2>
		<hr>
		<br>
		<div>
			<form name="form1" method="post" action="${path }/insert.do">			
				<div>
					<input type="text" placeholder="제목" name="title">
				</div>
				<div>
					<input type="text" placeholder="작성자" name="writer" >
				</div>
				<div>
					<textarea name="content" cols="40" rows="8" placeholder="내용"></textarea>
				</div>
				<input id="submit" name="submit" type="submit" value="등록"> <input
					id="submit" name="cancel" type="reset" value="취소" />
			</form>
		</div>
	</center>
</body>
</html>