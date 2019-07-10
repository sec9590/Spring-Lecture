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
</head>
<body>
	<div id="map" style="width: 100%; height: 400px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3214d52dc541ad022a4463064eeff3c&libraries=clusterer"></script>
	<script>
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
        level : 14 // 지도의 확대 레벨
    });

		// 마커 클러스터러를 생성합니다 
		var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
        minLevel: 10, // 클러스터 할 최소 지도 레벨
        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
    });

		
		$.ajax({
			url : 'PublicData.do',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				
				   var positions = data.response.body.items.item;
				   var markers = $(positions).map(function(i, position) {
			            return new kakao.maps.Marker({
			                position : new kakao.maps.LatLng(position.mapy, position.mapx)
			            });	            			       
			            
			            var infowindow = new daum.maps.InfoWindow({
                           	content: position.title // 인포윈도우에 표시할 내용
                       	});
			            
			            daum.maps.event.addListener(markers, 'mouseover', makeOverListener(map, markers, infowindow));     // 인포윈도우 에러 부분
		                daum.maps.event.addListener(markers, 'mouseout', makeOutListener(infowindow));
			        });
				 				   
				         // 클러스터러에 마커들을 추가합니다
			        clusterer.addMarkers(markers);
			   
				}
		});
		
		kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

	        // 현재 지도 레벨에서 1레벨 확대한 레벨
	        var level = map.getLevel()-1;

	        // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
	        map.setLevel(level, {anchor: cluster.getCenter()});
	    });
		

		function makeOverListener(map, markers, infowindow) {
            return function() {
              infowindow.open(map, markers);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function() {
                infowindow.close();
            };
        }

		/* 아래와 같이도 할 수 있습니다 */
		/*
		 for (var i = 0; i < positions.length; i ++) {
		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({
		 map: map, // 마커를 표시할 지도
		 position: positions[i].latlng // 마커의 위치
		 });

		 // 마커에 표시할 인포윈도우를 생성합니다 
		 var infowindow = new kakao.maps.InfoWindow({
		 content: positions[i].content // 인포윈도우에 표시할 내용
		 });

		 // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		 // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		 (function(marker, infowindow) {
		 // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		 kakao.maps.event.addListener(marker, 'mouseover', function() {
		 infowindow.open(map, marker);
		 });

		 // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		 kakao.maps.event.addListener(marker, 'mouseout', function() {
		 infowindow.close();
		 });
		 })(marker, infowindow);
		 }
		 */
		 
	</script>


</body>
</html>