<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../../include/header.jsp"%>
<script>
	$(function() {
		$("#btnUpdate").click(function() {
			document.form1.action = "${path }/shop/product/update.do";
			document.form1.submit();
		});

		$("#btnDelete").click(function() {
			if (confirm("삭제하시겠습니까?")) {
				document.form1.action = "${path }/shop/product/delete.do";
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
	border: 2px solid #369;
	display: inline-block;
	cursor: pointer;
	color: black;
	font-family: "빙그레체" ";
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
	font-weight: bold;
}

/* Styles the submit hover */
.submit:hover {
	color: #fff;
	background-color: #369;
	opacity: 0.9;
	font-weight: bold;
}
</style>

</head>
<body>
	<%@ include file="../../include/filemenu.jsp"%>
	<hr>
	<h2>상세화면</h2>
	<hr>
	<br>
	<form name="form1" method="post" enctype="multipart/form-data">
		<div>
			<label></label> <input type="text" name="product_id"
				value="${dto.product_id}" readonly="readonly">
		</div>
		<div>
			<label></label> <input type="text" name="product_name"
				placeholder="상품이름" value="${dto.product_name}">
		</div>
		<div>
			<label></label> <input type="text" name="price" placeholder="상품가격"
				value="${dto.price}">
		</div>
		<div>
			<label></label>
			<textarea name="description" cols="40" rows="8">${dto.description}</textarea>
		</div>
		<br>
		<div>
			<input type="file" name="file" />
		</div>
		<input type="button" value="수정" class="submit" id="btnUpdate">&nbsp;&nbsp;
		<input type="button" class="submit" value="삭제" id="btnDelete">
	</form>
	<br>
	<br>

	<br>
	<br>
</body>
</html>