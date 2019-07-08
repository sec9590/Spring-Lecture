<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp"%>
<script>
	$(function() {
		$("#btnAdd").click(function() {
			location.href = "${path}/write.do";
		});
	});
	
	function list(page){
		location.href = "${path}/list.do?curPage="+page+"&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title}</a></td>
	}
	
</script>
<style>
body {
	font-family: '빙그레체';
}

table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	width: 70%;
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
	width: 200px;
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
	<%@ include file="../include/filemenu.jsp"%>
	<center>
		<h2>게시판목록</h2>
		<hr>
		<br>
		<div>
			<form name="form1" method="post" action="${path }/list.do">
				<select name="searchOption">
					<option value="all" <c:out value="${map.searchOption =='all'? 'selected':'' }"/>>제목+이름+내용</option>
					<option value="wrtier" <c:out value="${map.searchOption =='writer'? 'selected':'' }"/>>이름</option>
						<option value="content" <c:out value="${map.searchOption =='content'? 'selected':'' }"/>>내용</option>
							<option value="title" <c:out value="${map.searchOption =='title'? 'selected':'' }"/>>제목</option>
				</select> 
				<input type="text" name="keyword" value="${map.keyword }" placeholder="검색">
				<input id="submit" name="submit" type="submit" value="검색">
				<input id="submit" name="cancel" type="reset" value="취소" />
			</form>
		</div>
		<br>
		<b>${map.count }</b>개의 게시물이 있습니다.
		<br><br>
		<table class="type09">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>최근수정날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${map.list}">
					<tr>
						<th>${row.bno}</th>
						<td><a href="${path}/detail.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">${row.title }</a></td>
						<td>${row.writer }</td>
						<td>${row.regdate }</td>
						<td>${row.viewcnt }</td>
					</tr>
				</c:forEach>			
			</tbody>
			<tfoot>
				<tr>
					<th colspan="5">
						<c:if test="${map.boardPager.curBlock > 1 }">
							<a href="javascript:list('1')">[처음]</a>
						</c:if>
						
						<c:if test="${map.boardPager.curBlock > 1 }">
							<a href="javascript:list('${map.boardPager.prevPage }')">[이전]</a>
						</c:if>
						
						<c:forEach var="num" begin="${map.boardPager.blockBegin }" end="${map.boardPager.blockEnd }">
							<c:choose>
								<c:when test="${num==map.boardPager.curPage }">
									<span style="color:red">${num }</span>&nbsp;
								</c:when>
								<c:otherwise>
									<a href="javascript:list('${num }')">${num }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${map.boardPager.curBlock <= map.boardPager.totBlock }">
							<a href="javascript:list('${map.boardPager.nextPage }')">[다음]</a>
						</c:if>
						
						<c:if test="${map.boardPager.curBlock <= map.boardPager.totPage }">
							<a href="javascript:list('${map.boardPager.totPage}')">[끝]</a>
						</c:if>
					</th>
				</tr>	
					
		</table>
		<br>
		<br>
		<c:if test="${sessionScope.userid !=null }">
			<button type="button" class="myButton" id="btnAdd">게시물등록</button>
		</c:if>			
	</center>
</body>
</html>