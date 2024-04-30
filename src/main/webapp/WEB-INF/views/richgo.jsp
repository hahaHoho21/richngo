<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<!-- jquery 연동 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<!-- 카카오 지도 API 키값 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0a112a46794f85cabd26971f45921aa2&libraries=services,clusterer"></script>

<!-- HTML link 태그를 활용한 BootStrap 연동 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<!-- 부트스트랩 css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- myrich css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myrich.css">
<!-- kakaoSerchPlaces css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/kakaoSerchPlaces.css">


</head>
<body>
	<!-- 상단 네비바 -->
	<header class="p-3">
		<div class="container">
			<ul class="nav">
				<li><a href="${pageContext.request.contextPath}/go"
					target="_self" class="nav-link px-1 text-secondary ">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/board"
					class="nav-link px-3 text-secondary">문의하기</a></li>
			</ul>
			<div class="d-flex flex-wrap justify-content-center" id="topnav">
				<!-- 지도 검색 -->
				<div class="search">
					<form class="col-12">
						<input id="address" type="text" placeholder="검색할 주소"
							class="form-control form-control-dark"> <input
							id="submit" type="button" value="주소검색">
					</form>
				</div>
			</div>
			<div class="text-end">
				<a href="${pageContext.request.contextPath}/login" target="_self">
					<button type="button" class="btn">Login</button>
				</a> <a href="${pageContext.request.contextPath}/agree" target="_self">
					<button type="button" class="btn btn-warning">Sign-up</button>
				</a>
			</div>
		</div>
	</header>
	<!-- 카카오 지도 -->
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden; z-index: 100"></div>

		<div id="menu_wrap" class="bg_white" style="z-index: 100">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="역삼역" id="keyword" size="20">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
	</script>

	<!-- 여기부터 슬라이드바 -->
	<div id="mySidebar" class="sidebar" style="z-index: 100;">
		<a href="#" class="closebtn" onclick="closeNav()">x</a> <a href="#"
			class="nav-link link-dark" aria-current="page"> <svg
				class="bi me-2" width="16" height="16" id="slide">
                <use xlink:href="#home"></use>
            </svg>
			<table class="sinfo">예정(검색된 건물정보)
			</table>
		</a>
		<hr>
		<a href="#" class="nav-link link-dark"> <svg class="bi me-2"
				width="16" height="16">
                <use xlink:href="#speedometer2"></use>
            </svg> 예정(네비바)
		</a>
		<hr>

		<a href="#" class="nav-link link-dark"> <svg class="bi me-2"
				width="16" height="16">
                <use xlink:href="#table"></use>
            </svg> 예정(실거래가)
		</a>
		<hr>

		<a href="#" class="nav-link link-dark"> <svg class="bi me-2"
				width="16" height="16">
                <use xlink:href="#grid"></use>
            </svg> 예정(건축물대장)
		</a>
		<hr>

		<a href="#" class="nav-link link-dark"> <svg class="bi me-2"
				width="16" height="16">
                <use xlink:href="#people-circle"></use>
            </svg> 예정(공시가격)
		</a>
		<hr>

	</div>

	<script>
		// 슬라이드바 스크립트
		function openNav() {
			document.getElementById("mySidebar").style.width = "360px";
			// document.getElementById("mySidebar").style.width = "360px";
		}

		function closeNav() {
			document.getElementById("mySidebar").style.width = "0";
			// document.getElementById("mySidebar").style.width = "0";
		}
	</script>

	<!-- 사이드바 -->
	<div class="b-example-divider"></div>
	<div id="mainSidebar" class="d-flex flex-column flex-shrink-0 bg-light"
		style="width: 4.5rem; z-index: 100;">
		<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
			<li class="nav-item"><a
				href="${pageContext.request.contextPath}/go" target="_self"
				class="nav-link py-3 border-bottom" aria-current="page"
				title="Search" data-bs-toggle="tooltip" data-bs-placement="right">
					<svg class="bi" width="8" height="8" role="img" aria-label="Search">
                        <img
							src="${pageContext.request.contextPath}/resources/images/home_36px.png"
							alt="home" style="width: 26px; height: 26px" />
                    </svg>
			</a></li>
			<li><a href="#" class="nav-link py-3 border-bottom"
				title="Filter" data-bs-toggle="tooltip" data-bs-placement="right"
				onclick="openNav()"> <svg class="bi" width="8" height="8"
						role="img" aria-label="Filter">
                        <img
							src="${pageContext.request.contextPath}/resources/images/filter_24px.png"
							alt="Filter" />
                        <use xlink:href="#speedometer2" />
                    </svg>
			</a></li>
			<li><a href="#" class="nav-link py-3 border-bottom control-btn"
				id="cadastral" type="button"
				onclick="setOverlayMapTypeId('use_district')"> <svg class="bi"
						width="8" height="8" role="img">
						<img
							src="${pageContext.request.contextPath}/resources/images/layers_24_1px.png"
							alt="layers" style="width: 30px; height: 30px" />
                        <use xlink:href="#speedometer2" />
                    </svg>
			</a></li>
		</ul>
		<div class="dropdown border-top">
			<a href="#"
				class="d-flex align-items-center justify-content-center p-3 link-dark text-decoration-none dropdown-toggle"
				id="dropdownUser3" data-bs-toggle="dropdown" aria-expanded="false">
				<img src="https://github.com/mdo.png" alt="mdo" width="24"
				height="24" class="rounded-circle">
			</a>
			<ul class="dropdown-menu text-small shadow"
				aria-labelledby="dropdownUser3">
				<li><a class="dropdown-item" href="#">Settings</a></li>
				<li><a class="dropdown-item" href="#">Profile</a></li>
				<li>
					<hr class="dropdown-divider">
				</li>
				<li><a class="dropdown-item" href="#">Sign out</a></li>
			</ul>
		</div>
	</div>
</body>
<!-- 카카오지도의 주소와 좌표 검색 API  -->
<script
	src="${pageContext.request.contextPath}/resources/js/KakaoAPI.js"></script>

<script>
	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
		center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
		level : 14
	// 지도의 확대 레벨 
	});

	// 마커 클러스터러를 생성합니다 
	var clusterer = new kakao.maps.MarkerClusterer({
		map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		minLevel : 10
	// 클러스터 할 최소 지도 레벨 
	});

	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	$.get("/download/web/data/chicken.json", function(data) {
		// 데이터에서 좌표 값을 가지고 마커를 표시합니다
		// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
		var markers = $(data.positions).map(function(i, position) {
			return new kakao.maps.Marker({
				position : new kakao.maps.LatLng(position.lat, position.lng)
			});
		});

		// 클러스터러에 마커들을 추가합니다
		clusterer.addMarkers(markers);
	});
</script>

<!-- 부트스트랩 js  -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</html>