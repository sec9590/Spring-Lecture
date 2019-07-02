<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../include/header.jsp"%>
<style>
iframe {
width:600px;
height:600px;
border:1px solid;
}
</style>
<body>
	<%@ include file="../include/filemenu.jsp"%>
	<hr><br>
	<form method="post" id="form1" action="${path }/upload/uploadForm" enctype="multipart/form-data" target="iframe1">
		<input type="file" name="file"/> <input type="submit" value="업로드"/>
	</form>
	<br><br>
	<!-- target을 주지않으면 페이지가 넘어가므로, target을 주어 iframe에 표시 -->
	<iframe name="iframe1"></iframe>
</body>
</html>