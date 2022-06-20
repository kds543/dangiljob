<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/assets/img/favicon.png">
  <title>
    당일Job
  </title>
  <!-- CSS Files -->
  <%@ include file="include/importcss.jsp" %>
  <link id="pagestyle" href="/assets/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed6c9066304732496c815fbca5dfc889&libraries=services"></script>
</head>
<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
  <%@ include file="include/left.jsp" %>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
  <div class="modal inmodal fade"  id="type_modal" tabindex="-1"  role="dialog"  aria-hidden="true">
									               <div class="modal-dialog modal-lg" style="width:95%;min-width:360px">
									                       <div class="modal-content" style="display:block;">
									                                        <div class="modal-header">
									                                            <button type="button" class="close" onclick="$('#type_modal').modal('hide')"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									                                            <h4 class="modal-title" id="s_title">타입선택</h4>
									                                        </div>
									                                        <div id="n_type" class="modal-body" style="width:100%;margin-left:0px !important">
									                            			</div>
									                            			<div class="modal-footer">
									                                            <button type="button" class="btn btn-white" onclick="$('#type_modal').modal('hide')">닫기</button>
									                                            <button type="button" class="btn btn-primary" onclick="typeSave()">수정</button>
									                                        </div>
									                  </div>
									            </div>
									            <script type="text/javascript">
									            	function typeSave(){
									            		var typedata_d="";
									            		for(var i = 0 ; i < $("button[name='n_type_name']").length ; i++){
									            			if($("#"+$("button[name='n_type_name']")[i].id).attr("data-value") == "1"){
									            				if(typedata_d == ""){
									            					typedata_d = $("#"+$("button[name='n_type_name']")[i].id).attr("data-code");
									            				}else{
									            					typedata_d += ","+$("#"+$("button[name='n_type_name']")[i].id).attr("data-code");
									            				}
									            			}
									            		}
									            		Kajax("/action/updateType",{
									            			type : typedata_d
									            			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
									            		},function(res){
									            			if(res.success){
									            				Kalert("수정이 완료되었습니다.","",function(){
									            					location.reload();
									            				});
									            				
									            			}
									            		})
									            	}
									            	
									            </script>
		  </div>
		  <div class="modal inmodal fade"  id="name_modal" tabindex="-1"  role="dialog"  aria-hidden="true">
									               <div class="modal-dialog modal-lg" style="width:95%;min-width:360px">
									                       <div class="modal-content" style="display:block;">
									                                        <div class="modal-header">
									                                            <button type="button" class="close" onclick="$('#name_modal').modal('hide')"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									                                            <h4 class="modal-title">이름수정</h4>
									                                        </div>
									                                        <div class="modal-body" style="width:100%;margin-left:0px !important">
									                                        	<form method="get" onsubmit="return false" action="return false">
												                                    <div class="form-group  row"><label class="col-sm-3 col-form-label">이름</label>
													                                    <div class="col-sm-9">
													                                    	<input type="text" id="modal_name" class="form-control" >
													                                    </div>
													                                </div>
													                              </form>
									                            			</div>
									                            			<div class="modal-footer">
									                                            <button type="button" class="btn btn-white" onclick="$('#name_modal').modal('hide')">닫기</button>
									                                            <button type="button" class="btn btn-primary" onclick="nameSave()">수정</button>
									                                        </div>
									                  </div>
									            </div>
									            <script type="text/javascript">
									            	function nameSave(){
									            		Kajax("/actionupdate/updateName",{
									            			name : $("#modal_name").val()
									            			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
									            		},function(res){
									            			if(res.success){
									            				Kalert("수정이 완료되었습니다.","",function(){
									            					location.reload();
									            				});
									            				
									            			}
									            		})
									            	}
									            	
									            </script>
		  </div>
		  <div class="modal inmodal fade"  id="addressPop" tabindex="-1"  role="dialog"  aria-hidden="true">
				  <div class="modal-dialog modal-lg" style="width:80%;min-width:360px">
				              <div class="modal-content" style="display:block;">
				                         <div class="modal-header">
	                                          <button type="button" class="close" onclick="$('#addressPop').modal('hide')"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		                                            <h4 class="modal-title" id="s_title">위치조회</h4>
			                                        </div>
			                                        <div class="modal-body" style="width:100%">
			                                         <div class="ibox-title">
							                            <h5>거주지 주소 수정</h5>
							                        </div>
					                                  <div class="ibox-content">
					                                    <form method="get" onsubmit="return false" action="return false">
						                                    <div class="form-group  row"><label class="col-sm-3 col-form-label">집주소입력</label>
							                                    <div class="col-sm-9">
							                                    	<input type="text" class="form-control" id="searchAddress" readonly="readonly" onclick="postCode()">
							                                    <div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
							            							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
							        							</div>
							                                    	</div>
							                                </div>
							                                  <div class="form-group  row"><label class="col-sm-3 col-form-label"></label>
							                                    <div class="col-sm-9"><input type="text" class="form-control" id="searchAddressDetail"></div>
							                                </div>
							                              </form>
													</div>
			                            </div>
			                            	<div class="modal-footer">
									                                            <button type="button" class="btn btn-white" onclick="$('#addressPop').modal('hide')">닫기</button>
									                                              <% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
																					<button type="button" class="btn btn-primary" onclick="updateAddressLon()">수정</button>
																				<% }else{  %>
																					<button type="button" class="btn btn-primary" onclick="updateAddress()">수정</button>
																				<% } %>
									                                            
									                                        </div>
				                  </div>
			            </div>
			            <script type="text/javascript">
			           	function updateAddress(){
			           		Kajax("/action/updateAddress",{
			           			address : $("#searchAddress").val()
			           			,address_detail : $("#addressDetail").val()
			           			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			           			,lon : ""
			           			,lat : ""
			           		},function(res){
			           			if(res.success){
			           				Kalert("수정이 완료되었습니다.","",function(){
		            					location.reload();
		            				});
			           			}
			           		})
			           	}
			           	function updateAddressLon(){
			           		Kajax("/action/updateAddress",{
			           			address : $("#searchAddress").val()
			           			,address_detail : $("#addressDetail").val()
			           			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			           			,lon : $("#searchAddress").attr("lon")
								,lat : $("#searchAddress").attr("lat")
			           		},function(res){
			           			if(res.success){
			           				Kalert("수정이 완료되었습니다.","",function(){
		            					location.reload();
		            				});
			           			}
			           		})
			           	}
			            var geocoder = new daum.maps.services.Geocoder();
			            var element_wrap = document.getElementById('wrap');
			            function foldDaumPostcode() {
			                // iframe을 넣은 element를 안보이게 한다.
			                element_wrap.style.display = 'none';
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
			                        
			                        } else {
			                        	$("#searchAddress").val("");
			                        }

			                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                        $("#searchAddress").val(addr);
			                        // 커서를 상세주소 필드로 이동한다.
			                        $("#addressDetail").focus();
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
			                        // iframe을 넣은 element를 안보이게 한다.
			                        element_wrap.style.display = 'none';
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
			            </script>
		  </div>
		  <div class="modal inmodal fade"  id="contentspop" tabindex="-1"  role="dialog"  aria-hidden="true">
									               <div class="modal-dialog modal-lg" style="width:80%;min-width:360px">
									                       <div class="modal-content" style="display:block;">
									                                        <div class="modal-header">
									                                            <button type="button" class="close" onclick="$('#contentspop').modal('hide')"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									                                            <h4 class="modal-title" id="s_title">자기소개수정</h4>
									                                           
									                                        </div>
									                                        
									                                        <div class="modal-body" style="width:100%">
									                                    <div id="contentsText" contenteditable="true" style="padding:5px;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
																		</div>
									                            </div>
									                            <div class="modal-footer">
									                                            <button type="button" class="btn btn-white" onclick="$('#contentspop').modal('hide')">닫기</button>
																				<button type="button" class="btn btn-primary" onclick="updateContents()">수정</button>
									                            </div>
									                  </div>
									            </div>
									            <script type="text/javascript">
									            	function updateContents(){
									            		Kajax("/action/updateContetns",{
									            			contents : $("#contentsText").html()
									            			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
									            		},function(res){
									            			if(res.success){
									            				Kalert("수정이 완료되었습니다.","",function(){
									            					location.reload();
									            				});
									            			}
									            		})
									            	}
									            </script>
		                                </div>
		      <div class="modal inmodal fade"  id="locationPop" tabindex="-1"  role="dialog"  aria-hidden="true">
				  <div class="modal-dialog modal-lg" style="width:80%;min-width:360px">
				              <div class="modal-content" style="display:block;">
				                         <div class="modal-header">
	                                          <button type="button" class="close" onclick="$('#locationPop').modal('hide')"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		                                            <h4 class="modal-title" id="s_title">위치조회</h4>
			                                        </div>
			                                        <div class="modal-body" style="width:100%">
			                                         <div class="ibox-title">
							                            <h5>내위치 정보 수정</h5>
							                        </div>
					                                  <div class="ibox-content">
					                                    <form method="get" onsubmit="return false" action="return false">
						                                    <div class="form-group  row"><label class="col-sm-3 col-form-label">내위치입력</label>
							                                    <div class="col-sm-9">
							                                    	<input type="text" class="form-control" id="location" readonly="readonly" onclick="postCode2()">
							                                    <div id="wrap2" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
							            							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode2()" alt="접기 버튼">
							        							</div>
							                                    	</div>
							                                </div>
							                              </form>
													</div>
			                            </div>
			                            	<div class="modal-footer">
				                                            <button type="button" class="btn btn-white" onclick="$('#locationPop').modal('hide')">닫기</button>
															<button type="button" class="btn btn-primary" onclick="updateLocation()">수정</button>
	                                        </div>
				                  </div>
			            </div>
			            <script type="text/javascript">
			           	function updateLocation(){
			           		Kajax("/action/updateLocation",{
			           			location : $("#location").val()
			           			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			           			,lon : $("#location").attr("lon")
								,lat : $("#location").attr("lat")
			           		},function(res){
			           			if(res.success){
			           				Kalert("수정이 완료되었습니다.","",function(){
		            					location.reload();
		            				});
			           			}
			           		})
			           	}
			            var element_wrap2 = document.getElementById('wrap2');
			            function foldDaumPostcode2() {
			                // iframe을 넣은 element를 안보이게 한다.
			                element_wrap2.style.display = 'none';
			            }
			            function postCode2() {
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
			                        
			                        } else {
			                        	$("#location").val("");
			                        }

			                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                        $("#location").val(addr);
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
			  </script>
		  </div>
  <input type="file" name="uploadfile" style="display:none" accept="image/png, image/jpeg" id="img2_b" onchange="loadFileBack(this,'#main_img')">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg position-sticky mt-1 top-1 px-0 mx-1 shadow-none border-radius-xl z-index-sticky" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <div class="sidenav-toggler sidenav-toggler-inner d-xl-block d-none ">
          <a href="javascript:;" class="nav-link text-body p-0">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
            </div>
          </a>
        </div>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center" id="topfilterBtn">
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid">
      <div class="row" >
      <div class="row mt-4 py-5" style="padding-bottom:0px !important">
        <div class="col-12">
          <div class="card bg-gradient-secondary">
            <img src="../../assets/img/shapes/waves-white.svg" alt="pattern-lines" class="position-absolute opacity-4 start-0 top-0 w-100">
            <div class="card-body z-index-1 bg-cover">
              <div class="row">
                <div class="col-lg-6 col-12 text-center">
                  <img class="w-75 w-lg-auto mt-lg-n8 d-none d-md-block" id="main_img" onclick="$('#img2_b').trigger('click')" src="/resources/img/dangil_logo_big.png?ver=1" style="margin-left:10%;display: block !important;border-radius: 50%!important;background-color:white">
                  <div class="d-flex align-items-center">
                    <h4 class="text-white opacity-7 ms-0 ms-md-auto" id="myStar"></h4>
                  </div>
                </div>
                 <div class="col-lg-3 col-12 my-auto">
                 <div class="d-flex">
                 	<h4 class="text-white opacity-9" id="my_name"></h4>
                 	 <button class="btn btn-outline-white mb-0" style="margin-left:10px" onclick="$('#name_modal').modal('show')">
                        			수정
                      </button>
                 </div>
                  <hr class="horizontal light mt-1 mb-3">
                  <div class="d-flex">
                    <div class="ms-lg-6 ms-4">
                     <% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
                     	<h6 class="mb-0 text-white opacity-7">구인회원</h6>
                     <% }else{ %>
                     	<h6 class="mb-0 text-white opacity-7">구직회원</h6>
                     <% } %>
                      
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-12 my-auto">
                 <div class="d-flex">
                 	<h4 class="text-white col-lg-7 col-9 my-auto" style="margin-left:6px" id="myinfoBtn"></h4>
                  <div class="ms-lg-6 ms-4">
                      <button class="btn btn-icon-only btn-rounded btn-outline-white mb-0" onclick="$('#type_modal').modal('show')">
                        <i class="ni ni-building" aria-hidden="true"></i>
                      </button>
                    </div>
                 </div>
                  <hr class="horizontal light mt-1 mb-3">
                  <div class="d-flex">
                    <div>
                      <h6 class="mb-0 text-white" id="address"></h6>
                      <h6 class="mb-0 text-white" id="address_detail"></h6>
                    </div>
                    <div class="ms-lg-6 ms-4">
                      <button class="btn btn-icon-only btn-rounded btn-outline-white mb-0" onclick="$('#addressPop').modal('show')">
                        <i class="ni ni-map-big" aria-hidden="true"></i>
                      </button>
                    </div>
                  </div>
                   <% if(String.valueOf(request.getAttribute("type")).equals("A02")){ %>
                    <hr class="horizontal light mt-1 mb-3">
	                  <div class="d-flex">
	                    <div>
	                      <h6>내위치</h6>
	                      <h6 class="mb-0 text-white" id="location_txt"></h6>
	                    </div>
	                    <div class="ms-lg-6 ms-4">
	                      <button class="btn btn-icon-only btn-rounded btn-outline-white mb-0" onclick="$('#locationPop').modal('show')">
	                        <i class="ni ni-map-big" aria-hidden="true"></i>
	                      </button>
	                    </div>
	                  </div>
                    <% } %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-4">
        <div class="col-lg-4 col-md-6 col-12">
          <div class="card bg-gradient-secondary">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-white text-sm mb-0 text-capitalize font-weight-bold opacity-7">총배정수</p>
                    <h5 class="text-white font-weight-bolder mb-0" id="all_count">
                      0건
                    </h5>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                    <i class="ni ni-money-coins text-dark text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 col-12 mt-4 mt-md-0">
          <div class="card bg-gradient-secondary">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-white text-sm mb-0 text-capitalize font-weight-bold opacity-7">진행배정수</p>
                    <h5 class="text-white font-weight-bolder mb-0" id="today_count">
                      0건
                    </h5>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                    <i class="ni ni-controller text-dark text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 col-12 mt-4 mt-lg-0">
          <div class="card bg-gradient-secondary">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-white text-sm mb-0 text-capitalize font-weight-bold opacity-7">지난배정수</p>
                    <h5 class="text-white font-weight-bolder mb-0" id="log_count">
                      0건
                    </h5>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                    <i class="ni ni-delivery-fast text-dark text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-12" style="margin-top:10px !important;display:none">
		      <div class="col-lg-4 col-md-6 col-12 mt-4 mt-lg-0" style="margin-top:10px !important;width:100%">
		          <div class="card bg-gradient-secondary">
		            <div class="card-body" style="padding:0px !important">
			              <div id="edit-deschiption-edit" class="h-50" style="color:white !important">
		                    	소개메시지를 작성하여 주세요.
		                  </div>
		                  <button type="button" class="btn btn-primary" style="margin:5px;float:right" onclick="updateContensData()">자기소개수정</button>
		            </div>
		          </div>
		        </div>
      </div>
      </div>
      <footer class="footer pt-3" style="display:none">
        <div class="container-fluid" style="height:auto">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
                made with <i class="fa fa-heart"></i> by
                <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">Creative Tim</a>
                for a better web.
              </div>
            </div>
            <div class="col-lg-6">
              <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                <li class="nav-item">
                  <a href="https://www.creative-tim.com" class="nav-link text-muted" target="_blank">Creative Tim</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/presentation" class="nav-link text-muted" target="_blank">About Us</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/blog" class="nav-link text-muted" target="_blank">Blog</a>
                </li>
                <li class="nav-item">
                  <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted" target="_blank">License</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </main>
  <div class="fixed-plugin">
    
    <div class="card shadow-lg blur">
    <div class="card-header pb-0 pt-3  bg-transparent ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">작업조건 검색설정</h5>
          <p>작업시간과 금액설정을 설정해주세요</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close" aria-hidden="true"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
    	<div class="card-body pt-sm-3 pt-0">
                            <h6 class="mb-0">
                                <input type="checkbox" /><l style="margin-left:5px">평상시 작업시간/금액설정</l>
                            </h6>
                            <input id="ionrange_1" />
 							<h6 class="mb-0">
                                	<input type="checkbox" /><l style="margin-left:5px">야간 작업시간/금액설정</l>
                            </h6>
                            <input id="ionrange_2"/>
                            <h6 class="mb-0">
                                	<input type="checkbox" /><l style="margin-left:5px">오전 작업시간/금액설정</l>
                            </h6>
                            <input id="ionrange_3"/>
                            <h6 class="mb-0">
                                	<input type="checkbox" /><l style="margin-left:5px">오후 작업시간/금액설정</l>
                            </h6>
                            <input id="ionrange_4"/>
            </div>
             <hr class="horizontal dark my-1">
             <div class="card-body pt-sm-3 pt-0">
             	<button class="btn bg-gradient-dark w-100" style="width:100%">검색설정적용</button>
             </div>
    </div>
  </div>
  <%@ include file="include/importjs.jsp" %>
  <script type="text/javascript">
									            	function updateContensData(){
									            		Kajax("/action/updateContetns",{
									            			contents : quill.container.innerHTML
									            			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
									            		    ,onelinetext : $("#onelinetext").val()
									            		},function(res){
									            			if(res.success){
									            				Kalert("수정이 완료되었습니다.","",function(){
									            					location.reload();
									            				});
									            			}
									            		})
									            	}
									            </script>
 <script>
    load();
    var quill = new Quill('#edit-deschiption-edit', {
        theme: 'snow' // Specify theme in configuration
      });
    function outMember(){
    	Kconfirm("","탈퇴하시겠습니까? 한번 탈퇴하시면 복구가 안됩니다.",function(){
    		Kajax("/action/memberOut",{
    			user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    		},function(res){
    			if(res.success){
    				Kalert("탈퇴가 완료되었습니다.","",function(){
    					location.reload();
    				})
    			}
    		})
    	})
    }
    $(document).ready(function() {
    	getCodeOutLineButton("T","n_type");
    	 Kajax("/action/getTypelist",{
    			user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    		},function(res){
    			if(res.success){
    				$.each(res.rows , function(index , item){
    					$("#myinfoBtn").append('<button type="button" style="height:60%;margin-top:10px;margin-left:5px;word-wrap: break-word;white-space:normal !important;font-size:12px;" class="btn btn-outline btn-warning" name="t_type_name" data-value="1" data-code="'+item.code+'" id="t_type_button_'+index+'">'+item.code_name+'</button>')
    					$("#n_type_button_"+item.code).trigger("click");
    				})
    			}
    		})
    });
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
            	 Kajax("/action/updatelogoImg",{
            		 logo_img : "/imgs/"+result.rows[0]["fileurl"]
            		 ,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
            	 },function(res){
            		 if(res.success){
            			 Kalert("로고가 수정되었습니다.","",function(){
            			 })
            		 }
            	 })
             }
         });
    }
    function load(){
    	Kajax("/action/getMyinfo",{
    		seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    	},function(res){
    		if(res.success){
    			$("#myStar").append(getStar("my_score" , res.rows.my_score , res.rows , false ,"0px"));
    			$("#my_name").text(res.rows.name);
    			$("#modal_name").val(res.rows.name);
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
    			if(checknull(res.rows.logo_img) != ""){
    				$("#main_img").attr("src",res.rows.logo_img);
               	 $("#main_img").attr("url",res.rows.logo_img);	
    			}
    			 
            	 
    		}
    	})
    }
   
    </script>
</body>
</html>
