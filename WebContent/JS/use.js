// 이용안내 페이지 JavaScript
var mapContainer = document.getElementById('map');
var mapOptions = {
	center : new kakao.maps.LatLng(37.499440, 127.035905),
	level : 3
};

var map = new kakao.maps.Map(mapContainer, mapOptions);

// 마커가 표시될 위치입니다 
var markerPosition = new kakao.maps.LatLng(37.499440, 127.035905);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
	position : markerPosition,
	clickable : true
// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 마커에 클릭이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'click', function() {
	window.navigator.geolocation.getCurrentPosition( function(position) {
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		
		// 네이버 길 찾기 교통 경로로 찾기 띄우기
		window.open("http://map.naver.com/index.nhn?slng="+lng+"&slat="+lat+"&stext=현재 위치&elng=127.035905&elat=37.499440&etext=왈왈 호텔&menu=route&pathType=1");
	})
	
});
