<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<style>
body {
	font-family: '빙그레체';
}

table.type09 {
	width:400px;
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	text-align: center;
	font-family: '빙그레체';
	font-size: 15px;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: center;
	color: #369;
	border-bottom: 3px solid #036;
	text-align: center;
}

table.type09 tbody th {
	padding: 10px;
	font-weight: bold;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
	text-align: center;
}

table.type09 td {
	padding: 10px;
	vertical-align: center;
	border-bottom: 1px solid #ccc;
	text-align: center;
}

a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: #369;
	text-decoration: solid;
	font-weight: bold;
}

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

select {
	width: 150px;
	padding: .8em .5em;
	font-family: inherit;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border: 1px solid #999;
	border-radius: 0px;
}

select::-ms-expand {
	/* for IE 11 */
	display: none;
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
	height: 36px;
	background-color: #efefef;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border: 1px solid #dedede;	
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
	width: 50px;
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
<br><br>
	<center>
		<table class="type09">		
			<tbody>
				<c:forEach var="row" items="${list}">
					<tr>						
						<td>${row.replyer } (${row.regdate }) ${row.replytext }</td>
					</tr>
				</c:forEach>			
			</tbody>
		</table>
		<br>
		<br>		
	</center>
</body>
</html>