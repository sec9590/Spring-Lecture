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
</head>
<body>
	<%@ include file="../include/menu.jsp"%>
	<hr>
	<h2>회원정보</h2>
	<form name="form1" method="post">
		<table border="1" width=400px align=center>
			<tr>
				<td>아이디</td>
				<td><input name="userid" value="${dto.userid }" readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input value=${dto.name } name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input value=${dto.email } name="email"></td>
			</tr>
			<tr>
			<td colspan="2"><input type="button" value="수정" id="btnUpdate">&nbsp;&nbsp;<input type="button" value="삭제" id="btnDelete"></td>
			</tr>
		</table>
	</form>
</body>
</html>