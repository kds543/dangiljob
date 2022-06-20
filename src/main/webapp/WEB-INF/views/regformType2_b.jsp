<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>회원가입 이용약관</title>
 
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
 
    <link href="/resources/font-awesome/css/font-awesome.css" rel="stylesheet">
      <!-- Toastr style -->
 <link href="/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="/resources/css/animate.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">
    <link href="/resources/css/plugins/steps/jquery.steps.css" rel="stylesheet">
   <link href="/resources/css/plugins/iCheck/custom.css" rel="stylesheet">
 <script src="/resources/js/kcommon.js?ver=1"></script>
 <link href="/resources/css/plugins/sweetalert/sweetalert.css?ver=1" rel="stylesheet">
                     <!-- Sweet alert -->
    <script src="/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
 
  <!-- Toastr -->
   <script src="/resources/js/jquery-3.1.1.min.js"></script>
   <script src="/resources/js/bootstrap.min.js"></script>
       <script src="/resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="/resources/js/plugins/toastr/toastr.min.js"></script>
      <script src="/resources/js/plugins/iCheck/icheck.min.js"></script>
      <script src="/resources/js/plugins/steps/jquery.steps.min.js"></script>
         <!-- Jquery Validate -->
        <script src="/resources/js/plugins/validate/jquery.validate.min.js"></script>
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
<div class="modal inmodal fade"  id="empcalendar2" tabindex="-1"  role="dialog"  aria-hidden="true">
									               <div class="modal-dialog modal-lg" style="width:80%;min-width:360px">
									                       <div class="modal-content" style="display:block;">
									                                        <div class="modal-body" style="width:100%">
									                                       <div id="wrap2" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
										            							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
										        							</div>
																			
									                                       
									                            </div>
									                  </div>
									            </div>
		                                </div>
<div class="modal inmodal fade"  id="empcalendar" tabindex="-1"  role="dialog"  aria-hidden="true">
									               <div class="modal-dialog modal-lg" style="width:80%;min-width:360px">
									                       <div class="modal-content" style="display:block;">
									                                        <div class="modal-body" style="width:100%">
									                                       <div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
										            							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
										        							</div>
																			
									                                       
									                            </div>
									                  </div>
									            </div>
		                                </div>
    <div class="loginColumns animated fadeInDown ibox-content" style="padding-top:20px">
    	<div class="row" id="l_top">
			<div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>당일Job 회원가입</h5>
                    </div>
                    <div class="ibox-content">
                         <h5>구직회원가입 <small>회원가입을 진심으로 환영합니다.</small></h5>
                        <div id="wizard">
                            <h1>기본정보</h1>
                            <div class="step-content">
                                <form method="get" onsubmit="return false" action="return false">
                                <div class="form-group  row"><label class="col-sm-3 col-form-label">이름</label>

                                    <div class="col-sm-9"><input type="text" id="name" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group  row"><label class="col-sm-3 col-form-label">현재 거주지 주소 입력</label>
                                    <div class="col-sm-9">
                                    	<input type="text" class="form-control" id="searchAddress" readonly="readonly" onclick="$('#empcalendar').modal('show');postCode();">
                                    	</div>
                                </div>
                                
                               
                                <div class="form-group  row"><label class="col-sm-3 col-form-label"></label>
                                    <div class="col-sm-9"><input type="text" class="form-control" id="addressDetail"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group  row"><label class="col-sm-3 col-form-label">내 위치 주소 입력</label>
                                    <div class="col-sm-9"><input type="text" id="searchAddress2" class="form-control" readonly="readonly" onclick="$('#empcalendar2').modal('show');postCode2();">
                                    </div>
                                </div>
                                
                                <div class="hr-line-dashed"></div>
                                <div class="form-group  row"><label class="col-sm-3 col-form-label">주민번호 입력</label>
                                    <div class="col-sm-4"><input type="text" id="regident_reg"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" maxlength="6"></div> -
                                    <div class="col-sm-4"><input type="text" id="regident_reg2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" class="form-control" maxlength="7"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group  row"><label class="col-sm-3 col-form-label">아이디 입력</label>

                                    <div class="col-sm-9"><input type="text" id="id" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                               <div class="form-group  row"><label class="col-sm-3 col-form-label">비밀번호 입력</label>

                                    <div class="col-sm-9"><input type="password" id="password" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                               <div class="form-group  row"><label class="col-sm-3 col-form-label">비밀번호 확인</label>

                                    <div class="col-sm-9"><input type="password" id="password_c" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                               <div class="form-group  row"><label class="col-sm-3 col-form-label">전화번호 입력</label>
                                    <div class="col-sm-9"><input type="text" id="phone_number" onkeyup="setPhoneNumber('phone_number')" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                               <div class="form-group  row"><label class="col-sm-3 col-form-label">이메일</label>
                                    <div class="col-sm-9"><input type="text" id="email" class="form-control"></div>
                                </div>
                                <div class="hr-line-dashed"></div>
                               <div class="form-group  row"><label class="col-sm-3 col-form-label" data="1" id="gender">성별구분</label>
                                    <div class="col-sm-9"><input name="gender" class="gender" value="1" checked type="radio">남성<input name="gender" value="0" class="gender" type="radio">여성</div>
                                </div>
                                <div class="hr-line-dashed"></div>
                               <div class="form-group  row"><label class="col-sm-3 col-form-label" data="1" id="cType">국적구분</label>
                                    <div class="col-sm-9"><input name="cType" class="cType" value="1" type="radio" checked>내국인<input name="cType" value="0" class="cType" type="radio">외국인</div>
                                </div>
                            </form>
                            </div>

                            <h1>희망분야</h1>
                            <div class="step-content">
                                <div class="text-center m-t-md">
                                    <form class="form-horizontal" onsubmit="return false">
		                               <div class="form-group  row"><label class="col-sm-3 col-form-label">희망분야</label>
		                                    <div class="col-sm-9">
		                                    	 <div class="col-sm-9" id="t_type">
		                                    	 </div>
		                                    </div>
		                                </div>
		                                <div class="hr-line-dashed"></div>
	                               <div class="form-group  row"><label class="col-sm-3 col-form-label">건설기초안전교육수료증</label>
	                                    <div class="col-sm-9">
	                                    	<img alt="" src="/resources/img/default_img.png" id="img1" style="width:200px;height:200px" onclick="$('#img1_b').trigger('click')" />
			                                <input type="file" name="uploadfile" style="display:none" accept="image/png, image/jpeg" id="img1_b" onchange="loadFileBack(this,'#img1')">
	                                    </div>
	                                </div>
                                <div class="hr-line-dashed"></div>
	                               <div class="form-group  row"><label class="col-sm-3 col-form-label">신분증 사본 뒷자리 6자리 가리고</label>
	                                    <div class="col-sm-9">
	                                    	<img alt="" src="/resources/img/default_img.png" id="img2" style="width:200px;height:200px" onclick="$('#img2_b').trigger('click')" />
			                                <input type="file" name="uploadfile" style="display:none" accept="image/png, image/jpeg" id="img2_b" onchange="loadFileBack(this,'#img2')">
	                                    </div>
	                                </div>
		                            </form>
                                </div>
                            </div>
                            <h1>상세분야</h1>
                            <div class="step-content">
                                <div class="text-center m-t-md">
                                    <form class="form-horizontal" onsubmit="return false">
		                               <div class="form-group  row"><label class="col-sm-3 col-form-label" id="t_s_type_title">상세분야(복수 가입가능)</label>
		                                    <div class="col-sm-9">
		                                    	 <div class="col-sm-9" id="t_s_type">
		                                    	 </div>
		                                    </div>
		                                </div>
		                                <div class="hr-line-dashed tstype"></div>
		                                <div class="form-group  row tstype"><label class="col-sm-3 col-form-label" id="t_s_type_title2">상세분야(복수 가입가능)</label>
		                                    <div class="col-sm-9">
		                                    	 <div class="col-sm-9" id="t_s_type2">
		                                    	 </div>
		                                    </div>
		                                </div>
		                            </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                </div>
    </div>

</body>
<script type="text/javascript">

var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
getCodeOutLineRadioButton("T","t_type");
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
var async_step = false;
var typedata="";
$(document).ready(function () {
	$("#wizard").steps({
		 labels: 
         {
            next: "다음",
            finish: "회원가입",
            previous : "이전"
         },
		onStepChanging: function (event, currentIndex, newIndex)
        {
			if(currentIndex == 0){
				if(currentIndex > newIndex){
					async_step = false;
					return true;
				}
				if(isMobile){
            		$(".wizard > .content").css("height","1381px");
            	}else{
            		$(".wizard > .content").css("height","933px");
            	}
				if($("#name").val() == ""){
					Ktoast({
						text : "이름은 필수 입력사항입니다."
						,type : 3
					})
					$("#name").focus();
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
				
				
				if($("#id").val() == ""){
					Ktoast({
						text : "아이디는 필수 입력사항입니다."
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
				
				if($("#phone_number").val() == ""){
					Ktoast({
						text : "전화번호는 필수 입력 사항입니다."
						,type : 3
					})
					$("#phone_number").focus();
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
				
				if($("#password").val() != $("#password_c").val()){
					Ktoast({
						text : "입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다."
						,type : 3
					})
					return;
				}
				if(isMobile){
            		$(".wizard > .content").css("height","800px");
            	}else{
            		$(".wizard > .content").css("height","600px");
            	}
				return true;
			}else  if(currentIndex == 1){
				if(isMobile){
            		$(".wizard > .content").css("height","800px");
            	}else{
            		$(".wizard > .content").css("height","600px");
            	}
				if(currentIndex > newIndex){
					async_step = false;
					if(isMobile){
	            		$(".wizard > .content").css("height","800px");
	            	}else{
	            		$(".wizard > .content").css("height","600px");
	            	}
					return true;
				}
				typedata = "";
				var typename = "";
				for(var i = 0 ; i < $("button[name='t_type_name']").length ; i++){
					if($("#"+$("button[name='t_type_name']")[i].id).attr("data-value") == "1"){
							typedata = $("#"+$("button[name='t_type_name']")[i].id).attr("data-code");
							typename = $("#"+$("button[name='t_type_name']")[i].id).text();
					}
				}
				
				if(typedata == ""){
					Kalert("구분을 선택하여 주십시요");
					return;
				}
				/*
				if(checknull($("#img1").attr("url")) == ""){
					Kalert("사업자 등록증을 입력하여 주십시요");
					return;
				}
				
				if(checknull($("#img2").attr("url")) == ""){
					Kalert("명함을 입력하여 주십시요");
					return;
				}
				*/
				if(typedata == "T01"){
					$(".tstype").css("display","flex");
					getCodeOutLineButton("T010","t_s_type");
					getCodeOutLineButton("T012","t_s_type2");
					$("#t_s_type_title").text("물류 (복수 선택 가능)");
					$("#t_s_type_title").text("물류 택배 전문직 (복수 선택 가능)");
					if(isMobile){
	            		$(".wizard > .content").css("height","600px");
	            	}else{
	            		$(".wizard > .content").css("height","500px");
	            	}
				}else{
					$(".tstype").css("display","none");
					getCodeOutLineButton(typedata,"t_s_type");
					$("#t_s_type_title").text(typename + "(복수 선택 가능)");
					if(isMobile){
	            		$(".wizard > .content").css("height","500px");
	            	}else{
	            		$(".wizard > .content").css("height","400px");
	            	}
				}
				
				
				return true;
			}else{
				if(currentIndex > newIndex){
					async_step = false;
					return true;
				}
			}
        },onInit:function(event,currentIndex){
        	setTimeout(() => {
        		if(isMobile){
            		$(".wizard > .content").css("height","1381px");
            	}else{
            		$(".wizard > .content").css("height","933px");
            	}
			}, 1000);
        	
        },onFinished: function (event, currentIndex)
		{
        	var typedata="";
        	for(var i = 0 ; i < $("button[name='t_type_name']").length ; i++){
        		if($("#"+$("button[name='t_type_name']")[i].id).attr("data-value") == "1"){
        			if(typedata == ""){
        				typedata = $("#"+$("button[name='t_type_name']")[i].id).attr("data-code");
        			}else{
        				typedata += ","+$("#"+$("button[name='t_type_name']")[i].id).attr("data-code");
        			}
        		}
        	}
        	
        	if(typedata == ""){
        		Kalert("구분을 하나이상 선택하여 주십시요");
        		return;
        	}
        	
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
        	        					,location_addr : $("#searchAddress2").val()
        	        					,lon : $("#searchAddress2").attr("lon")
        	        					,lat : $("#searchAddress2").attr("lat")
        	        					,sigungu : $("#searchAddress2").attr("sigungu")
        	        					,type : "A02"
        	        					,img1 : checknull($("#img1").attr("url"))
        	        					,img2 : checknull($("#img2").attr("url"))
        	        					,gender : $("#gender").attr("data")
        	        					,country : $("#cType").attr("data")
        	        					,jobtype : typedata
        	        				},function(res){
        	        					if(res.success){
        	        						Kajax("/action/addTypes",{
        	        							user_seq : res.seq
        	        							,code : typedata
        	        						},function(res2){
        	        							if(res2.success){
        	        								var typedata_d="";
        						            		for(var i = 0 ; i < $("button[name='t_s_type_name']").length ; i++){
        						            			if($("#"+$("button[name='t_s_type_name']")[i].id).attr("data-value") == "1"){
        						            				if(typedata_d == ""){
        						            					typedata_d = $("#"+$("button[name='t_s_type_name']")[i].id).attr("data-code");
        						            				}else{
        						            					typedata_d += ","+$("#"+$("button[name='t_s_type_name']")[i].id).attr("data-code");
        						            				}
        						            			}
        						            		}
        						            		
        						            		for(var i = 0 ; i < $("button[name='t_s_type2_name']").length ; i++){
        						            			if($("#"+$("button[name='t_s_type2_name']")[i].id).attr("data-value") == "1"){
        						            				if(typedata_d == ""){
        						            					typedata_d = $("#"+$("button[name='t_s_type2_name']")[i].id).attr("data-code");
        						            				}else{
        						            					typedata_d += ","+$("#"+$("button[name='t_s_type2_name']")[i].id).attr("data-code");
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
        	
        	
        	//location.href = "/login";	
		},saveState : true
	});
	
    iCheckInit("gender");
    iCheckInit("cType");
    
});

function idCheck(){
	Kajax("/action/idCheck",{
		id : $("#userId").val()
	},function(res){
		if(res.success){
			if(res.rows.cnt == 0){
				$("#idCheckBtn").removeClass("btn-default");
				$("#idCheckBtn").addClass("btn-primary");
				Kalert("사용하실수 있는 아이디입니다.","");
			}else{
				$("#idCheckBtn").addClass("btn-default");
				$("#idCheckBtn").removeClass("btn-primary");
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
            element_wrap.style.display = 'none';
            $("#empcalendar").modal("hide");
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
