<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<div style="text-align: center; font-size: 30px; margin-bottom: 30px;" > 위치 </div>

<!-- 구글지도 -->
<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3258.951045227373!2d126.85855321560379!3d35.23258866205228!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35718cea301c6f91%3A0xd60c9a64ef2c2bc1!2zKOyjvCntirjroZzri4nsiqQ!5e0!3m2!1sko!2skr!4v1668737709654!5m2!1sko!2skr" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> -->

<div id="map" style="width:100%;height:350px;"></div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=912cf98bacf67dfbfdcbc38c95ec1762"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=912cf98bacf67dfbfdcbc38c95ec1762&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.2325843, 126.8607419), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.2325843, 126.8607419); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:10px; text-align; font-weight: bold;">(주)트로닉스 <br><a href="https://map.kakao.com/link/map/(주)트로닉스,35.2325843,126.8607419" style="color:blue" target="_blank">큰지도보기 / </a> <a href="https://map.kakao.com/link/to/(주)트로닉스,35.2325843,126.8607419" style="color:blue; text-align: center;" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(35.2325843, 126.8607419); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>

</body>
</html>