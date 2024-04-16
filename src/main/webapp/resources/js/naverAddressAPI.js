var map = new naver.maps.Map("map", {
  center: new naver.maps.LatLng(37.4985248, 127.0326343),
  zoom: 17,
  mapTypeControl: true
});

var infoWindow = new naver.maps.InfoWindow({
  anchorSkew: true
});

map.setCursor('pointer');

function searchCoordinateToAddress(latlng) {
  infoWindow.close();

  naver.maps.Service.reverseGeocode({
    coords: latlng,
    orders: [
      naver.maps.Service.OrderType.ADDR,
      naver.maps.Service.OrderType.ROAD_ADDR
    ].join(',')
  }, function (status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
      return alert('Something Wrong!');
    }

    var items = response.v2.results,
      address = '',
      htmlAddresses = [];

    for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
      item = items[i];
      address = makeAddress(item) || '';
      addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';

      htmlAddresses.push((i + 1) + '. ' + addrType + ' ' + address);
    }

    infoWindow.setContent([
      '<div style="padding:10px;min-width:200px;line-height:150%;">',
      '<h4 style="margin-top:5px;">Search Coordinates</h4><br />',
      htmlAddresses.join('<br />'),
      '</div>'
    ].join('\n'));

    infoWindow.open(map, latlng);
  });
}

function searchAddressToCoordinate(address) {
  naver.maps.Service.geocode({query: address}, function (status, response) {
    if (status === naver.maps.Service.Status.ERROR) {
      return alert('Something Wrong!');
    }

    if (response.v2.meta.totalCount === 0) {
      return alert('totalCount' + response.v2.meta.totalCount);
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

    infoWindow.setContent([
      '<div style="padding:10px;min-width:200px;line-height:150%;">',
      '<h4 style="margin-top:5px;">Search Address : ' + address + '</h4><br />',
      htmlAddresses.join('<br />'),
      '</div>'
    ].join('\n'));

    map.setCenter(point);
    infoWindow.open(map, point);

    // keydown(enter)로 검색시 슬라이딩에 표기
    $(".sinfo").html("<tr><td>" + item.roadAddress + "</td></tr>");
  });
}



function initGeocoder() {
  map.addListener('click', function (e) {
    searchCoordinateToAddress(e.coord);
  });

  document.getElementById('submit').addEventListener('click', function () {
    var address = document.getElementById('address').value;
    searchAddressToCoordinate(address); // searchAddressToCoordinate 함수 호출
  });

  document.getElementById('address').addEventListener('keydown', function (e) {
    console.log(e.target);
    console.log(this);
    var keyCode = e.target.which || e.target.keyCode;
    if (keyCode === 13) { // Enter key
      var address = document.getElementById('address').value;
      searchAddressToCoordinate(address); // searchAddressToCoordinate 함수 호출
    }
  });

  searchAddressToCoordinate(''); // 초기에도 주소를 전달하여 함수 호출
}

function makeAddress(item) {
  if (!item) {
    return;
  }

  var name = item.name,
    region = item.region,
    land = item.land,
    isRoadAddress = name === 'roadaddr';

  var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

  if (hasArea(region.area1)) {
    sido = region.area1.name;
  }

  if (hasArea(region.area2)) {
    sigugun = region.area2.name;
  }

  if (hasArea(region.area3)) {
    dongmyun = region.area3.name;
  }

  if (hasArea(region.area4)) {
    ri = region.area4.name;
  }

  if (land) {
    if (hasData(land.number1)) {
      if (hasData(land.type) && land.type === '2') {
        rest += '산';
      }

      rest += land.number1;

      if (hasData(land.number2)) {
        rest += ('-' + land.number2);
      }
    }

    if (isRoadAddress === true) {
      if (checkLastString(dongmyun, '면')) {
        ri = land.name;
      } else {
        dongmyun = land.name;
        ri = '';
      }

      if (hasAddition(land.addition0)) {
        rest += ' ' + land.addition0.value;
      }
    }
  }

  return [sido, sigugun, dongmyun, ri, rest].join(' ');
}

function hasArea(area) {
  return !!(area && area.name && area.name !== '');
}

function hasData(data) {
  return !!(data && data !== '');
}

function checkLastString(word, lastString) {
  return new RegExp(lastString + '$').test(word);
}

function hasAddition(addition) {
  return !!(addition && addition.value);
}

naver.maps.onJSContentLoaded = initGeocoder

var cadastralLayer = new naver.maps.CadastralLayer();

var btn = $('#cadastral');

btn.on('click', function (e) {
  e.preventDefault();

  if (cadastralLayer.getMap()) {
    cadastralLayer.setMap(null);
    btn.removeClass('control-on').val('지적도 켜기');
  } else {
    cadastralLayer.setMap(map);
    btn.addClass('control-on').val('지적도 끄기');
  }
});

naver.maps.Event.once(map, 'init', function () {
  cadastralLayer.setMap(null);
});

// 마커
// var position = new naver.maps.LatLng(37.3595704, 127.105399);


// 거리뷰

// <style type="text/css">
// #wrap .buttons {
//     position: absolute;
//     top: 0;
//     left: 0;
//     z-index: 1000;
//     padding: 5px;
// }

// #wrap .buttons .control-btn {
//     margin: 0 5px 5px 0;
// }
// </style>

// <div id="wrap" class="section">
// <h2>네이버 거리뷰 레이어 표시하기</h2>
// <p>네이버 거리뷰 레이어를 생성하는 예제입니다. 이 예제는 jQuery 구문을 포함하고 있습니다.</p>
// <div id="map" style="width:100%;height:600px;">
//     <div class="buttons">
//         <input id="street" type="button" value="거리뷰" class="control-btn control-on" />
//     </div>
// </div>
// <code id="snippet" class="snippet"></code>
// </div>
// <script id="code">
// var map = new naver.maps.Map('map', {
//     center: new naver.maps.LatLng(37.3595704, 127.105399),
//     mapTypeControl: true,
//     mapTypeControlOptions: {
//         style: naver.maps.MapTypeControlStyle.DROPDOWN
//     }
// });

// var streetLayer = new naver.maps.StreetLayer();

// var btn = $('#street');

// naver.maps.Event.addListener(map, 'streetLayer_changed', function (streetLayer) {
//     if (streetLayer) {
//         btn.addClass('control-on');
//     } else {
//         btn.removeClass('control-on');
//     }
// });

// btn.on("click", function (e) {
//     e.preventDefault();

//     if (streetLayer.getMap()) {
//         streetLayer.setMap(null);
//     } else {
//         streetLayer.setMap(map);
//     }
// });

// naver.maps.Event.once(map, 'init', function () {
//     streetLayer.setMap(map);
// });
// </script>
