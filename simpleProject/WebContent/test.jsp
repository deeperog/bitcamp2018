<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <title>키워드로 장소검색하고 목록으로 표출하기</title>
        <style>
            .map_wrap,
            .map_wrap * {
                margin: 0;
                padding: 0;
                font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
                font-size: 12px;
            }

            .map_wrap a,
            .map_wrap a:hover,
            .map_wrap a:active {
                color: #000;
                text-decoration: none;
            }

            .map_wrap {
                position: relative;
                width: 100%;
                height: 500px;
            }

            #menu_wrap {
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                width: 250px;
                margin: 10px 0 30px 10px;
                padding: 5px;
                overflow-y: auto;
                background: rgba(255, 255, 255, 0.7);
                z-index: 1;
                font-size: 12px;
                border-radius: 10px;
            }

            .bg_white {
                background: #fff;
            }

            #menu_wrap hr {
                display: block;
                height: 1px;
                border: 0;
                border-top: 2px solid #5F5F5F;
                margin: 3px 0;
            }

            #menu_wrap .option {
                text-align: center;
            }

            #menu_wrap .option p {
                margin: 10px 0;
            }

            #menu_wrap .option button {
                margin-left: 5px;
            }

            #placesList li {
                list-style: none;
            }

            #placesList .item {
                position: relative;
                border-bottom: 1px solid #888;
                overflow: hidden;
                cursor: pointer;
                min-height: 65px;
            }

            #placesList .item span {
                display: block;
                margin-top: 4px;
            }

            #placesList .item h5,
            #placesList .item .info {
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
            }

            #placesList .item .info {
                padding: 10px 0 10px 55px;
            }

            #placesList .info .gray {
                color: #8a8a8a;
            }

            #placesList .info .jibun {
                padding-left: 26px;
                background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
            }

            #placesList .info .tel {
                color: #009900;
            }

            #placesList .item .markerbg {
                float: left;
                position: absolute;
                width: 36px;
                height: 37px;
                margin: 10px 0 0 10px;
                background: url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
            }

            #placesList .item .marker_1 {
                background-position: 0 -10px;
            }

            #placesList .item .marker_2 {
                background-position: 0 -56px;
            }

            #placesList .item .marker_3 {
                background-position: 0 -102px
            }

            #placesList .item .marker_4 {
                background-position: 0 -148px;
            }

            #placesList .item .marker_5 {
                background-position: 0 -194px;
            }

            #placesList .item .marker_6 {
                background-position: 0 -240px;
            }

            #placesList .item .marker_7 {
                background-position: 0 -286px;
            }

            #placesList .item .marker_8 {
                background-position: 0 -332px;
            }

            #placesList .item .marker_9 {
                background-position: 0 -378px;
            }

            #placesList .item .marker_10 {
                background-position: 0 -423px;
            }

            #placesList .item .marker_11 {
                background-position: 0 -470px;
            }

            #placesList .item .marker_12 {
                background-position: 0 -516px;
            }

            #placesList .item .marker_13 {
                background-position: 0 -562px;
            }

            #placesList .item .marker_14 {
                background-position: 0 -608px;
            }

            #placesList .item .marker_15 {
                background-position: 0 -654px;
            }

            #pagination {
                margin: 10px auto;
                text-align: center;
            }

            #pagination a {
                display: inline-block;
                margin-right: 10px;
            }

            #pagination .on {
                font-weight: bold;
                cursor: default;
                color: #777;
            }
        </style>
        <script src="http://code.jquery.com/jquery-2.2.4.js"></script>
    </head>

    <body>
        <div class="map_wrap">
            <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15">
                            <button type="submit">검색하기</button>
                        </form>
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4636b4674c85540b39adefb0d156833b
&libraries=services"></script>
        <script>
            // 마커를 담을 배열입니다
            var markers = [];

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                    level: 3
                    // 지도의 확대 레벨
                };

            // 지도를 생성합니다    
            var map = new daum.maps.Map(mapContainer, mapOption);

            // 장소 검색 객체를 생성합니다
            var ps = new daum.maps.services.Places();

            // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
            var infowindow = new daum.maps.InfoWindow({
                zIndex: 1
            });

            // 키워드로 장소를 검색합니다
            searchPlaces();

            // 키워드 검색을 요청하는 함수입니다
            function searchPlaces() {

                var keyword = document.getElementById('keyword').value;

                if (!keyword.replace(/^\s+|\s+$/g, '')) {
                    alert('키워드를 입력해주세요!');
                    return false;
                }

                // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                ps.keywordSearch(keyword, placesSearchCB);
            }

            // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === daum.maps.services.Status.OK) {

                    // 정상적으로 검색이 완료됐으면
                    // 검색 목록과 마커를 표출합니다
                    displayPlaces(data);

                    // 페이지 번호를 표출합니다
                    displayPagination(pagination);

                } else if (status === daum.maps.services.Status.ZERO_RESULT) {

                    alert('검색 결과가 존재하지 않습니다.');
                    return;

                } else if (status === daum.maps.services.Status.ERROR) {

                    alert('검색 결과 중 오류가 발생했습니다.');
                    return;

                }
            }

            // 검색 결과 목록과 마커를 표출하는 함수입니다
            function displayPlaces(places) {

                var listEl = document.getElementById('placesList'),
                    menuEl = document
                    .getElementById('menu_wrap'),
                    fragment = document
                    .createDocumentFragment(),
                    bounds = new daum.maps.LatLngBounds(),
                    listStr = '';

                // 검색 결과 목록에 추가된 항목들을 제거합니다
                removeAllChildNods(listEl);

                // 지도에 표시되고 있는 마커를 제거합니다
                removeMarker();

                for (var i = 0; i < places.length; i++) {

                    // 마커를 생성하고 지도에 표시합니다
                    var placePosition = new daum.maps.LatLng(places[i].y,
                            places[i].x),
                        marker = addMarker(placePosition, i),
                        itemEl = getListItem(
                            i, places[i]); // 검색 결과 항목 Element를 생성합니다

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    bounds.extend(placePosition);

                    // 마커와 검색결과 항목에 mouseover 했을때
                    // 해당 장소에 인포윈도우에 장소명을 표시합니다
                    // mouseout 했을 때는 인포윈도우를 닫습니다
                    (function(marker, title) {
                        daum.maps.event.addListener(marker, 'click',
                            function() {
                                displayInfowindow(marker, title);
                                infowindow.close();
                            });

                        /* daum.maps.event.addListener(marker, 'mouseout', function() {
                           infowindow.close();
                        }); */

                        itemEl.onclick = function() {
                            displayInfowindow(marker, title);
                            infowindow.close();
                        };

                        /* itemEl.onmouseout = function() {
                           infowindow.close();
                        }; */
                    })(marker, places[i].place_name);

                    fragment.appendChild(itemEl);
                }

                // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
                listEl.appendChild(fragment);
                menuEl.scrollTop = 0;

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }

            // 검색결과 항목을 Element로 반환하는 함수입니다
            function getListItem(index, places) {

                var el = document.createElement('li'),
                    itemStr = '<span class="markerbg marker_' +
                    (index + 1) +
                    '"></span>' +
                    '<div class="info">' +
                    '   <h5>' + places.place_name + '</h5>';

                if (places.road_address_name) {
                    itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' + places.address_name +
                        '</span>';
                } else {
                    itemStr += '    <span>' + places.address_name + '</span>';
                }

                itemStr += '  <span class="tel">' + places.phone + '</span>' +
                    '</div>';

                el.innerHTML = itemStr;
                el.className = 'item';

                return el;
            }

            // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
            function addMarker(position, idx, title) {
                var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                    imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
                    imgOptions = {
                        spriteSize: new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
                        spriteOrigin: new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                        offset: new daum.maps.Point(13, 37)
                        // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                    },
                    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
                        imgOptions),
                    marker = new daum.maps.Marker({
                        position: position, // 마커의 위치
                        image: markerImage
                    });

                marker.setMap(map); // 지도 위에 마커를 표출합니다
                markers.push(marker); // 배열에 생성된 마커를 추가합니다

                return marker;
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setMap(null);
                }
                markers = [];
            }

            // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
            function displayPagination(pagination) {
                var paginationEl = document.getElementById('pagination'),
                    fragment = document
                    .createDocumentFragment(),
                    i;

                // 기존에 추가된 페이지번호를 삭제합니다
                while (paginationEl.hasChildNodes()) {
                    paginationEl.removeChild(paginationEl.lastChild);
                }

                for (i = 1; i <= pagination.last; i++) {
                    var el = document.createElement('a');
                    el.href = "#";
                    el.innerHTML = i;

                    if (i === pagination.current) {
                        el.className = 'on';
                    } else {
                        el.onclick = (function(i) {
                            return function() {
                                pagination.gotoPage(i);
                            }
                        })(i);
                    }

                    fragment.appendChild(el);
                }
                paginationEl.appendChild(fragment);
            }




            // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
            // 인포윈도우에 장소명을 표시합니다
            function displayInfowindow(marker, title) {
            
               var i = 0;
                var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
                var wtm = []; // wtm형식 좌표
                var wgs = [];
                var stationName = [];
                var stationNum = [];
                var uniqNum = [];
                var x;
                var y;
                infowindow.setContent(content);
                infowindow.open(map, marker);
                var position = infowindow.getPosition();

                var moveLatLon = new daum.maps.LatLng(position.jb, position.ib);
                map.setLevel(5);
                map.setCenter(moveLatLon);
                var center = map.getCenter();


                var geocoder = new daum.maps.services.Geocoder(),
                    wtmX = center.ib,
                    wtmY = center.jb; //좌표 변환

                var callback = function(result, status) {
                    if (status === daum.maps.services.Status.OK) {
                        x = result[0].x;
                        y = result[0].y;
                        test2();
                    }
                };

                // WGS84 좌표를 WTM 좌표계의 좌표로 변환한다
                geocoder.transCoord(wtmX, wtmY, callback, {
                    input_coord: daum.maps.services.Coords.WGS84,
                    output_coord: daum.maps.services.Coords.WTM
                });


                var callback2 = function(result, status) {
                    if (status === daum.maps.services.Status.OK) {

                        var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
                        var imageSize = new daum.maps.Size(24, 35);

                        // 마커 이미지를 생성합니다    
                        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);

                        // 마커를 생성합니다
                        var marker = new daum.maps.Marker({
                            map: map, // 마커를 표시할 지도
                            position: new daum.maps.LatLng(result[0].y, result[0].x),
                            image: markerImage, // 마커 이미지 

                        });
                        
                        console.log(result[0].y);
                        console.log(result[0].x);
                        
                        
                        var infowindow = new daum.maps.InfoWindow({
                            content: uniqNum[i++]
                        });

                        // 마커에 마우스오버 이벤트를 등록합니다
                        daum.maps.event.addListener(marker, 'mouseover', function() {
                            // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                            infowindow.open(map, marker);
                        });

                        // 마커에 마우스아웃 이벤트를 등록합니다
                        daum.maps.event.addListener(marker, 'mouseout', function() {
                            // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                            infowindow.close();
                        });
                    }
                };




                var test = function() {
                    $(wtm).each(function(index, item) {
                    	
                    	console.log(item.name);
                        geocoder = new daum.maps.services.Geocoder(), wtmX = item.subwayX, wtmY = item.subwayY;

                        geocoder.transCoord(wtmX, wtmY, callback2, {
                            input_coord: daum.maps.services.Coords.WTM,
                            output_coord: daum.maps.services.Coords.WGS84
                        });
                    });
                    
                }


                var stationId = function(stationName) {
                    /* console.log(stationName[0].name); */
                    $.ajax({
                        url: 'subway.json',
                        success: function(data) {
                                $(stationName).each(function(index, item) {
                            $(data.DATA).each(function(key, value) {
                                    /* if (item.name == value.station_nm) { */
                                    	
                                    if (item.name == value.station_nm && item.line == value.line_num) {

                                        stationNum.push(value.station_cd)

                                    }
                                });
                            });
                            $.each(stationNum, function(i, el) { //중복요소 제거
                                if ($.inArray(el, uniqNum) === -1) uniqNum.push(el);
                            });

                        }
                    });
                };

                
                var test2 = function() {
                    $.ajax({
                        url: 'http://swopenAPI.seoul.go.kr/api/subway/6a63575061646a61383142424a574d/json/nearBy/0/5/' + x + '/' + y,
                        /* url: 'http://swopenapi.seoul.go.kr/api/subway/6a63575061646a61383142424a574d/json/nearBy/0/5/199029.91541/450688.46452', */
                        success: function(data) {
                            $(data.stationList).each(function(key, value) {
                                wtm.push({
                                    subwayX: value.subwayXcnts,
                                    subwayY: value.subwayYcnts,
                                   	name: value.statnNm,
                                    
                                });
                                stationName.push({
                                    name: value.statnNm, //역이름을 넣음
                                    line: value.subwayNm
                                })
                            });
                            test();
                            /* console.log(stationName); */
                            stationId(stationName);
                            
                            
                            
                            console.log(uniqNum);
                            
                        }
                    });
                }
            }


            // 검색결과 목록의 자식 Element를 제거하는 함수입니다
            function removeAllChildNods(el) {
                while (el.hasChildNodes()) {
                    el.removeChild(el.lastChild);
                }
            }
        </script>
    </body>

    </html>