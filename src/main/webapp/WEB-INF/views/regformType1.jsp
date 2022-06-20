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
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
      <!-- Toastr style -->
      <link type="text/css" href="/resources/djver/style/reset.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/common.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/swiper-bundle.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/layout.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/design.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/main.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/bootstrap.css" rel="stylesheet">
		<!-- <link type="text/css" href="./style/uicons-regular-rounded.css" rel="stylesheet" /> -->
		<link type="text/css" href="/resources/djver/style/bootstrap-icons.css" rel="stylesheet" />
		<link href="/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
   <script src="/resources/js/jquery-3.1.1.min.js"></script>
   <script src="/resources/js/kcommon.js?ver=3"></script>
   <script src="/resources/js/bootstrap.min.js"></script>
    <link href="/resources/css/plugins/sweetalert/sweetalert.css?ver=1" rel="stylesheet">
    <!-- Sweet alert -->
    <script src="/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
    <!-- Toastr -->
     <script src="/resources/js/plugins/toastr/toastr.min.js"></script>
    <script src="/resources/js/plugins/steps/jquery.steps.min.js"></script>
     <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed6c9066304732496c815fbca5dfc889&libraries=services"></script>
     <style>
        .wizard > .content {
        	 height:933px;
      		  background : #fff;
      		  border : 2px solid #eee;
        }
        .first{
        	min-width:50px
        }
        .disabled{
        	min-width:50px
        }
        .current{
        	min-width:50px
        }
		.ibox-content{
			padding-left:5px !important;
			padding-right:5px !important;
		}
    </style>
</head>

<body class="gray-bg" style="vertical-align: middle;margin: 0 auto;">
<script>
$(function(){ 
	$("a, header, img").each(function(){
		$(this).css({transitionDuration:".2s"});
	});
});
</script>
	 <%@ include file="include/head.jsp" %>
	<div class="navBtmMobile">
		<a href="./index.html" class="on">
			<i class="icon_btm_home"></i>
			<span>홈</span>
		</a>
		<a href="javascript:;">
			<i class="icon_btm_cal"></i>
			<span>나의배정</span>
		</a>
		<a href="javascript:;">
			<i class="icon_btm_list"></i>
			<span>나의일정</span>
		</a>
		<a href="javascript:;">
			<i class="icon_btm_com"></i>
			<span>커뮤니티</span>
		</a>
		<a href="javascript:;">
			<i class="icon_btm_user"></i>
			<span>내정보</span>
		</a>
	</div>



	<div class="subtitle">
		<div class="maxWrap">
		  <div class="row">
			<div class="col left">
			  <h4>02. 기본정보</h4>
			</div>
			<div class="col right">
			   <span class="wht">1</span>
			   <span class="blue">2</span>
			   <span class="wht">3</span>
			   <span class="wht">4</span>
			</div>
		  </div>
		</div>
	</div>
	<ul class="nav nav-tabs" style="display:none">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" id="tab1" href="#qwe">QWE</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" id="tab2" href="#asd">ASD</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" id="tab3" href="#zxc">ZXC</a>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane fade show active" id="qwe">
    <div class="join">
		<div class="form-join">
			<h3>기본정보를 입력해주세요.</h3>

			<form>
			  <div class="row mb-3">
				<label for="inputname" class="col-sm-3 col-form-label">이름</label>
				<div class="col-sm-9">
				   <input type="name" class="form-control" id="name" placeholder="이름을 입력해주세요">
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputId" class="col-sm-3 col-form-label">아이디</label>
				<div class="col-sm-5 col-6 pe-0">
				<!--  name is-valid -->
				   <input type="Id" class="form-control" placeholder="아이디를 입력해주세요" id="id" required>
				   <div class="valid-feedback">
					  사용할 수 있는 아이디 입니다.
					</div>
				</div>
				<div class="col-sm-4 col-6">
				   <button class="btn btn-secondary w-100 fz13" type="button" id="button-checkid" onclick="idCheck()">아이디 중복확인</button>
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputPassword" class="col-sm-3 col-form-label" >비밀번호</label>
				<div class="col-sm-9">
				   <input type="password" class="form-control is-invalid"  placeholder="비밀번호 조건(몇자이내, 특수문자) 입력해주세요" id="password" aria-describedby="inputGroupPrepend3 validationServerUsernameFeedback" required>
				   <div id="" class="invalid-feedback">
					비밀번호를 다시 입력해주세요.
				  </div>
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputPassword2" class="col-sm-3 col-form-label" >비밀번호 확인</label>
				<div class="col-sm-9">
				  <input type="password" class="form-control" id="password_c" placeholder="비밀번호를 다시 한번 입력해주세요">
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputIDnumber1" class="col-sm-3 col-form-label" >주민등록번호</label>
				<div class="col-sm-4 col-6 pe-0">
				  <input type="IDnumber" class="form-control" id="regident_reg" placeholder="주민번호 앞 6자리">
				</div>
				<div class="col-sm-5 col-6">
				  <input type="password" class="form-control" id="regident_reg2" placeholder="주민번호 뒤 7자리">
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputemail" class="col-sm-3 col-form-label" >이메일</label>
				<div class="col-sm-9">
				  <input type="email" class="form-control" id="email" placeholder="이메일 주소를 입력해주세요">
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputtel" class="col-sm-3 col-form-label" >휴대폰번호</label>
				<div class="col-sm-9">
				  <input type="tel" class="form-control" id="phone_number" placeholder="- 없이 숫자만 입력해주세요">
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputaddress" class="col-sm-3 col-form-label">주소</label>
				<div class="col-sm-6 col-8 pe-0">
				   <input type="address" class="form-control" id="searchAddress" aria-label="Disabled input example" disabled>
				</div>
				<div class="col-sm-3 col-4">
				   <button class="btn btn-secondary w-100 fz13 btnSettingzipcode on" type="button" id="button-checkid" onclick="postCode()">주소검색</button>
				</div>
			  </div>
			  <div class="row mb-3">
				<label for="inputaddress2" class="col-sm-3 col-form-label"></label>
				<div class="col-sm-9">
				  <input type="address" class="form-control mt-3" id="inputaddress3" placeholder="상세주소를 입력해주세요">
				   <div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
            				<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
        			 </div>
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputgender" class="col-sm-3 col-form-label" >성별</label>
				<div class="col-sm-9">
					<div class="row">
						<div class="col">
						  <input type="radio" class="btn-check valid" name="gender" id="jobs-application-gender-male" value="1" checked>
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
				<label for="inputnationality" class="col-sm-3 col-form-label" >국적</label>
				<div class="col-sm-9">
					<div class="row">
						<div class="col">
						  <input type="radio" class="btn-check valid" name="country" id="jobs-nationality-local" value="1" checked>
						  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-nationality-local">내국인</label>
						</div>
						<div class="col">
							<input type="radio" class="btn-check valid" name="country" id="jobs-nationality-foreigner" value="0">
							<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-nationality-foreigner">외국인</label>
						</div>
					</div>
				</div>
			  </div>


				<div class="row mt-6">
					<div class="col-2 pe-0">
					</div>
					<div class="col-10">
					<button class=" btn btn-lg btn-primary w-100" type="button" onclick="nextPage(1)">다음</button>
					</div>
				</div>	
			</form>
		</div>
	</div>
  </div>
  <!--  -->
  
  <div class="tab-pane fade" id="asd" >
  <div class="join">
		<div class="form-join">
			<h3>희망하는 직종 분야를 선택해주세요.</h3>

			<form>
			  <div class="row mb-5">				
				<div class="col-sm-12">
					<div class="row">
						<div class="col">
						  <input type="radio" class="btn-check valid" name="t_type_name" data-tname="t_type" data-code="T00" id="jobs-category-construction" value="Construction">
						  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-category-construction">건설인력</label>
						</div>
						<div class="col">
							<input type="radio" class="btn-check valid" name="t_type_name" data-tname="t_type" data-code="T01" id="jobs-category-distribution" value="distribution">
							<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-category-distribution">물류인력</label>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
						  <input type="radio" class="btn-check valid" name="t_type_name" data-tname="t_type" data-code="T02" id="jobs-category-Female" value="femaleresources">
						  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-category-Female">여성인력</label>
						</div>
						<div class="col">
							<input type="radio" class="btn-check valid" name="t_type_name" data-tname="t_type" data-code="T04" id="jobs-category-cargo" value="cargo">
							<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-category-cargo">용달/화물차</label>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col">
						  <input type="radio" class="btn-check valid" name="t_type_name" data-tname="t_type" data-code="T03" id="jobs-category-equipment" value="equipment">
						  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-category-equipment">중장비</label>
						</div>
					</div>
				</div>
			  </div>
				<div class="mb-3 mt-4">
				    <label for="formFile" class="form-label mb-2 fz14"><span class="fw800 me-1 fz14">구인회원</span> 신분증 <span class="fz12 c-blue">(뒷자리 6자리 가리고 등록하세요)</span></label>					
					<input class="form-control form-control-sm" type="file" accept="image/png, image/jpeg" id="img1_b" onchange="loadFileBack(this,'#img1')">					
				</div>

				<div class="mb-3 mt-4">
				    <label for="formFile" class="form-label mb-2 fz14"><span class="fw800 me-1 fz14">구인회원</span> 사업자등록증 <span class="fz12 c-blue">(뒷자리 3자리 가리고 등록하세요)</span></label>
				    <input class="form-control form-control-sm" type="file" accept="image/png, image/jpeg" id="img2_b" onchange="loadFileBack(this,'#img2')">
				</div>

				<div class="row mt-6">
					<div class="col-2 pe-0">
					<button class="btn btn-lg btn-secondary w-100" type="button" onclick="$('#tab1').trigger('click')"><i class="bi bi-arrow-left fz13"></i></button>
					</div>
					<div class="col-10">
					<button class=" btn btn-lg btn-primary w-100" type="button" onclick="nextPage(2)">다음</button>
					</div>
				</div>	
			</form>
		</div>
	</div>
  </div>
  <div class="tab-pane fade" id="zxc" >
  			<div class="join">
		<div class="form-join">
			<h3><span class="fw800 c_blue fz18" id="t_s_type_title">건설인력</span> 상세 직종 분야를 선택해주세요. <br>
			<span class="fz13">(복수 선택 가능합니다)</span></h3>
				
			<form>
			    <div class="row mb-5" id="t_s_type">				
			    </div>
				<div class="row mb-5" id="t_s_type2">				
			    </div>
					<div class="col-2 pe-0">
					<button class="btn btn-lg btn-secondary w-100" type="button" onclick="$('#tab2').trigger('click')"><i class="bi bi-arrow-left fz13"></i></button>
					</div>
					<div class="col-10">
					<button class=" btn btn-lg btn-primary w-100" type="button" onclick="complete()">가입완료</button>
					</div>
				</div>	
			</form>

		</div>
	</div>
  </div>
</div>
<%@ include file="include/footer.jsp" %>
</body>
<script type="text/javascript">

var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
function createComplete(){
	location.href = '/login';
}
function passwordCheck(){
	if($("#pwd").val() != $("#pwd2").val()){
		$("#pwd_body").addClass("has-error");
	}else{
		$("#pwd_body").removeClass("has-error");
	}
	
}
var typedata = "";
var typename = "";
function nextPage(value){
	if(value == 1){
		if($("#name").val() == ""){
			Ktoast({
				text : "이름은 필수 입력사항입니다."
				,type : 3
			})
			$("#name").focus();
			return;
		}
		
		if($("#id").val() == ""){
			Ktoast({
				text : "아이디는 필수 입력사항입니다."
				,type : 3
			})
			$("#id").focus();
			return;
		}
		
		if($("#id").hasClass("is-vali")){
			Ktoast({
				text : "아이디 중복확인을 해주세요"
				,type : 3
			})
			$("#id").focus();
			return;
		}
		
		if($("#password").val() == ""){
			Ktoast({
				text : "비밀번호는 필수 입력 사항입니다."
				,type : 3
			})
			$("#password").focus();
			return;
		}
		
		if($("#password").val() != $("#password_c").val()){
			Ktoast({
				text : "입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다."
				,type : 3
			})
			return;
		}
		if($("#regident_reg").val() == ""){
			Ktoast({
				text : "주민번호는 필수 입력사항입니다."
				,type : 3
			})
			$("#regident_reg").focus();
			return;
		}
		
		
		if($("#regident_reg2").val() == ""){
			Ktoast({
				text : "주민번호는 필수 입력사항입니다."
				,type : 3
			})
			$("#regident_reg2").focus();
			return;
		}
		
		if($("#email").val() == ""){
			Ktoast({
				text : "이메일은 필수 입력 사항입니다."
				,type : 3
			})
			$("#email").focus();
			return;
		}
		if(!validateEmail($("#email").val())){
			Ktoast({
				text : "이메일 양식을 확인하여 주세요"
				,type : 3
			})
			return;
		}
		if($("#phone_number").val() == ""){
			Ktoast({
				text : "전화번호는 필수 입력 사항입니다."
				,type : 3
			})
			$("#phone_number").focus();
			return;
		}
		if($("#searchAddress").val() == ""){
			Ktoast({
				text : "현재 거주지는 필수 입력사항입니다."
				,type : 3
			})
			$("#searchAddress").focus();
			return;
		}
		$("#tab2").trigger("click");
	}else if(value == 2){
		typedata = $("input[name='t_type_name']:checked").attr("data-code");
		typename = $("input[name='t_type_name']:checked").text();
		if(typedata == ""){
			Kalert("구분을 선택하여 주십시요");
			return;
		}
		$("#t_s_type").empty();
		$("#t_s_type2").empty();
		if(typedata == "T01"){
			$(".tstype").css("display","flex");
			getCodeOutLineButton("T010","t_s_type");
			getCodeOutLineButton("T012","t_s_type2");
			$("#t_s_type_title").text("물류");
			if(isMobile){
        		$(".wizard > .content").css("height","600px");
        	}else{
        		$(".wizard > .content").css("height","500px");
        	}
		}else{
			$(".tstype").css("display","none");
			getCodeOutLineButton(typedata,"t_s_type");
			$("#t_s_type_title").text(typename);
			if(isMobile){
        		$(".wizard > .content").css("height","500px");
        	}else{
        		$(".wizard > .content").css("height","400px");
        	}
		}
		$("#tab3").trigger("click");
	}else{
		
	}
}
function complete(){
	Kajax("/actionone/checkPhoneNumber",{
		phone_number : $("#phone_number").val()
	},function(res){
		if(res.success){
			if(res.rows.cnt != 0){
				Kalert("휴대전화 번호가 이미 존재합니다.");
				return;
			}else{
				Kajax("/action/checkid",{
	        		user_id : $("#id").val()
	        	},function(res){
	        		if(res.success){
	        			if(res.rows.cnt != 0){
	        				Kalert("이미 존재하는 아이디입니다.");
	        				return;
	        			}else{
	        				Kajax("/action/addMember",{
	        					name : $("#name").val()
	        					,address : $("#searchAddress").val()
	        					,address_detail : $("#addressDetail").val()
	        					,regident_reg : $("#regident_reg").val()+"-"+$("#regident_reg2").val()
	        					,user_id : $("#id").val()
	        					,user_pwd : $("#password").val()
	        					,phone_number : $("#phone_number").val()
	        					,email : $("#email").val()
	        					,location_addr : $("#searchAddress").val()
	        					,lon : $("#searchAddress").attr("lon")
								,lat : $("#searchAddress").attr("lat")
								,sigungu : $("#searchAddress").attr("sigungu")
	        					,type : "A01"
	        					,img1 : checknull($("#img1_b").attr("url"))
	        					,img2 : checknull($("#img2_b").attr("url"))
	        					,gender : $(':radio[name="gender"]:checked').val()
	        					,country : $(':radio[name="country"]:checked').val()
	        					,jobtype : typedata
	        				},function(res){
	        					if(res.success){
	        						Kajax("/action/addTypes",{
	        							user_seq : res.seq
	        							,code : typedata
	        						},function(res2){
	        							if(res2.success){
	        								var typedata_d="";
						            		for(var i = 0 ; i < $("input[name='t_s_type_name']").length ; i++){
						            			if($("#"+$("input[name='t_s_type_name']")[i].id).attr("data-value") == "1"){
						            				if(typedata_d == ""){
						            					typedata_d = $("#"+$("input[name='t_s_type_name']")[i].id).attr("data-code");
						            				}else{
						            					typedata_d += ","+$("#"+$("input[name='t_s_type_name']")[i].id).attr("data-code");
						            				}
						            			}
						            		}
						            		
						            		for(var i = 0 ; i < $("input[name='t_s_type2_name']").length ; i++){
						            			if($("#"+$("input[name='t_s_type2_name']")[i].id).attr("data-value") == "1"){
						            				if(typedata_d == ""){
						            					typedata_d = $("#"+$("input[name='t_s_type2_name']")[i].id).attr("data-code");
						            				}else{
						            					typedata_d += ","+$("#"+$("input[name='t_s_type2_name']")[i].id).attr("data-code");
						            				}
						            			}
						            		}
						            		if(typedata_d == ""){
						            			Kalert("회원가입이 완료되었습니다.","",function(){
		        									location.href = "/";
		        								})
						            		}else{
						            			Kajax("/action/updateTypeSub",{
							            			type : typedata_d
							            			,user_seq : res.seq
							            			,job_type : typedata
							            		},function(res){
							            				Kalert("회원가입이 완료되었습니다.","",function(){
				        									location.href = "/";
				        								})
							            		})
						            		}
						            		
	        								
	        							}
	        						})
	        					}
	        				})
	        			}
	        		}
	        	})
			}
		}
	})
}
function idCheck(){
	Kajax("/actionone/idCheck",{
		user_id : $("#id").val()
	},function(res){
		if(res.success){
			if(res.rows.cnt == 0){
				$("#id").addClass("is-valid");
			}else{
				Kalert("사용하실수 없는 아이디입니다.","",null,{type:"info"});
			}
		}
	})
}
function agress(){
	location.href = "memberStep2"
}
function iCheckInit(id){
	$("."+id).iCheck({
		checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
	});
	 $("."+id).on('ifToggled', function (event) {
	        $("#"+id).attr("data",$(this).val());
	    });
}

var backurl = "";
function loadFileBack(target,id){
	var formData = new FormData();
	formData.append("uploadfile0", target.files[0]);
	
	 $.ajax({
         url: '/fileupload',
         processData: false,
             contentType: false,
         data: formData,
         dataType : "json",
         type: 'POST',
         success: function(result){
        	 backurl = "/imgs/"+result.rows[0]["fileurl"];
        	 //$($(target)).val("/imgs/"+result.rows[0]["fileurl"]);
        	 $(id).attr("src","/imgs/"+result.rows[0]["fileurl"])
        	 $(id).attr("url","/imgs/"+result.rows[0]["fileurl"])
        	 //$("#backimg_url").val("/imgs/"+result.rows[0]["fileurl"]);
         }
     });
}

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
                     $("#empcalendar").modal("hide");
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

function postCode2(){
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
                $("#searchAddress2").val(extraAddr);
                $("#searchAddress2").attr("sigungu" , data.sigungu);
            
            } else {
            	$("#searchAddress2").val("");
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#searchAddress2").val(addr);
            // 커서를 상세주소 필드로 이동한다.
            geocoder.addressSearch(data.address, function(results, status) { // 정상적으로 검색이 완료됐으면
            	if (status === daum.maps.services.Status.OK) {
            		var result = results[0];
            		//첫번째 결과의 값을 활용 
            		// 해당 주소에 대한 좌표를 받아서 
            		var coords = new daum.maps.LatLng(result.y, result.x);
            		//$("#Location").val(result.y + ","+ result.x);
            		$("#searchAddress2").attr("lon",result.y);
            		$("#searchAddress2").attr("lat",result.x);
            		 element_wrap2.style.display = 'none';
            		 $('#empcalendar2').modal('hide')
            		} 
            });
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap2.style.display = 'none';
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
function allCheck(){
	alert();
}
function login(){
}
</script>

</html>
