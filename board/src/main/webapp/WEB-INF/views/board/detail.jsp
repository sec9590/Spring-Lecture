<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1.0">
<title>게시물등록</title>
<%@ include file="../include/header.jsp"%>
<script>
$(document).ready(function() {
	
	listReply();
	
	$("#btnReply").click(function() {
		var replytext = $("#replytext").val();
		var bno = "${vo.bno}";
		var param="replytext=" + replytext + "&bno=" + bno;
		$.ajax({
			type:"post",
			url:"${path}/reply/insert.do",
			data : param,
			success: function(){
				alert('댓글이 등록되었습니다. ');				
			},			
			complete : function(){
				alert('댓글이 등록되었습니다. ');
				listReply();
			}
		});		
	});
	
	$("#btnUpdate").click(function() {
		document.form1.action = "${path }/update.do";
		document.form1.submit();
	});

	$("#btnDelete").click(function() {
		if (confirm("삭제하시겠습니까?")) {
			document.form1.action = "${path }/delete.do";
			document.form1.submit();
		}
	});
	$("#btnList").click(function() {
			document.form1.action = "${path}/list.do?curPage=${curPage}&searchOption=${searchOption}&keyword=${keyword}"
	});
});

function listReply(){
	$.ajax({
		type:"get",
		url:"${path}/reply/list.do?bno=${vo.bno}",
		success : function(result){			
			$("#listReply").html(result);
		}
	});
}

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
<%@ include file="../include/filemenu.jsp"%>
	<center>
	<h2>게시물 상세화면</h2>
	<hr>
	<br>
	<div>
		<form name="form1" method="post" action="${path }/update.do">
			<div>
				<input type="text" name="bno" value="${vo.bno }" readonly="readonly">
			</div>
			<div>
				<input type="text" name="viewcnt" value="${vo.viewcnt }" readonly="readonly">
			</div>
			<div>
				<input type="text"  name="title" value=${vo.title }>
			</div>
			<div>
				<input type="text" name="writer" value=${vo.writer } readonly="readonly">
			</div>		
			<div>
				<textarea name="content" cols="40" rows="8" >${vo.content }</textarea>
			</div>
			<c:if test="${sessionScope.name  == vo.writer }">
			<input type="button" value="수정" class="submit" id="btnUpdate">&nbsp;&nbsp;
		    <input type="button" class="submit" value="삭제" id="btnDelete">
		    </c:if>
		    <c:if test="${sessionScope.name  != vo.writer || sessionScope.name == null}">			
		    <input type="button" class="submit" value="목록" id="btnList">
		    </c:if>
		</form>
	</div>
	<div>
	<br>
	  <c:if test="${sessionScope.name != null}">			
		   <textarea name="replytext" id="replytext" cols="40" rows="2" placeholder="댓글을 작성해주세요"></textarea>
		   <br>
		   <input type="button" class="submit" value="댓글작성" id="btnReply"> 
	  </c:if>
	</div>
	<div id="listReply"></div>
	</center>
</body>
</html>