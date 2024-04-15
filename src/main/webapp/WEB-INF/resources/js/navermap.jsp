<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map Page</title>
<!-- jQuery 라이브러리 포함 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Naver Maps API -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd7j520imp"></script>
</head>
<body>
	<input type="text" id="address" placeholder="주소를 입력하세요">
	<button id="submit">검색</button>
	<table id="mapList">
		<tr>
			<th>주소</th>
			<th>위도</th>
			<th>경도</th>
		</tr>
	</table>
	<div id="map" style="width: 500px; height: 400px;"></div>

	<!-- JavaScript 코드 -->
	<script type="text/javascript">
        $(document).ready(function () {
            //지도를 그려주는 함수 실행
            selectMapList();

            //검색한 주소의 정보를 insertAddress 함수로 넘겨준다.
            function searchAddressToCoordinate(address) {
                naver.maps.Service.geocode({
                    query: address
                }, function (status, response) {
                    if (status === naver.maps.Service.Status.ERROR) {
                        return alert('Something Wrong!');
                    }
                    if (response.v2.meta.totalCount === 0) {
                        return alert('올바른 주소를 입력해주세요.');
                    }
                    var htmlAddresses = [],
                        item = response.v2.addresses[0],
                        point = new naver.maps.Point(item.x, item.y);
                    if (item.roadAddress) {
                        htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
                    }
                    if (item.jibunAddress) {
                        htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
                    }
                    if (item.englishAddress) {
                        htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
                    }
                    insertAddress(item.roadAddress, item.x, item.y);
                });
            }

            // 주소 검색의 이벤트
            $('#address').on('keydown', function (e) {
                var keyCode = e.which;
                if (keyCode === 13) { // Enter Key
                    searchAddressToCoordinate($('#address').val());
                }
            });
            $('#submit').on('click', function (e) {
                e.preventDefault();
                searchAddressToCoordinate($('#address').val());
            });

            // 검색정보 작성과 지도 마커 기능.
            function insertAddress(address, latitude, longitude) {
                var mapList = "";
                mapList += "<tr>"
                mapList += "    <td>" + address + "</td>"
                mapList += "    <td>" + latitude + "</td>"
                mapList += "    <td>" + longitude + "</td>"
                mapList += "</tr>"

                $('#mapList').append(mapList);

                var map = new naver.maps.Map('map', {
                    center: new naver.maps.LatLng(longitude, latitude),
                    zoom: 17
                });
                var marker = new naver.maps.Marker({
                    map: map,
                    position: new naver.maps.LatLng(longitude, latitude),
                });
            }

            //지도를 그려주는 함수
            function selectMapList() {
                var map = new naver.maps.Map('map', {
                    center: new naver.maps.LatLng(37.4985248, 127.0326343),
                    zoom: 17,
                    mapTypeControl: true
                });
            }

            // 지도를 이동하게 해주는 함수
            function moveMap(len, lat) {
                var mapOptions = {
                    center: new naver.maps.LatLng(len, lat),
                    zoom: 17,
                    mapTypeControl: true
                };
                var map = new naver.maps.Map('map', mapOptions);
                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(len, lat),
                    map: map
                });
            }
        });
    </script>
</body>
</html>
