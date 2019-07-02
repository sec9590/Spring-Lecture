<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<style>
.myButton {
	background-color: transparent;
	-moz-border-radius: 18px;
	-webkit-border-radius: 18px;
	border-radius: 18px;
	border: 2px solid #369;
	display: inline-block;
	cursor: pointer;
	color: black;
	font-family: '빙그레체';
	font-size: 15px;
	font-weight: bold;
	padding: 10px 10px;
	text-decoration: none;
}

.myButton:hover {
	background-color: #369;
	font-weight: bold;
	color: white;
}

.myButton:active {
	position: relative;
	top: 1px;
}
 /*
Code Author: Mark-Anthony Karam
Host: mark-anthony.ca
*/
/* Centres the page (this could be container)*/
.body {
    display:block;
    margin:0 auto;
    width:576px;
    font-family: '빙그레체';
    font-size: 16px;
    color: #999;
}


/* Labels are titles for the text fields. You can use a placeholder instead if you like*/
label 
{
    display:block;
    margin-top:20px;
    letter-spacing:2px;
}

/* Centres the form within the page */
form 
{
    margin:0 auto;
    width:459px;
}

/* Styles the text boxes */
input, textarea, file {
	width:439px;
	height:27px;
	background-color:#efefef;
	border-radius:5px;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;
	border:1px solid #dedede;
	padding:10px;
	margin-top:3px;
	font-size:0.9em;
	color:#3a3a3a;
}

	input:focus, textarea:focus {
		border:1px solid #97d6eb;
	}

/* Styles the text area boxes (message field) */	
textarea 
{
	height:213px;
	background-color: #efefef;
}


/* Styles the submit button */
#submit {
	/* background:url(images/submit.png); */
	width:80px;
	height:40px;
	text-align: center;
	/* text-indent:-9999px; */
	border:none;
	margin-top:20px;
	cursor:pointer;	
	font-weight:bold;
}

/* Styles the submit hover */	
#submit:hover {
	color:#fff;
	background-color: #369;
	opacity:0.9;
	font-weight:bold;
}

/* Styles the cancel button*/	
#cancel {
	/* background:url(images/cancel.png); */
	width:127px;
	height:28px;
	text-align: center;
	/* text-indent:-9999px; */
	border:none;
	margin-top:20px;
	cursor:pointer;
}

/* Styles the cancel hover */
#cancel:hover {
	color:#fff;
	background-color: #000;
	opacity:0.9;
}
</style>
</head>
<body>
	<%@ include file="../../include/filemenu.jsp"%>
	<hr>
	<h2>상품등록</h2>
	<hr>
	<br>
	<form name="form1" method="post" enctype="multipart/form-data" action="${path }/shop/product/insert.do">
	<div>
		<label></label>
		<input type="text" name="product_name" placeholder="상품이름">
	</div>
	<div>
		<label></label>
		<input type="text" name="price" placeholder="상품가격">
	</div>
	<div>
		<label></label>
		<textarea name="description" cols="40" rows="8" placeholder="상품설명"></textarea>
	</div><br>
	<div>
		<input type="file" name="file"/> 
	</div>          
		<input id="submit" name="submit" type="submit" value="등록">
		<input id="submit" name="reset" type="reset" value="취소">
	</form>
	<br>
	<br>
	
	<br>
	<br>
</body>
</html>