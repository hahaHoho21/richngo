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

<!-- 네이버 지도 API 키값 -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=cd7j520imp&submodules=geocoder"></script>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myrich.css">
	
</head>
<body>
	<!-- 상단 네비바 -->
	<header class="p-3">
		<div class="container">
			<ul class="nav">
				<li><a
					href="http://192.168.10.40:8080/myrich/go"
					target="_self" class="nav-link px-1 text-secondary ">Home</a></li>
				<li><a href="#" class="nav-link px-3 text-secondary">About</a></li>
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
				<a
					href="http://192.168.10.40:8080/myrich/login"
					target="_self">
				<button type="button" class="btn">Login</button></a>
				<a
					href="http://192.168.10.40:8080/myrich/agree"
					target="_self">
				<button type="button" class="btn btn-warning">Sign-up</button></a>
			</div>
		</div>
	</header>
	<div id="map" style="width: 100%; height: 100%;"></div>

	<!-- 여기부터 슬라이드바 -->
	<div id="mySidebar" class="sidebar">
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
		style="width: 4.5rem;">
		<ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
			<li class="nav-item"><a
				href="http://127.0.0.1:8080/my/c"
				target="_self" class="nav-link py-3 border-bottom"
				aria-current="page" title="Search" data-bs-toggle="tooltip"
				data-bs-placement="right"> <svg class="bi" width="8" height="8"
						role="img" aria-label="Search">
                        <img src="${pageContext.request.contextPath}/resources/images/home_36px.png" alt="home" />
                    </svg>
			</a></li>
			<li><a href="#" class="nav-link py-3 border-bottom"
				title="Filter" data-bs-toggle="tooltip" data-bs-placement="right"
				onclick="openNav()"> <svg class="bi" width="8" height="8"
						role="img" aria-label="Filter">
                        <img src="${pageContext.request.contextPath}/resources/images/filter_24px.png"
							alt="Filter" />
                        <use xlink:href="#speedometer2" />
                    </svg>
			</a></li>
			<li><a href="#" class="nav-link py-3 border-bottom control-btn"
				id="cadastral" type="button"> <svg class="bi" width="8"
						height="8" role="img">
                        <img src="${pageContext.request.contextPath}/resources/images/layers_24px.png"
							alt="layers" />
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
	<!--  -->

	<!--  -->
</body>
 

<!-- 네이버지도의 주소와 좌표 검색 API  -->
<script src="${pageContext.request.contextPath}/resources/js/naverAddressAPI.js"></script>


 <!-- 지도, 마커, 검색후 화면 이동 API -->
<script src="${pageContext.request.contextPath}/resources/js/naverMap.js"></script>
 <!-- 부트스트랩 js  -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

</html>
<script>

</script>


<!-- 
     주소 위도 경도 -
    <div>
        <table>
            <thead>
                <tr>
                    <th>주소</th>
                    <th>위도</th>
                    <th>경도</th>
                </tr>
            </thead>
            <tbody id="mapList"></tbody>
        </table>
    </div>
 -->

