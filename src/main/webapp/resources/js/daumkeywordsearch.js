/*global daum*/
/*global map*/

// $(window).ready(function() {
    $('#navbar').append(
'          <ul class="nav navbar-nav">\
    		  <li><select id="dong" style="height:50px" onchange="dongChangeEventHandler()">\
    		  </select></li>\
    		<li><select id="gungu" style="height:50px" onchange="gunguChangeEventHandler()">\
  		  </select></li>\
    		<li><select id="si" style="height:50px" onchange="siChangeEventHandler()">\
   		 </select></li>\
          </ul>'
        );

    $('.map_wrap').append(
'<!-- Modal -->\
<div class="modal fade" id="daumKeywordSearchModal" data-backdrop="false" tabindex="-1" role="dialog" aria-labelledby="daumKeywordSearchModalLabel">\
    <div class="modal-dialog modal-sm" role="document">\
        <div class="modal-content">\
            <div class="modal-header">\
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
                <h4 class="modal-title" id="daumKeywordSearchModalLabel">다음지도 키워드 검색</h4>\
            </div>\
            <div class="modal-body">\
                <div class="input-group">\
                    <input type="text" class="form-control" id="daumKeyword" placeholder="검색어">\
                    <span class="input-group-btn">\
                        <button id="daumKeywordSearchBtn" class="btn btn-default" type="button">검색</button>\
                    </span>\
                </div>\
                <ul id="placesList" style="padding-left:0px;"></ul>\
                <div id="daumsearchpagination"></div>\
            </div>\
            <div class="modal-footer">\
                <button id="daumKeywordSearchModalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>\
            </div>\
        </div>\
    </div>\
</div>'
        );
// });

// 마커를 담을 배열입니다
var markers = [];

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var searchinfowindow = new daum.maps.InfoWindow({zIndex:1, disableAutoPan:true});

$('#daumKeywordSearchBtn').click(function(){
    searchPlaces();
});

$('#daumKeywordSearchModal').on('show.bs.modal', function (e) {
    searchPlaces();
});

$('#daumKeywordSearchModal').on('hidden.bs.modal', function (e) {
    clearSearchList();
});

$('#daumKeyword').keypress(function(event){
    if ( event.which == 13 ) {
        searchPlaces();
    }
});

function clearSearchList() {
    var listEl = document.getElementById('placesList');
    removeAllChildNods(listEl);
    removeMarker();
    var paginationEl = document.getElementById('daumsearchpagination');
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }
    searchinfowindow.close();
}

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('daumKeyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        // alert('키워드를 입력해주세요!');
        clearSearchList();
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB);
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data.places);

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
    fragment = document.createDocumentFragment(),
    bounds = new daum.maps.LatLngBounds(),
    listStr = '';

    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            marker = addMarker(placePosition, i),
            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                searchinfowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                searchinfowindow.close();
            };

            itemEl.onclick =  function () {
                map.setCenter(marker.getPosition());
                map.setLevel(3);
            };
        })(marker, places[i].title);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.title + '</h5>';

    if (places.newAddress) {
        itemStr += '    <span>' + places.newAddress + '</span>' +
                    '   <span class="jibun gray">' +  places.address  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address  + '</span>';
    }

      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';

    el.innerHTML = itemStr;
    el.className = 'searchitem';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = '/images/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('daumsearchpagination'),
        fragment = document.createDocumentFragment(),
        i;

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
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
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    searchinfowindow.setContent(content);
    searchinfowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

function siChangeEventHandler()
{
	gunguSelectedCreate(dongSelectCreate);
	draw();
}
//군구 선택상자 변경시 발생 이벤트 핸들러
function gunguChangeEventHandler()
{
	dongSelectCreate();
	draw();
	
}

//동 선택상자 선택시 발생 이벤트 핸들러 
function dongChangeEventHandler()
{
	draw();
}
/**
 * 시의 셀렉트 데이터를 불러와 셋팅해주는 기능을 합니다. 
 * callfunction : 생성이 완료된 뒤로 호출하는 function 을 셋팅합니다. 
 * param : 해당 완료되는 뒤 호출하는 function 에 할당해서 보내는 파라미터 데이터입니다. 
 */
function siSelectedCreate(callfunction,param)
{
	$.getJSON( "/code/key.json", function( data ) {
	$("#si").empty();
	$("#si").append("<option value='0'>전체</option>"); 
	$.each(data , function (key , val)
	{
		$("#si").append("<option value='"+val.CTPRVN_CD+"'>"+val.CTP_KOR_NM+"</option>"); 
				
	});
	if(callfunction != null)callfunction(param);		
	//siChangeEventHandler();
	});
}

/**
 * 군구의 셀렉트 데이터를 불러와 셋팅해주는 기능을 합니다. 
 * callfunction : 생성이 완료된 뒤로 호출하는 function 을 셋팅합니다. 
 * param : 해당 완료되는 뒤 호출하는 function 에 할당해서 보내는 파라미터 데이터입니다. 
 */
function gunguSelectedCreate(callfunction,param)
{
	if($("#si").find("option:selected").val() == "0")
	{
		$("#gungu").empty();
		$("#gungu").append("<option value='0'>전체</option>");
		if(callfunction != null)callfunction(param);
		return;
	}
	$.getJSON("/code/"+$("#si").find("option:selected").val()+"/key.json" , function(data)
	{
		$("#gungu").empty();
		$("#gungu").append("<option value='0'>전체</option>");
		$.each(data , function(key , val)
		{
			$("#gungu").append("<option value='"+val.SIG_CD+"'>"+val.SIG_KOR_NM+"</option>");
		});
		if(callfunction != null)callfunction(param);	
	});	
}
/**
 * 동의 셀렉트 데이터를 불러와 셋팅해주는 기능을 합니다. 
 * callfunction : 생성이 완료된 뒤로 호출하는 function 을 셋팅합니다. 
 * param : 해당 완료되는 뒤 호출하는 function 에 할당해서 보내는 파라미터 데이터입니다. 
 */
function dongSelectCreate(callfunction,param)
{
	if($("#gungu").find("option:selected").val() == "0")
	{
		$("#dong").empty();
		$("#dong").append("<option value='0'>전체</option>");
		if(callfunction != null)callfunction(param);
		draw();
		return;
	}
	var optionSelected = $("#gungu").find("option:selected");
	$.getJSON("/code/"+$("#si").find("option:selected").val()+"/"+$("#gungu").find("option:selected").val()+"/key.json" , function(data)
	{
		$("#dong").empty();
		$("#dong").append("<option value='0'>전체</option>");
		$.each(data , function(key , val)
		{
			$("#dong").append("<option value='"+val.EMD_CD+"'>"+val.EMD_KOR_NM+"</option>");
		});
		if(callfunction != null)callfunction(param);
		draw();
	});		
}

function getdongCode(si,gu,dong,index,callfunction){
	var dumpreturn = "";
	$.getJSON( "/code/key.json", function( data ) {
		$.each(data , function (key , val)
		{
			if(val.CTP_KOR_NM.substring(0,2) == si.substring(0,2))
			{
				$.getJSON("/code/"+val.CTPRVN_CD+"/key.json" , function(data)
				{
					$.each(data , function (gkey , gval)
					{
						if(gval.SIG_KOR_NM == gu){
							$.getJSON("/code/"+val.CTPRVN_CD+"/"+gval.SIG_CD+"/key.json" , function(data)
							{
								$.each(data , function (dkey , dval)
								{
									if(dval.EMD_KOR_NM.substring(0,3) == dong.substring(0,3))
									 {
										callfunction(dval.EMD_CD,index);
									 }	
								});
								 
							});
						}
					});
					
				});
			}
		});
	});
}

/**
 * 군 셀렉트가 생성한뒤 호출하는 function
 * items : 할당한 param
 */
function gunChangeReturn(items)
{
	$("#gungu").val(items["addrdetail"]["sigugun"]).attr("selected", "selected");
	dongSelectCreate(dongChangeReturn,items)
}
/**
 * 동 셀렉트가 생성한뒤 호출하는 function
 * items : 할당한 param
 */
function dongChangeReturn(items)
{
	$("#dong").val(items["addrdetail"]["dongmyun"]).attr("selected", "selected");
}
siSelectedCreate(gunguSelectedCreate,dongSelectCreate);
