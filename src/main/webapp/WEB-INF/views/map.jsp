<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>일자리 매칭서비스 플랫폼, 당일JOB</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="user-scalable=yes, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">
	<meta name="title" content="일자리 매칭서비스 플랫폼, 당일JOB">
	<meta name="author" content="일자리 매칭서비스 플랫폼, 당일JOB">
	<meta name="keywords" content="당일잡, 건설인력, 물류인력, 여성인력, 중장비, 용달, 화물자, 직업소개소, 일자리, 당일, 일용직, 도우미, 전문직">
	<meta name="subject" content="당일JOB">
	<meta property="og:image" content="imglogo.png">
	<meta name="Description" content="내가 가는 곳이 곧 일터! 일자리 매칭서비스 플랫폼">
	<meta name="classification" content="">
  <!-- CSS Files -->
  <%@ include file="include/importcss.jsp" %>
  <%@ include file="include/importjs.jsp" %>
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ywmo2h56gs&submodules=geocoder">"></script> 
     	<script type="text/javascript" src="/resources/js/markercluster.js?ver=1"></script>
</head>
<body class="mapPage">
<script>
var isMobile2 = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
$(function(){
	$("a, header, img").each(function(){
		$(this).css({transitionDuration:".2s"});
	});
	if(!isMobile2){
		$("#searchResultBody").css("z-index","2")	
	}
	
});
</script>
	<%@ include file="include/head.jsp" %>
	<%@ include file="include/navimobile.jsp" %>
	<div class="bg"></div>
	<!--sub-->
	<div class="searchList">
		<div class="carItems">
			<button><span>전체</span></button>
			<button onclick="filterButtonClickEventHandler(this); load();" name="t_type_name" data-value="1" data-code="T00" id="t_type_btn_0">
				<img src="/resources/djver/images/map/construct_blue.png" style="height:22px;" alt="icon"  id="T00_img_on" />
				<img src="/resources/djver/images/map/construct_off.png" style="height:22px;display:none" alt="icon"  id="T00_img_off" />
				<span>건설인력</span>
			</button>
			<button onclick="filterButtonClickEventHandler(this); load();" name="t_type_name" data-value="1" data-code="T01" id="t_type_btn_1">
				<img src="/resources/djver/images/map/distribution_mint.png" style="height:22px;" alt="icon" id="T01_img_on" />
				<img src="/resources/djver/images/map/distribution_off.png" style="height:22px;display:none" alt="icon"  id="T01_img_off" />
				<span>물류인력</span>
			</button>
			<button onclick="filterButtonClickEventHandler(this); load();" name="t_type_name" data-value="1" data-code="T02" id="t_type_btn_2">
				<img src="/resources/djver/images/map/woman_pink.png" style="height:22px;" alt="icon" id="T02_img_on" />
				<img src="/resources/djver/images/map/woman_off.png" style="height:22px;display:none" alt="icon"  id="T02_img_off" />
				<span>여성인력</span>
			</button>
			<button onclick="filterButtonClickEventHandler(this); load();" name="t_type_name" data-value="1" data-code="T04" id="t_type_btn_4">
				<img src="/resources/djver/images/map/truck_yellow.png" style="height:29px;" alt="icon" id="T04_img_on" />
				<img src="/resources/djver/images/map/truck_off.png" style="height:22px;display:none" alt="icon"  id="T04_img_off" />
				<span>용달/화물차</span>
			</button>
			<button onclick="filterButtonClickEventHandler(this); load();" name="t_type_name" data-value="1" data-code="T03" id="t_type_btn_3">
				<img src="/resources/djver/images/map/equipment_purple.png" style="height:30px;" alt="icon" id="T03_img_on" />
				<img src="/resources/djver/images/map/equipment_off.png" style="height:22px;display:none" alt="icon"  id="T03_img_off" />
				<span>중장비</span>
			</button>
			<button onclick="filterButtonClickEventHandler(this); load();" name="t_type_name" data-value="1" data-code="T05" id="t_type_btn_5">
				<img src="/resources/djver/images/map/etc_off.png" style="height:20px;" alt="icon" id="T05_img_on" />
				<img src="/resources/djver/images/map/etc_grey.png" style="height:22px;display:none" alt="icon"  id="T05_img_off" />
				<span>기타</span>
			</button>
		</div>
		<div class="searchbox">
			<div class="popupSearch">
				<div class="top"  style="visibility: hidden;" >
					<div class="search">
						<select name="" id="" style="visibility: hidden;">
							<option>전체</option>
							<option>카테고리1</option>
							<option>카테고리2</option>
						</select>
						<div class="inputbox" style="visibility: hidden;">
							<input type="text">
							<a href="javascript:$('#searchResultBody').hide()" class="del_input">
								<img src="/resources/djver/images/del_input.png" alt="닫기">
							</a>
							<a href="javascript:$('#searchResultBody').show()" class="btn_search">
								<img src="/resources/djver/images/icon_search.png" alt="검색">
							</a>
						</div>
					</div>
					<a href="javascript:;" class="btn_filter" ><i></i></a>
				</div>
			</div>
			<div class="searchResult" id="searchResultBody">
				<button class="btn_goup">
					<i></i>
				</button>
				<div class="top">
					<h3>
						<img src="/resources/djver/images/icon_map.png" style="width:13px;">
						<b>설정한 위치</b>
					</h3>
					<p>
						<span class="c_blue">선택한분야</span>
						현재
						<span class="c_blue" id="total_cnt">00</span>
						건 오늘의 일자리
					</p>
				</div>
				<div class="itemList" style="padding-top:15px;" >
				</div><!--//list-->


<!-- 
				<div class="paging">
					<a href="javascript:;" class="btn_prev">
						<img src="/resources/djver/images/map/arr_left.png" alt="이전">
					</a>

					<div class="num">
						<a href="javascript:;" class="on">1</a>
						<a href="javascript:;">2</a>
						<a href="javascript:;">3</a>
					</div>

					<a href="javascript:;" class="btn_right">
						<img src="/resources/djver/images/map/arr_right.png" alt="다음">
					</a>
				</div>
 -->

			</div>
		</div>
	</div>
	<%@ include file="view/navBtmMobil.jsp" %>
	<div class="map" id="map" style="z-index:1">
		<div class="pointer pointer1 mobileF" style="position:absolute;background-color:white;z-index:2;display:none">
			<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>
			<span>건설인력</span>
		</div>
		<div class="pointer pointer2 mobileF" style="position:absolute;background-color:white;z-index:2;top:35px;display:none">
			<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>
			<span>물류인력</span>
		</div>
		<div class="pointer pointer3 mobileF" style="position:absolute;background-color:white;z-index:2;top:70px;display:none">
			<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>
			<span>여성인력</span>
		</div>
		<div class="pointer pointer4 mobileF" style="position:absolute;background-color:white;z-index:2;top:105px;display:none">
			<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>
			<span>용달/화물차</span>
		</div>
		<div class="pointer pointer5 mobileF" style="position:absolute;background-color:white;z-index:2;top:140px;display:none">
			<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>
			<span>중장비</span>
		</div>
		<div class="pointer pointer6 mobileF" style="position:absolute;background-color:white;z-index:2;top:175px;display:none">
			<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div> 
			<span>기타</span>
		</div>
	</div>
	
<script>

var clusterer;
var filterCode;
var mapOption;
var map;
var semaphore;
if(type == "null"){
}
$(document).ready(function() {
	if(type == "null"){
		mapOptions = {
			    center: new naver.maps.LatLng(37.4346768851223, 127.158104668435),
			    zoom: 12     
			};	
		map = new naver.maps.Map('map', mapOptions);
		$("#location").attr("lon",37.4346768851223);
		$("#location").attr("lat",127.158104668435);
	}else{ 
		Kajax("/action/getMyinfo",{
			seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
		},function(res){
			if(res.success){
				if(checknull(res.rows.lon) == ""){
					mapOptions = {
						    center: new naver.maps.LatLng(37.4346768851223, 127.158104668435),
						    zoom: 12     
						};	
				}else{
					mapOptions = {
		    				center: new naver.maps.LatLng(res.rows.lon, res.rows.lat),
		    				zoom: 12
		    			};
				}
	    		
	    		map = new naver.maps.Map('map', mapOptions);
	    		$("#location").attr("lon",res.rows.lon);
	    		$("#location").attr("lat",res.rows.lat);
	    		if(res.rows.type == "A01"){
	    			$("#location").val(res.rows.address);
	    		}else{
	    			$("#location").val(res.rows.location_addr);	
	    		}
			}
		})
	}
	
	// 지도 이벤트          
    naver.maps.Event.addListener(map, 'zoom_changed', function(zoom) {
		   //contentEl.find('.zoom').text(zoom);
		   //console.log(zoom); 
		});
		naver.maps.Event.addListener(map, 'bounds_changed', function(bounds) {
		 //   contentEl.find('.center').text(map.getCenterPoint());
		 	if(semaphore) return;
		 //	mapinfoloadlist();
		 	load();
		    //console.log('Center: ' + map.getCenter().toString() + ', Bounds: ' + bounds.toString());
		});
		naver.maps.Event.addListener(map, 'drag', function() {
	        semaphore = true;
	     //   map.panTo(minimap.getCenter());
	        naver.maps.Event.once(map, 'idle', function() {
	            semaphore = false;
	        });
	    });	 		  
	
//	initview();
	Kajax("/action/getTypelist",{
		user_seq : (type == "null" ? null : <%=String.valueOf(request.getAttribute("user_seq"))%>)
	},function(res){
		if(res.success){
			if(type == "null"){
				$("#topfilterBtn").append('<button type="button" style="padding:0px;min-width:60px;height:37px;margin-top:10px;margin-left:5px;word-wrap: break-word;white-space:normal !important;font-size:12px;" class="btn btn-outline btn-warning" onclick="CodeOutLineButtonClickEventHandler(this); load();" data-value="1" data-code="A02" id="t_type_button_A02">개인</button>')
				$("#topfilterBtn").append('<button type="button" style="padding:0px;min-width:60px;height:37px;margin-top:10px;margin-left:5px;word-wrap: break-word;white-space:normal !important;font-size:12px;" class="btn btn-outline btn-warning" onclick="CodeOutLineButtonClickEventHandler(this); load();" data-value="1" data-code="A01" id="t_type_button_A01">기업</button>')	
			}
			$.each(res.rows , function(index , item){
				$("#topfilterBtn").append('<button type="button" style="padding:0px;min-width:60px;height:37px;margin-top:10px;margin-left:5px;word-wrap: break-word;white-space:normal !important;font-size:12px;" class="btn btn-outline btn-warning" onclick="CodeOutLineButtonClickEventHandler(this); load();" name="t_type_name" data-value="1" data-code="'+item.code+'" id="t_type_button_'+index+'">'+item.code_name+'</button>')
			})
			load();
			
		}
	})
	
  });
function filterButtonClickEventHandler(target){
	
	if($("#"+target.id).attr("data-value") == "0"){
		$("#"+target.id).attr("data-value","1");
		$("#"+$("#"+target.id).attr("data-code")+"_img_on").show();
		$("#"+$("#"+target.id).attr("data-code")+"_img_off").hide();
	}else{
		$("#"+target.id).attr("data-value","0");
		$("#"+$("#"+target.id).attr("data-code")+"_img_on").hide();
		$("#"+$("#"+target.id).attr("data-code")+"_img_off").show();
	}
	
}
function initview(){
	
	$("#ionrange_0").ionRangeSlider({
        min: 50000,
        max: 500000,
        type: 'double',
        maxPostfix: "+",
        grid: true
    });
	$("#ionrange_1").ionRangeSlider({
        min: 50000,
        max: 500000,
        type: 'double',
        maxPostfix: "+",
        grid: true
    });
	$("#ionrange_2").ionRangeSlider({
        min: 50000,
        max: 500000,
        type: 'double',
        maxPostfix: "+",
        grid: true
    });
	$("#ionrange_3").ionRangeSlider({
        min: 50000,
        max: 500000,
        type: 'double',
        maxPostfix: "+",
        grid: true
    });
	/*
	$("#ionrange_5").ionRangeSlider({
        min: 0,
        max: 500000,
        type: 'double',
        maxPostfix: "+",
        grid: true
    });
	$("#ionrange_6").ionRangeSlider({
        min: 0,
        max: 500000,
        type: 'double',
        maxPostfix: "+",
        grid: true
    });
	*/
}
var mapdata = '';
function load(){
	clearMapMarker();
	mapdata = '';
	for(var i = 0 ; i < $("button[name='t_type_name']").length ; i++){
		if($("#"+$("button[name='t_type_name']")[i].id).attr("data-value") == "0"){
			if(mapdata == ""){
				mapdata += "'"+$("#"+$("button[name='t_type_name']")[i].id).attr("data-code")+"'"
			}else{
				mapdata += ",'"+$("#"+$("button[name='t_type_name']")[i].id).attr("data-code")+"'"
			}
		}
	}
	if(mapdata == "") mapdata = "'NONE'";
	mapload();
}
function clearMapMarker(){
	$.each(markers , function(index , item){
		item.setMap(null);
	})
	//clusterer.clear();
	markers = [];
	markersdata = [];
	if(markerClustering != null)markerClustering._clearClusters();
}
var markerClustering;
var iwContent = '', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
function changeBtn(target,ty,seq){
	if(ty == 0){
		$(target).removeClass("btn-secondary");
		$(target).addClass("btn-primary");
		$(target).text("승인대기");
		$(target).css("margin-left","107px");
		$(target).attr("onclick","cancelJob("+seq+");changeBtn(this,1,"+seq+")");
	}else{
		$(target).removeClass("btn-primary");
		$(target).addClass("btn-secondary");
		$(target).text("신청");
		$(target).css("margin-left","130px");
		$(target).attr("onclick","addJob("+seq+");changeBtn(this,0,"+seq+")");
	}
}
var markers = [];
var markersdata = [];
var htmlMarker1 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/djver/img/cluster-marker-1.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    },
    htmlMarker2 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/djver/img/cluster-marker-2.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    },
    htmlMarker3 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/djver/img/cluster-marker-3.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    },
    htmlMarker4 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/djver/img/cluster-marker-4.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    },
    htmlMarker5 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(/resources/djver/img/cluster-marker-5.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    };
function mapload(jobtype){
	var types = "";
	if($("#t_type_button_A02").attr("data-value") == "0"){
		types += "'A02'";
	}
	if($("#t_type_button_A01").attr("data-value") == "0"){
		if(types == ""){
			types += "'A01'";
		}else{
			types += ",'A01'";
		}
	}
	var bounds = map.getBounds();
	var filter = "";
	filter += ($('input:checkbox[id="worker_0"]').is(":checked") ? "1" : "");
	filter += ($('input:checkbox[id="worker_1"]').is(":checked") ? "1" : "");
	filter += ($('input:checkbox[id="worker_2"]').is(":checked") ? "1" : "");
	filter += ($('input:checkbox[id="worker_3"]').is(":checked") ? "1" : "");

	Kajax("/action/listLoad",{
		user_seq : (type == "A02" ? "" :  <%=String.valueOf(request.getAttribute("user_seq"))%>)
		,target_user_seq : (type == "A01" ? "" :  <%=String.valueOf(request.getAttribute("user_seq"))%>)
		,job_type : mapdata
		,type : (type == "null" ? "A01" : (type == "A01" ? "A02" : "A01"))
		,types : (type == "null" ? types : null)
		,minlat : map.getBounds()._min.x
		,maxlat : map.getBounds()._max.x 
		,minlon : map.getBounds()._min.y
		,maxlon : map.getBounds()._max.y
		,filter : filter
		/*
		,worker0 : ($('input:checkbox[id="worker_0"]').is(":checked") ? "1" : "")
		,worker0_from : $("#ionrange_0").data("ionRangeSlider").result.from
		,worker0_to : $("#ionrange_0").data("ionRangeSlider").result.to
		,worker1 : ($('input:checkbox[id="worker_1"]').is(":checked") ? "1" : "")
		,worker1_from : $("#ionrange_1").data("ionRangeSlider").result.from
		,worker1_to : $("#ionrange_1").data("ionRangeSlider").result.to
		,worker2 : ($('input:checkbox[id="worker_2"]').is(":checked") ? "1" : "")
		,worker2_from : $("#ionrange_2").data("ionRangeSlider").result.from
		,worker2_to : $("#ionrange_2").data("ionRangeSlider").result.to
		,worker3 : ($('input:checkbox[id="worker_3"]').is(":checked") ? "1" : "")
		,worker3_from : $("#ionrange_3").data("ionRangeSlider").result.from
		,worker3_to : $("#ionrange_3").data("ionRangeSlider").result.to */
	},function(res){
		if(res.success){
			$.each(res.rows , function(index , item){
				if(checknull(item.lon) == "")return;
				markersdata.push(item);
				if(item.type == "A01"){
					var marker = new naver.maps.Marker({			//마커
						position : {y:item.lon , x: item.lat} 
		    			,map: map
		    			,icon : {
		    				content : getMarkerIcon(item.jobtype)
		    			}
					})		
				}else {
					var marker = new naver.maps.Marker({			//마커
						position : {y:item.lon , x: item.lat} 
		    			,map: map
//		    			,title : JSON.stringify(item)
		    			,icon : {
		    				content : getMarkerIcon(item.jobtype)
		    			}
					})  		
				}
				/*
				if(type == "A01"){
					kakao.maps.event.addListener(marker, 'click', function() {
						infowindow.close();
						var obj = JSON.parse(marker.getTitle());
						var imgs = "";
						if(checknull(res.rows.logo_img) == ""){
							imgs = "/resources/img/p_dangil_logo.png?ver=20210617"
						}else{
							imgs = checknull(res.rows.logo_img);
						}
						var button = "";
	            		 if(ifnull(obj.today_job_status , -1) == -1){
	            			 button = '<span class="btn btn-secondary" style="margin-bottom:0px;margin-left:130px" onclick="addJob('+item.seq+');changeBtn(this,0,'+item.seq+')">신청</span>'	
                        }else{
                       	 if(ifnull(item.today_job_status , -1) == 0){
                       		button = '<span class="btn btn-primary" style="margin-bottom:0px;margin-left:107px" onclick="cancelJob('+item.seq+');changeBtn(this,1,'+item.seq+')">승인대기</span>' 
                       	 }else if(ifnull(item.today_job_status , -1) == 1){
                       		 button = "";
                    		 button += '<a href="tel:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-bottom:0px"><i class="fa fa-phone"></i> 전화 </span>'
                    		 button += '<a href="sms:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-left:5px;margin-bottom:0px"><i class="fa fa-envelope"></i> 문자 </span>'
                       	 }else{
                       		 button = '<span class="btn btn-warning" style="margin-bottom:0px;margin-left:130px">거절</span>'
                       	 }
                        }
						infowindow.setContent('<div class="col-lg-12 col-12 mt-4 mt-lg-0" style=";overflow:auto">'
						        +'  <div class="card" style="background-color: transparent">'
						        +'    <div class="card-header p-3 pb-0">'
						        +'    <div class="row">'
						        +'      <div class="col-8 d-flex">'
						        +'        <div>'
						        +'          <img src="'+imgs+'" class="avatar avatar-sm me-2" >'
						        +'        </div>'
						        +'        <div class="d-flex flex-column justify-content-center">'
						        +'          <h6 class="mb-0 text-sm">'+obj.name+'</h6>'
						        +'          <p class="text-xs">'+getStar(obj.seq , checknull(obj.score,0) , obj , false,"0px")+'</p>'
						        +'        </div>'
						        +'      </div>'
						        +'      <div class="col-4">'
						        +'        <span class="badge bg-gradient-info ms-auto float-end">구직회원</span>'
						        +'      </div>'
						        +'    </div>'
						        +'  </div>'
						        +'  <div class="card-body p-3 pt-1" style="background-color: transparent;">'
						        +'    <h6 style="font-size:12px;min-width:240px">'+obj.sigungu+'</h6>'
						        +'    <div class="d-flex bg-gray-100 border-radius-lg p-3">'
						        +'       <h4 class="my-auto">'
						       // +'         <span class="text-secondary text-sm me-1">$</span>3,000<span class="text-secondary text-sm ms-1">/ month </span>'
						        +'       </h4>'
						        +button
						        +'     </div>'
						        +'   </div>'
						        +' </div>'
						        +'</div>');
					      // 마커 위에 인포윈도우를 표시합니다
					      infowindow.open(map, marker);  
					});
				}else{
					kakao.maps.event.addListener(marker, 'click', function() {
						infowindow.close();
						var obj = JSON.parse(marker.getTitle());
						var imgs = "";
						if(checknull(res.rows.logo_img) == ""){
							imgs = "/resources/img/p_dangil_logo.png?ver=20210617"
						}else{
							imgs = checknull(res.rows.logo_img);
						}
						var button = "";
	            		 if(ifnull(obj.today_job_status , -1) == -1){
	            			 button = ''	
                        }else if(ifnull(obj.today_job_status , -1) == 1){
                        	button += '<a href="tel:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-bottom:0px"><i class="fa fa-phone"></i> 전화 </span>'
                   		 	button += '<a href="sms:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-left:5px;margin-bottom:0px"><i class="fa fa-envelope"></i> 문자 </span>'
                        }else if(ifnull(obj.today_job_status , -1) == 0){
                        	button = '<span class="btn btn-info" style="cursor:pointer;margin-bottom:0px"  onclick="okJob('+item.seq+')">승인</span><span style="margin-left:10px;cursor:pointer;margin-bottom:0px" class="btn btn-danger" onclick="rejectJob('+item.seq+')">거절</span>' 
                        }else{
                        	button = '<span class="btn btn-warning" style="margin-bottom:0px">거절되셧습니다.</span>'
                        }
						infowindow.setContent('<div class="col-lg-12 col-12 mt-4 mt-lg-0" style=";overflow:auto">'
						        +'  <div class="card" style="background-color: transparent">'
						        +'    <div class="card-header p-3 pb-0">'
						        +'    <div class="row">'
						        +'      <div class="col-8 d-flex">'
						        +'        <div>'
						        +'          <img src="'+imgs+'" class="avatar avatar-sm me-2" >'
						        +'        </div>'
						        +'        <div class="d-flex flex-column justify-content-center">'
						        +'          <h6 class="mb-0 text-sm">'+obj.name+'</h6>'
						        +'          <p class="text-xs">'+getStar(obj.seq , checknull(obj.score,0) , obj , false,"0px")+'</p>'
						        +'        </div>'
						        +'      </div>'
						        +'      <div class="col-4">'
						        +'        <span class="badge bg-gradient-info ms-auto float-end">구인회원</span>'
						        +'      </div>'
						        +'    </div>'
						        +'  </div>'
						        +'  <div class="card-body p-3 pt-1" style="background-color: transparent;">'
						        +'    <h6 style="font-size:12px;min-width:240px">'+obj.sigungu+'</h6>'
						        +'    <div class="d-flex bg-gray-100 border-radius-lg p-3">'
						        +'       <h4 class="my-auto">'
						       // +'         <span class="text-secondary text-sm me-1">$</span>3,000<span class="text-secondary text-sm ms-1">/ month </span>'
						        +'       </h4>'
						        +button
						        +'     </div>'
						        +'   </div>'
						        +' </div>'
						        +'</div>');
					      // 마커 위에 인포윈도우를 표시합니다
					      infowindow.open(map, marker);  
					});
				}
				*/
				markers.push(marker);
				
			})
			//modal_memberview
			modalSetData(markersdata);
			if(markerClustering != null) markerClustering.setMap(null);
			 markerClustering = new MarkerClustering({												//클러스터 옵션
					minClusterSize: 1,
				    maxZoom: 12,   	  																		// 최대 지도 확대 레벨(maxZoom &gt; map zoom, 클러스터 마커 표시)
				    map: map,   
				    markers: markers,
				    disableClickZoom: false,  																// 클러스터 마커 클릭 시 줌 동작 여부입니다.
				    gridSize: 120,					  														//클러스터를 구성할 그리드 크기. 다누이 픽셀
				    icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4],				// 클러스터 마커용 아이콘
				  //  indexGenerator: [10, 100, 200, 500, 1000],	
				    indexGenerator: [1, 2, 3, 4],                  
				    stylingFunction: function(clusterMarker, count, markers) {										 // 클러스터 마커 갱신 시 호출
				        $(clusterMarker.getElement()).find('div:first-child').text(markers.length);
				    } 				  
				});
		}
	})
}

function modalSetData(markersdata){
	$(".itemList").empty();
	var dump = "";
	var cnt = 0 ;
	$.each(markersdata , function(index , item){
			if(item.rec_public_scope == "true") {
				cnt++;
				$("#total_cnt").text(cnt);
					dump += getitem(item);
			}
	})
	$(".itemList").append(dump);
}

function cancelJob(seq){
	Kconfirm("작업요청을 취소하시겠습니까?","",function(){
		Kajax("/action/cancelJob",{
			target_user_seq : seq
			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
		},function(res){
			if(res.success){
				Ktoast({text:"작업요청이 취소되었습니다."});
				load();
			}
		})
	},null,true);
}
function addJob(seq){
	Kconfirm("작업을 요청하시겠습니까?","",function(){
		Kajax("/action/addJob",{
    		target_user_seq : seq
    		,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    	},function(res){
    		if(res.success){
    			Ktoast({text : "작업요청이 완료되었습니다."});
    			load();
    		}
    	})
	},null,true);
}
function getitem(item){
	var button = "";
	if(type == "null"){
		button = '	<a href="javascript:ismembercheck()">신청하기</a>'
	}
	else {
		if(type == "A01"){
			if(ifnull(item.today_job_status , -1) == 0){
				button = '	<a href="javascript:cancelJob('+item.seq+')">승인대기</a>'
			}else{
				button = '	<a href="javascript:addJob('+item.seq+')">신청하기</a>'	
			}
		}
	}
	return '<div class="item">'
	+'<div class="info">'
	+'<div class="left">'
	+'<div class="side_bar">'
	+'	<div class="top">'
	+getJobBar(checknull(item.rec_job,item.jobtype))
	+'		<span>'+checknull(item.sigungu)+'</span>'
	+'	</div><a href="/view/detail/'+item.seq+'">'
	+'	<div class="mid" >'
	+ checknull(item.onelinetext,"입력된 메시지가 없습니다.")
	+'	</div></a>'
	+'	<div class="btm">'
	+'		<span>'+item.name
	+ getStarImg(checknull(item.score,0))
	+'		</span>'
	+'		<span>'+getAge(checknull(item.regident_reg,"정보없음"))+'</span>'
	+'		<span>'+getGender(item.regident_reg)+'</span>'
	+'	</div>'
	+'</div>'
	+'</div>'
	+'<div class="right">'
	+'	<button class="btn_heart"></button>'
	+'	<h3>'+comma(checknull(item.rec_pay,0))+'원</h3>'
	+button
	+'</div>'
	+'</div>'
	+'</div>'
}
function getJobBar(job){
	if(job == "T00"){
		return '<mark class="bg_blue">건설인력</mark>';
	}else if(job == "T01"){
		return '<mark class="bg_green">물류인력</mark>';
	}else if(job == "T02"){
		return '<mark class="bg_red">여성인력</mark>';
	}else if(job == 'T03'){
		return '<mark class="bg_purple">중장비</mark>';
	}else if(job == "T04"){
		return '<mark class="bg_orange">용달/화물차</mark>';
	}
}
function getStarImg(score){
	var starstring = "";
	for(var i = 0 ; i < score ; i++){
		starstring += '<img src="/resources/djver/images/icon_star.png" alt="평점">';
	}
	return starstring;
}
function getMarkerIcon(type){
	switch(type){
		default:
			case "T00" :
				return '<div class="pointer pointer1" style="background-color:white">'
				+ '<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>'
				+ '<span>건설인력</span>'
				+ '</div>';
			break;
			case "T01":
				return '<div class="pointer pointer2" style="background-color:white">'
				+ '<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>'
				+ '<span>물류인력</span>'
				+ '</div>';
			break;
			case "T02":
				return '<div class="pointer pointer3" style="background-color:white">'
				+ '<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>'
				+ '<span>여성인력</span>'
				+ '</div>';
			break;
			case "T03":
				return '<div class="pointer pointer5" style="background-color:white">'
				+ '<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>'
				+ '<span>중장비</span>'
				+ '</div>';
			break;
			case "T04":
				return '<div class="pointer pointer4" style="background-color:white">'
				+ '<div class="img"><img src="/resources/djver/images/map/icon_car.png" alt="icon" style="transition-duration: 0.2s;"></div>'
				+ '<span>용달/화물차</span>'
				+ '</div>';
			break;
	}
}
</script>
</body>
</html>
