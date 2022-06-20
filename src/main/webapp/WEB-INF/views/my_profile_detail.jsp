<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
	
	<link type="text/css" href="/resources/djver/style/reset.css" rel="stylesheet">
	<link type="text/css" href="/resources/djver/style/common.css" rel="stylesheet">
	<link type="text/css" href="/resources/djver/style/swiper-bundle.css" rel="stylesheet">
	<link type="text/css" href="/resources/djver/style/layout.css" rel="stylesheet">
	<link type="text/css" href="/resources/djver/style/design.css" rel="stylesheet">
	<link type="text/css" href="/resources/djver/style/main.css" rel="stylesheet">
	<link type="text/css" href="/resources/djver/style/bootstrap.css" rel="stylesheet">
	<link href="/resources/css/plugins/sweetalert/sweetalert.css?ver=1" rel="stylesheet">
	<!-- <link type="text/css" href="./style/uicons-regular-rounded.css" rel="stylesheet" /> -->
	<link type="text/css" href="./style/bootstrap-icons.css" rel="stylesheet" />
  <%@ include file="include/importjs.jsp" %>
       <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed6c9066304732496c815fbca5dfc889&libraries=services"></script>
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
	<%@ include file="view/navBtmMobil.jsp" %>

	<div class="pagetitle_pc">
		<div class="maxWrap">
			<h3>상세 정보 관리</h3>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">상세 정보 관리</li>
			</ol>
		</div>
	</div>


	<div class="mypage">
		<div class="form-mypage">
			<ul class="listview image-listview"  style="border-bottom:1px solid #eee;">
				<li>
					<div class="item">
						<img src="/resources/djver/images/photo_logo.png" alt="image" class="image">
						<div class="in">
							<div>
								<header id="type_name">구인회원 / 정회원</header>
								<h3 id="my_name">홍길동</h3>
								<div id="my_star"></div>
							</div>
							<!-- <button type="button" class="btn btn-primary rounded-pill btn-sm">수정</button> -->
							<a href="#"><img src="/resources/djver/images/nav_arrow_right.png" alt="" style="width: 7px;height: 15px;transition-duration: 0.2s;opacity: 0.5;" /></a>  
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="join">
		<div class="form-profile">			
			<form>
				<div class="row mb-3">
					<label for="inputId" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<input type="Id" id="user_id" class="form-control" placeholder="" disabled="disabled" >
					</div>
			    </div>
				<div class="row mb-3">
					<label for="inputPassword" class="col-sm-2 col-form-label" >기존 비밀번호</label>
					<div class="col-sm-10">
						 <input type="password" class="form-control" id="prepwd"  placeholder="*******" >
					</div>
			    </div>
			    <div class="row mb-3">
					<label for="inputPassword" class="col-sm-2 col-form-label" >새로운 비밀번호</label>
					<div class="col-sm-10">
						 <input type="password" class="form-control" id="pwd"  placeholder="새로 설정할 비밀번호 조건(몇자이내, 특수문자) 입력해주세요" >
					</div>
			    </div>
				<div class="row mb-3">
					<label for="inputPassword2" class="col-sm-2 col-form-label" >비밀번호 확인</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pwdc" placeholder="새로 설정한 비밀번호를 다시 한번 입력해주세요">
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputIDnumber1" class="col-sm-2 col-form-label" >주민등록번호</label>
					<div class="col-sm-5 col-6 pe-0">
					   <input type="IDnumber" class="form-control" id="regident_reg1" placeholder="000000" aria-label="Disabled input example" disabled maxlength='6'>
					</div>
					<div class="col-sm-5 col-6">
				        <input type="inputIDnumber2" class="form-control" id="regident_reg2" placeholder="1******" aria-label="Disabled input example" disabled maxlength='7'>
					</div>
				</div>
				<div class="row mb-3">
					<label for="inputtel" class="col-sm-2 col-form-label" >휴대폰번호</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="phone_number" setPhoneNumber placeholder="-은 뺴고 입력해주세요">
					</div>
			    </div>
				<div class="row mb-3">
					<label for="inputaddress" class="col-sm-2 col-form-label">거주지(주소)</label>
					<div class="col-sm-7 col-8 pe-0">
					   <input type="address" class="form-control" id="searchAddress" aria-label="Disabled input example" disabled>
					   <div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
            				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
        			 </div>
					   <input type="address" class="form-control mt-3" id="searchAddressDetail" placeholder="기존 주소 출력 - 변경가능">
					</div>
					<div class="col-sm-3 col-4">
					   <button class="btn btn-secondary w-100 fz13 btnSettingzipcode on" type="button" id="button-checkid" onclick="postCode()">주소검색</button>
					</div>
			    </div>
				<div class="row mb-3">
					<label for="inputaddress2" class="col-sm-2 col-form-label">현재 위치(주소)</label>
					<div class="col-sm-7 col-8 pe-0">
					  <input type="address" class="form-control" id="location" placeholder="현재위치를 설정해주세요" disabled="disabled">
					  <div id="wrap2" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
            				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode2()" alt="접기 버튼">
        			 </div>
					</div>
					<div class="col-sm-3 col-4">
					   <button class="btn btn-secondary w-100 fz13 btnSettingzipcode on" type="button" onclick="currentpostCode()">주소검색</button>
					</div>
			    </div>

			    <div class="row mb-3">
					<label for="inputgender" class="col-sm-2 col-form-label" >성별</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col">
							  <input type="radio" class="btn-check valid" name="gender" id="jobs-application-gender-male" value="1" checked="checked">
							  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-application-gender-male">남성</label>
							</div>
							<div class="col">
								<input type="radio" class="btn-check valid" name="gender" id="jobs-application-gender-female" value="0">
								<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-application-gender-female">여성</label>
							</div>
						</div>
					</div>
			    </div>

			    <div class="row mb-3">
					<label for="inputnationality" class="col-sm-2 col-form-label" >국적</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col">
							  <input type="radio" class="btn-check valid" name="rec_contry" id="jobs-nationality-local" value="1" checked="checked">
							  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-nationality-local">내국인</label>
							</div>
							<div class="col">
								<input type="radio" class="btn-check valid" name="rec_contry" id="jobs-nationality-foreigner" value="0">
								<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-nationality-foreigner">외국인</label>
							</div>
						</div>
					</div>
			    </div>
				<div class="row mt-6">
					<div class="col-2 pe-0">
					</div>
					<div class="col-10">
					<button class=" btn btn-lg btn-primary w-100" type="button" id="updateButton">수정</button>
					</div>
				</div>	
			</form>
			


		</div>
	</div>
	<%@ include file="include/footer.jsp" %>
 <script>
 var geocoder = new daum.maps.services.Geocoder();
 var element_wrap = document.getElementById('wrap');
 var element_wrap2 = document.getElementById('wrap2');
 function foldDaumPostcode() {
     // iframe을 넣은 element를 안보이게 한다.
     element_wrap.style.display = 'none';
     $("#empcalendar").modal("hide");
 }
 function foldDaumPostcode2() {
     // iframe을 넣은 element를 안보이게 한다.
     element_wrap2.style.display = 'none';
     $('#empcalendar2').modal('hide');
 }
 function currentpostCode(){
	// 현재 scroll 위치를 저장해놓는다.
     var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
     new daum.Postcode({
         oncomplete: function(data) {
             // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 $("#location").val(extraAddr);
                 
                 $("#location").attr("sigungu" , data.sido + " " +data.sigungu);
             
             } else {
             	$("#location").val("");
             }
             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             $("#location").val(addr);
             // 커서를 상세주소 필드로 이동한다.
             // iframe을 넣은 element를 안보이게 한다.
              geocoder.addressSearch(data.address, function(results, status) { // 정상적으로 검색이 완료됐으면
             	if (status === daum.maps.services.Status.OK) {
             		var result = results[0];
             		//첫번째 결과의 값을 활용 
             		// 해당 주소에 대한 좌표를 받아서 
             		var coords = new daum.maps.LatLng(result.y, result.x);
             		//$("#Location").val(result.y + ","+ result.x);
             		$("#location").attr("lon",result.y);
             		$("#location").attr("lat",result.x);
             		element_wrap2.style.display = 'none';
             		} 
             });
             // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
             document.body.scrollTop = currentScroll;
         },
         // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
         onresize : function(size) {
        	 element_wrap2.style.height = size.height+'px';
         },
         width : '100%',
         height : '100%'
     }).embed(element_wrap2);

     // iframe을 넣은 element를 보이게 한다.
     element_wrap2.style.display = 'block';
 }
 function postCode() {
     // 현재 scroll 위치를 저장해놓는다.
     var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
     new daum.Postcode({
         oncomplete: function(data) {
             // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 $("#searchAddress").val(extraAddr);
                 
                 $("#searchAddress").attr("sigungu" , data.sido + " " +data.sigungu);
             
             } else {
             	$("#searchAddress").val("");
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             $("#searchAddress").val(addr);
             // 커서를 상세주소 필드로 이동한다.
             // iframe을 넣은 element를 안보이게 한다.
              geocoder.addressSearch(data.address, function(results, status) { // 정상적으로 검색이 완료됐으면
             	if (status === daum.maps.services.Status.OK) {
             		var result = results[0];
             		//첫번째 결과의 값을 활용 
             		// 해당 주소에 대한 좌표를 받아서 
             		var coords = new daum.maps.LatLng(result.y, result.x);
             		//$("#Location").val(result.y + ","+ result.x);
             		$("#searchAddress").attr("lon",result.y);
             		$("#searchAddress").attr("lat",result.x);
             		 element_wrap.style.display = 'none';
             		} 
             });
            
             // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
             document.body.scrollTop = currentScroll;
         },
         // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
         onresize : function(size) {
             element_wrap.style.height = size.height+'px';
         },
         width : '100%',
         height : '100%'
     }).embed(element_wrap);

     // iframe을 넣은 element를 보이게 한다.
     element_wrap.style.display = 'block';
 }
    load();
    $(document).ready(function() {
    	event();
    });
    function event(){
    	$("#updateButton").click(function(){
    		if($("#pwd").val() != ""){
    			Kajax("/actionone/getCheckPwd",{
    				pwd : $("#prepwd").val()
    				,seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    			},function(res){
    				if(res.success){
    					if(res.rows.cnt != 0){
    						Kalert("알림","비밀번호 수정이 완료되었습니다.",function(){
    							updateMemberInfo();
    		    			});
    					}
    				}
    			})
    		}else{
    			updateMemberInfo();
    		}
    	});
    	
    }
    function updateMemberInfo(){
    	Kajax("/actionupdate/updateMemberinfo",{
    		phone_number : $("#phone_number").val()
    		,address : $("#searchAddress").val()
    		,address_detail : $("#searchAddressDetail").val()
    		,lon : $("#location").attr("lon")
    		,lat : $("#location").attr("lat")
    		,location_addr : $("#location").val()
    		,gender : $("input[name='gender']:checked").val()
    		,rec_contry : $("input[name='rec_contry']:checked").val()
    		,seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    	},function(res){
    		if(res.success){
    			Kalert("알림","수정이완료되었습니다.",function(){
    				location.reload();
    			});
    		}
    	})
    }
    function load(){
    	Kajax("/action/getMyinfo",{
    		seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    	},function(res){
    		if(res.success){
    			$("#my_name").text(res.rows.name);
    			$("#my_star").empty();
    			$("#my_star").append(getStar(res.rows.seq , res.rows.my_score , res.rows , false));
    			$("#my_star").append('<a href="#"  class="fz12">(112)</a>');
    			$("#type_name").text((res.rows.type == "A01" ? "구인회원" : "구직회원")+" / 정회원" );
    			$("#user_id").val(res.rows.user_id);
    			$("#regident_reg1").val(res.rows.regident_reg.split("-")[0]);
    			$("#regident_reg2").val(res.rows.regident_reg.split("-")[1]);
    			$("#phone_number").val(res.rows.phone_number);
    			$("#address").text(res.rows.address);
    			$("#address").text(res.rows.address);
    			$("#address_detail").text(res.rows.address_detail);
    			$("#location_txt").text(res.rows.location_addr);
    			$("#searchAddress").val(res.rows.address);
    			$("#searchAddress").attr("lon",res.rows.lon);
        		$("#searchAddress").attr("lat",res.rows.lat);
        		$("#searchAddressDetail").val(res.rows.address_detail);
        		$("#edit-deschiption-edit").html(res.rows.contents);
        		$("#onelinetext").val(res.rows.onelinetext);
        		$("#all_count").text((checknull(res.rows.my_today_count,0)+checknull(res.rows.my_log_count,0))+"건");
        		$("#log_count").text(checknull(res.rows.my_log_count,0)+"건");
        		$("#today_count").text(checknull(res.rows.my_today_count,0)+"건");
        		$("#location").val(res.rows.location_addr);
        		$("#location").attr("lon",res.rows.lon);
        		$("#location").attr("lat",res.rows.lat);
    			$("#contentsText").html(res.rows.contents);
    			$("#contents").html(res.rows.contents);
    			$('input:radio[name=gender][value='+res.rows.gender+']').attr('checked', true);
    			$('input:radio[name=gender][value='+res.rows.rec_contry+']').attr('checked', true);
    			if(checknull(res.rows.logo_img) != ""){
    				$("#main_img").attr("src",res.rows.logo_img);
               	 $("#main_img").attr("url",res.rows.logo_img);	
    			}
    		}
    	})
    }
    $('input[setPhoneNumber]').on('keyup', function() { 
    	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
    });
    
    </script>
</body>
</html>
