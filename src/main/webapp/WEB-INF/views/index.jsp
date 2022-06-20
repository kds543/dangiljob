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
</head>
<body>
<script>
$(function(){
	$("a, header, img").each(function(){
		$(this).css({transitionDuration:".2s"});
	});
});
</script>
<%@ include file="include/head.jsp" %>
<%@ include file="include/navimobile.jsp" %>
	<div class="bg"></div>
	<%@ include file="view/navBtmMobil.jsp" %>

	<div class="popupSearch">
		<div class="maxWrap">
			<a href="javascript:;" class="close_search">
				<img src="images/close_search.png" alt="검색창 닫기">
			</a>
			<div class="top" style="visibility: hidden;">
				<div class="search">
					<select name="" id="">
						<option>전체</option>
						<option>카테고리1</option>
						<option>카테고리2</option>
					</select>
					<div class="inputbox">
						<input type="text">
						<a href="javascript:;" class="del_input">
							<img src="images/del_input.png" style="height:12px;" alt="닫기" >
						</a>
						<a href="javascript:;" class="btn_search">
							<img src="images/icon_search.png" alt="검색">
						</a>
					</div>
				</div>
				<a href="javascript:;" class="btn_filter"><img src="images/icon_filter.png" alt="필터" style="height:22px;"></a>
			</div>
			<div class="btm">
				<button>#건설인력</button>
				<button>#여성인력</button>
				<button>#용달화물차</button>
				<button>#중장비</button>
			</div>
		</div>
	</div>




	<div class="mainSlideVisual">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<a href="javascript:;" class="box" style="background-image: url(/resources/djver/images/slide/visual_bg1.png);">
					<div class="wrapper">
						<h2>
							내가 가는 곳이 곧 일터!<br>
							일자리 매칭 서비스 플랫폼
						</h2>
						<p>
							
							당일JOB에서는 내가 있는 곳, <br>그리고 내가 가는 모든 곳이
							일터가 됩니다.
						</p>
					</div>
				</a>
			</div>
			<div class="swiper-slide">
				<a href="javascript:;" class="box" style="background-image: url(/resources/djver/images/slide/visual_bg2.png);">
					<div class="wrapper">
						<h2>
							내가 원하는 시간, 장소에서<br>
							자유롭게 일하기
						</h2>
						<p>
							
							당일JOB에서는 내가 있는 곳, <br>그리고 내가 가는 모든 곳이
							일터가 됩니다.
						</p>
					</div>
				</a>
			</div>
		</div>
		<div class="swiper-pagination"></div>
		<!-- <div class="swiper-button-prev">
			<img src="/resources/djver/images/slide_prev.png" alt="prev">
		</div>
		<div class="swiper-button-next">
			<img src="/resources/djver/images/slide_next.png" alt="next">
		</div> -->
	</div>


	<div class="popup_position">
		<div class="con">
			<div class="head">
				<button class="btn_position_back">
					<img src="/resources/djver/images/icon_back.png" alt="닫기">
				</button>
				<h4>내 위치 설정하기</h4>
				<button class="btn_position_close">
					<img src="/resources/djver/images/icon_position_close.png" alt="닫기">
				</button>
			</div>
			<div class="mid">
				<input type="text" placeholder="지번, 도로명, 건물명으로 검색">
				<a href="javascript:;" class="btnSettingPosition off">
					<img src="/resources/djver/images/icon_position.png" alt="">
					<span>현재 위치로 설정하기</span>
				</a>
			</div>
			<div class="btm">
				<h5>주소 검색 이렇게 해보세요!</h5>
				<ul>
					<li>
						<b>· 지역명 + 번지</b>
						<span>예) 당일동 10-1</span>
					</li>
					<li>
						<b>· 도로명 + 건물번호</b>
						<span>예) 당일동 10길 1</span>
					</li>
					<li>
						<b>· 건물명, 아파트명</b>
						<span>예) 당일아파트 101동</span>
					</li>
				</ul>
			</div>
		</div>
		<div class="bg"></div>
	</div>


	<main class="maxWrap">
		<div class="todayjob">
			<h2 class="title">오늘의 일자리</h2>
			<div class="tabBtn" style="display:none">
				<a href="javascript:;" id="typeAll" class="on">전체</a>
				<a href="javascript:;" id="T00">건설인력</a>
				<a href="javascript:;" id="T01">물류인력</a>
				<a href="javascript:;" id="T02">여성인력</a>
				<a href="javascript:;" id="T04">용달/화물차</a>
				<a href="javascript:;" id="T03">중장비</a>
			</div>
			<div class="tabContent">
				<!-- <div class="filterbox">
					<img src="images/icon_map.png" alt="일자리 위치">
					<div class="btn">
						<button class="on1">경기도</button>
						<button class="on2">광주시</button>
						<button>오포읍</button>
					</div>
					<img src="images/icon_filter.png" alt="지역 구분">
				</div> -->
<!-- 
				<div class="searchPositionbox">
					<a href="javascript:;" class="btnSettingPosition on">
						<img src="/resources/djver/images/icon_position_on.png" alt="">
						<span>내 위치를 설정해주세요</span>
					</a>
				</div>
 -->
				<div class="imgPopupBox">
					<img src="/resources/djver/images/sample_popup.jpg" />
					<div class="bg"></div>
				</div>
				<div class="itemList" id="joblist" style="max-height: 989px;overflow: hidden;">
				</div>
			</div><!--//tabContent-->

			<div class="btnbox">
				<a href="/view/joblist" class="btnCommonStyle1">
					<img src="/resources/djver/images/icon_list.png" alt="list">
					<span>건설인력 일자리 더보기</span>
				</a>
				<a href="/map" class="btnCommonStyle1">
					<img src="/resources/djver/images/icon_map.png" alt="map">
					<span>지도로 더 보기</span>
				</a>
			</div>
		</div>
	</main>

	<div class="mainBanner">
		<div class="maxWrap">
			<h2>당일JOB과 함께라면<br>내가 가는 곳이 곧 일터!</h2>
			<div class="btn">
				<a href="javascript:;">
					<img src="/resources/djver/images/img_googlestore.png" alt="구글스토어 다운로드">
				</a>
				<a href="javascript:;">
					<img src="/resources/djver/images/img_appstore.png" alt="앱스토어 다운로드">
				</a>
			</div>
		</div>
	</div>

	<hr class="mobileline" />

	<div class="maxWrap">
		<div class="mainSlideNewsWrap">
			<h2 class="title">당일JOB 뉴스</h2>
			<div class="mainSlideNews">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
					<div class="swiper-slide">
						<a href="javascript:;" class="box"><img src="/resources/djver/images/thum_01.png" alt="" /></a>
						<p>당일JOB 뉴스를 준비중입니다.</p>
					</div>
				</div>
			</div>
			<div class="swiper-button-prev">
				<img src="/resources/djver/images/slide_prev.png" alt="prev">
			</div>
			<div class="swiper-button-next">
				<img src="/resources/djver/images/slide_next.png" alt="next">
			</div>
			<div class="btmbox onlyone">
				<a href="javascript:alert('준비중입니다.')" class="btnCommonStyle1 ">당일JOB 뉴스 더 보기</a>
			</div>
		</div>

		<hr>

		<div class="mainNotice">
			<h2 class="title">공지사항</h2>
			<ul class="list">
				<li>
					<a href="javascript:;">
						<span class="text">공지사항이 준비중입니다.</span>
						<span class="date">2022-01-01</span>
					</a>
				</li>
			</ul>

			<div class="btmbox onlyone">
				<a href="javascript:alert('준비중입니다')" class="btnCommonStyle1">공지사항 더 보기</a>
			</div>

			<div class="h80"></div>
		</div>
	</div>
</main>

<%@ include file="include/footer.jsp" %>
<script>
$(document).ready(function() {
	load();
});
	function load(){
		$("#joblist").empty();
		Kajax("/action/jobloadlist",{
			type : "A01"
			,jotype : "T00"
			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
		,limit : 20
		},function(res){
			if(res.success){
				$.each(res.rows , function(index , item){
					if(item.rec_public_scope == "true")
						$("#joblist").append(getitem(item));
				})
			}
		})
		Kajax("/action/jobloadlist",{
			type : "A02"
			,jotype : "T00"
			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
		,limit : 20
		},function(res){
			if(res.success){
				$.each(res.rows , function(index , item){
					if(item.rec_public_scope == "true")
						$("#joblist").append(getitem(item));
				})
			}
		})
		<% if(String.valueOf(request.getAttribute("type")).equals("A02")){ %>
		$("#joblist").empty();
		Kajax("/action/jobloadlist",{
			type : "A01"
			,jotype : "T00"
			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
		,limit : 20
		},function(res){
			if(res.success){
				$.each(res.rows , function(index , item){
					if(item.rec_public_scope == "true")
						$("#joblist").append(getitem(item));
				})
			}
		})
		<% } %>
		
		<% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
		$("#joblist").empty();
		Kajax("/action/jobloadlist",{
			type : "A02"
			,jotype : "T00"
			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
		,limit : 20
		},function(res){
			if(res.success){
				$.each(res.rows , function(index , item){
					if(item.rec_public_scope == "true")
						$("#joblist").append(getitem(item));
				})
			}
		})
		<% } %>
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
	function getitem(item){
		return '<div class="item '+item.jobtype+'">'
		+'<div class="img openImgPopup">'
		+'	<img src="/resources/djver/images/sample.jpg" alt="">'
		+'</div>'
		+'<div class="info">'
		+'			<div class="left">'
		+'<div class="top">'
		+ getJobBar(checknull(item.rec_job,item.jobtype))
		+'		<span>'+checknull(item.location_addr,"정보없음")+'</span>'
		+'	</div>'
		+'	<a href="/view/detail/'+item.seq+'" class="mid">'
		+'		'+checknull(item.onelinetext,"정보없음")
		+'	</a>'
		+'	<div class="btm">'
		+'		<span> '+item.name
		+getStarIg(item.seq , item.score , item , false)
		+'		</span>'
		+'		<span>'+checknull(item.rec_detail_job,"정보없음")+'</span>'
		+'		<span>'+checknull(NullCheck(item.rec_date_time)+"시간","정보없음")+'</span>'
		+'	</div>'
		+'</div>'
		+'<div class="right">'
		+'	<button class="btn_heart"></button>'
		+'	<h3>'+comma(checknull(item.rec_pay,0))+'원</h3>'
		+'</div>'
		+'</div>'
		+'</div>'
	}
	 function getStarIg(seq,score, item , clickable,margin){
		 	var star = "";
		 	var margin_d = checknull(margin,"10px");
		 	if(clickable){
		 		star += '<img onclick="clickStar(1,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 1 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_1_'+seq+'" class="fa fa-star star_'+seq+'">';
		 		star += '<img onclick="clickStar(2,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 2 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_2_'+seq+'" class="fa fa-star star_'+seq+'">';
		    	star += '<img onclick="clickStar(3,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 3 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_3_'+seq+'" class="fa fa-star star_'+seq+'">';
		    	star += '<img onclick="clickStar(4,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 4 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_4_'+seq+'" class="fa fa-star star_'+seq+'">';
		    	star += '<img onclick="clickStar(5,`'+seq+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+')" src="'+(score >= 5 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;" id="star_id_5_'+seq+'" class="fa fa-star star_'+seq+'">';
		 	}else{
		 		star += '<img src="'+(score >= 1 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;;width:15px;height:15px" id="star_id_1_'+seq+'" class="fa fa-star star_'+seq+'">';
		 		star += '<img src="'+(score >= 2 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;;width:15px;height:15px" id="star_id_2_'+seq+'" class="fa fa-star star_'+seq+'">';
		 		star += '<img src="'+(score >= 3 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;;width:15px;height:15px" id="star_id_3_'+seq+'" class="fa fa-star star_'+seq+'">';
		 		star += '<img src="'+(score >= 4 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;;width:15px;height:15px" id="star_id_4_'+seq+'" class="fa fa-star star_'+seq+'">';
		 		star += '<img src="'+(score >= 5 ? "/resources/djver/images/star_full.png" : "/resources/djver/images/star_empty.png")+'" alt="평점" style="transition-duration: 0.2s;;width:15px;height:15px" id="star_id_5_'+seq+'" class="fa fa-star star_'+seq+'">';
		 	}
		 	return star;
		 }
	 function NullCheck(str) {
		 var newStr = str;
		 
		 if(newStr == null || newStr == "undefined") {
			 newStr = 0;
		 }
		 return newStr;
	 }
</script>
</body>
</html>
