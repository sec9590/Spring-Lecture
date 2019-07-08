<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h3 {
	color: blue;
}
</style>
<script src="resources/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3214d52dc541ad022a4463064eeff3c"></script>
</head>
<body>
<script>
	daum.maps.event.addListener(marker, 'click', function() {
		$.ajax({
			url : 'PublicData.do',
			type : 'get',
			data : {
				"contentId" : contentid,
				"contentTypeId" : contenttypeid
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				console.log(data.response.body.items.item);
				var myItem = data.response.body.items.item;

				var output = '';
				output += '<h4>' + myItem.treatmenu + '</h4>';
				$('#window').html(output);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				alert("Status: " + textStatus);
				alert("Error: " + errorThrown);
			}
		});
	});
</script>
</body>
</html>