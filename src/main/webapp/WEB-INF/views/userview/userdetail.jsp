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
  <%@ include file="../include/importcss.jsp" %>
  <link id="pagestyle" href="/assets/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ed6c9066304732496c815fbca5dfc889&libraries=services"></script>
</head>
<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
  <%@ include file="../include/left.jsp" %>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
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
    <div class="container-fluid py-4">
    <div class="row" >
      <div class="row mt-4 py-5" style="padding-bottom:0px !important">
        <div class="col-12">
          <div class="card bg-gradient-secondary">
            <img src="/resources/assets/img/shapes/waves-white.svg" alt="pattern-lines" class="position-absolute opacity-4 start-0 top-0 w-100">
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
                 </div>
                  <hr class="horizontal light mt-1 mb-3">
                  <div class="d-flex">
                    <div class="ms-lg-6 ms-4">
                     	<h6 class="mb-0 text-white opacity-7" style="display:none" id="A01_txt">구인회원</h6>
                     	<h6 class="mb-0 text-white opacity-7" style="display:none" id="A02_txt">구직회원</h6>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3 col-12 my-auto">
                 <div class="d-flex">
                 	<h4 class="text-white col-lg-7 col-9 my-auto" style="margin-left:6px" id="myinfoBtn"></h4>
                 </div>
                  <hr class="horizontal light mt-1 mb-3">
                  <div class="d-flex">
                    <div>
                      <h6 class="mb-0 text-white" id="address"></h6>
                      <h6 class="mb-0 text-white" id="address_detail"></h6>
                    </div>
                  </div>
                   <% if(String.valueOf(request.getAttribute("type")).equals("A02")){ %>
                    <hr class="horizontal light mt-1 mb-3">
	                  <div class="d-flex">
	                    <div>
	                      <h6>내위치</h6>
	                      <h6 class="mb-0 text-white" id="location_txt"></h6>
	                    </div>
	                  </div>
                    <% } %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
      <div class="row" style="margin-top:20px;margin-right:9px">
        <div class="col-lg-6 col-12">
          <div class="row">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card" style="background-image: url('../../../assets/img/curved-images/white-curved.jpeg')">
                <span class="mask bg-gradient-dark opacity-9 border-radius-xl"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                        <i class="ni ni-circle-08 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3" id="all_count">
                        
                      </h5>
                      <span class="text-white text-sm">총배정수</span>
                    </div>
                    <div class="col-4">
                      <div class="dropdown text-end mb-6" style="display:none">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers1" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers1" style="display:none">
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0"></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0">
              <div class="card" style="background-image: url('../../../assets/img/curved-images/white-curved.jpeg')">
                <span class="mask bg-gradient-dark opacity-9 border-radius-xl"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                        <i class="ni ni-active-40 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3" id="today_count">
                      </h5>
                      <span class="text-white text-sm">진행배정수</span>
                    </div>
                    <div class="col-4">
                      <div class="dropdown text-end mb-6" style="display:none">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers2" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers2" >
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0"></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row mt-4">
            <div class="col-lg-6 col-md-6 col-12">
              <div class="card" style="background-image: url('../../../assets/img/curved-images/white-curved.jpeg')">
                <span class="mask bg-gradient-dark opacity-9 border-radius-xl"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                        <i class="ni ni-cart text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3" id="log_count">
                      </h5>
                      <span class="text-white text-sm">지난배정수</span>
                    </div>
                    <div class="col-4" style="display:none">
                      <div class="dropdown text-end mb-6">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers3" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers3">
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0">+15%</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12 mt-4 mt-md-0" style="display:none">
              <div class="card" style="background-image: url('../../../assets/img/curved-images/white-curved.jpeg')">
                <span class="mask bg-gradient-dark opacity-9 border-radius-xl"></span>
                <div class="card-body p-3 position-relative">
                  <div class="row">
                    <div class="col-8 text-start">
                      <div class="icon icon-shape bg-white shadow text-center border-radius-md">
                        <i class="ni ni-like-2 text-dark text-gradient text-lg opacity-10" aria-hidden="true"></i>
                      </div>
                      <h5 class="text-white font-weight-bolder mb-0 mt-3">
                        940
                      </h5>
                      <span class="text-white text-sm">Likes</span>
                    </div>
                    <div class="col-4">
                      <div class="dropdown text-end mb-6">
                        <a href="javascript:;" class="cursor-pointer" id="dropdownUsers4" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="fa fa-ellipsis-h text-white" aria-hidden="true"></i>
                        </a>
                        <ul class="dropdown-menu px-2 py-3" aria-labelledby="dropdownUsers4" style="">
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                          <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                        </ul>
                      </div>
                      <p class="text-white text-sm text-end font-weight-bolder mt-auto mb-0">+90%</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 col-12 mt-4 mt-lg-0">
          <div class="card h-100">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-0">요청등록</h6>
            </div>
            <div class="card-body pb-0 p-3">
              <ul class="list-group">
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-0">
                  <div class="w-100">
                    <div class="d-flex mb-2">
                      <span class="me-2 text-sm font-weight-bold text-capitalize"  ></span>
                    </div>
                    <div>
                        <input type="text" class="form-control" id="projectName"  disabled readonly style="display:block">
                    </div>
                  </div>
                </li>
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
                  <div class="w-100">
                    <div class="d-flex mb-2">
                      <span class="me-2 text-sm font-weight-bold text-capitalize">지원금액(월급 또는 일급)</span>
                    </div>
                    <div>
                        <input class="form-control" type="text" id="pay" style="display:block" disabled readonly onkeyup="numberWithCommastext(this , false)">
                    </div>
                  </div>
                </li>
                <li class="list-group-item border-0 d-flex align-items-center px-0 mb-2">
                  <div class="w-100">
                    <div class="d-flex mb-2">
                      <span class="me-2 text-sm font-weight-bold text-capitalize">타입</span>
                    </div>
                    <div>
                        <select class="form-control" disabled id="worker">
			                	<option value="0" selected="selected">일당</option>
			                	<option value="1">오전</option>
			                	<option value="2">오후</option>
			                	<option value="3">야간</option>
				            </select>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
            <div class="card-footer pt-0 p-3 d-flex align-items-center">
              <div class="w-60">
                <p class="text-sm">
                </p>
              </div>
              <div class="w-40 text-end" id="btn_body">
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row my-4" style="margin-top:20px;margin-right:9px">
        <div class="col-12">
          <div class="card">
            <div class="table-responsive">
              <table class="table align-items-center mb-0">
                <thead>
                  <tr>
                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">이름</th>
                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">평점</th>
                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">리뷰</th>
                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">리뷰날짜</th>
                  </tr>
                </thead>
                <tbody id="log_list">
                	<tr style="text-align:center">
                		<td colspan="4">
                			조회내용이 없습니다.
                		</td>
                	</tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <footer class="footer pt-3  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>2021,
                made with <i class="fa fa-heart" aria-hidden="true"></i> by
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
  <%@ include file="../include/importjs.jsp" %>
  <script type="text/javascript">
									            	function updateContensData(){
									            		Kajax("/action/updateContetns",{
									            			contents : quill.container.innerHTML
									            			,user_seq : <%=String.valueOf(request.getAttribute("seq"))%>
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
    			user_seq : <%=String.valueOf(request.getAttribute("seq"))%>
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
    			user_seq : <%=String.valueOf(request.getAttribute("seq"))%>
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
            		 ,user_seq : <%=String.valueOf(request.getAttribute("seq"))%>
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
    		seq : <%=String.valueOf(request.getAttribute("seq"))%>
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
    			 $("#projectName").val(res.rows.onelinetext)
       		  $("#pay").val(comma(checknull(res.rows.rec_pay,0)));
       		  $("#worker").val(checknull(res.rows.rec_worker,-1));
    			if(checknull(res.rows.logo_img) != ""){
    				$("#main_img").attr("src",res.rows.logo_img);
               	 $("#main_img").attr("url",res.rows.logo_img);	
    			}
    			$("#"+res.rows.type+"_txt").show();
    			if(res.rows.type == "A02"){
    				Kajax("/actionlist/getUserJobloglist",{
        	    		target_user_seq : <%=String.valueOf(request.getAttribute("seq"))%>
        	    	   ,status : 1
        	    	},function(res){
        	    		if(res.success){
        	    			var dump = "";
        	    			if(res.rows.length != 0){
        	    				$("#log_list").empty();
        	    			}
        	    			$.each(res.rows,function(index , item){
        	    				var imgurl = checknull(item.logo_img , "/resources/img/dangil_logo_big.png?ver=20210617");
        	    				dump += ' <tr>';
      	    					dump += ' <td>';
   	    						dump += ' <div class="d-flex px-2 py-1">';
    							dump += ' <div>';
    							dump += '   <img src="'+imgurl+'" class="avatar avatar-sm me-3" alt="avatar image">';
    							dump += '     </div>';
    							dump += '     <div class="d-flex flex-column justify-content-center">';
    							dump += '       <h6 class="mb-0 text-sm">'+item.name+'</h6>';
    							dump += '   <p class="text-sm font-weight-bold text-secondary mb-0"><span class="text-success">'+getAge(item.regident_reg)+'</span> ('+getGender(item.regident_reg)+')</p>'
    							dump += '     </div>';
    							dump += ' </div>';
    							dump += ' </td>';
    							dump += ' <td>';
    							dump += ' <p class="text-sm text-secondary mb-0">'+getStar(logKey(item) , checknull(item.user_score,0) , item , false,"0px")+'</p>';
    							dump += ' </td>';
    							dump += ' <td>';
    							dump += '   <span class="badge badge-dot me-4">';
    							dump += '     <span class="text-dark text-xs">'+checknull(item.user_log_text , "없음")+'</span>';
    							dump += '   </span>';
    							dump += ' </td>';
    							dump += ' <td class="align-middle text-center text-sm">';
    							dump += ' <p class="text-secondary mb-0 text-sm">'+new Date(item.log_create_date).format("yyyy-MM-dd hh:mm")+'</p>';
    							dump += ' </td>';
    							dump += ' </tr>';
        	    			});
        	    			$("#log_list").append(dump);
        	    		}
        	    	})
        	    	Kajax("/actionone/logstatus",{
        	    		target_user_seq : <%=String.valueOf(request.getAttribute("seq"))%>,
        	    		user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
        	    	},function(res){
        	    		if(res.success){
        	    			var button = "";
        	    			 if(ifnull(res.rows.today_job_status , -1) == -1){
		            			 button = '<span class="btn btn-secondary" style="margin-bottom:0px" onclick="addJob(<%=String.valueOf(request.getAttribute("seq"))%>)">신청'	
                             }else{
                            	 if(ifnull(res.rows.today_job_status , -1) == 0){
                            		 button = '<span class="btn btn-primary" style="margin-bottom:0px" onclick="cancelJob(<%=String.valueOf(request.getAttribute("seq"))%>)">승인대기</span>' 
                            	 }else if(ifnull(res.rows.today_job_status , -1) == 1){
                            		 button = '<span class="btn btn-success" style="margin-bottom:0px">승인</span>'
                            	 }else{
                            		 button = '<span class="btn btn-warning" style="margin-bottom:0px">거절</span>'
                            	 }
                             }
        	    			 
        	    			 $("#btn_body").append(button);
        	    		}else{
        	    			 $("#btn_body").append('<span class="btn btn-secondary" style="margin-bottom:0px" onclick="addJob(<%=String.valueOf(request.getAttribute("seq"))%>)">신청</span>');
        	    		}
        	    	})
    			}else{
    				Kajax("/actionlist/getJobloglist",{
        	    		user_seq : <%=String.valueOf(request.getAttribute("seq"))%>
        	    	   ,status : 1
        	    	},function(res){
        	    		if(res.success){
        	    			var dump = "";
        	    			if(res.rows.length != 0){
        	    				$("#log_list").empty();
        	    			}
        	    			$.each(res.rows,function(index , item){
        	    				var imgurl = checknull(item.logo_img , "/resources/img/dangil_logo_big.png?ver=20210617");
        	    				dump += ' <tr>';
      	    					dump += ' <td>';
   	    						dump += ' <div class="d-flex px-2 py-1">';
    							dump += ' <div>';
    							dump += '   <img src="'+imgurl+'" class="avatar avatar-sm me-3" alt="avatar image">';
    							dump += '     </div>';
    							dump += '     <div class="d-flex flex-column justify-content-center">';
    							dump += '       <h6 class="mb-0 text-sm">'+item.name+'</h6>';
    							dump += '   <p class="text-sm font-weight-bold text-secondary mb-0"><span class="text-success">'+getAge(item.regident_reg)+'</span> ('+getGender(item.regident_reg)+')</p>'
    							dump += '     </div>';
    							dump += ' </div>';
    							dump += ' </td>';
    							dump += ' <td>';
    							dump += ' <p class="text-sm text-secondary mb-0">'+getStar(logKey(item) , checknull(item.target_user_score,0) , item , false,"0px")+'</p>';
    							dump += ' </td>';
    							dump += ' <td>';
    							dump += '   <span class="badge badge-dot me-4">';
    							dump += '     <span class="text-dark text-xs">'+checknull(item.target_user_log_text , "없음")+'</span>';
    							dump += '   </span>';
    							dump += ' </td>';
    							dump += ' <td class="align-middle text-center text-sm">';
    							dump += ' <p class="text-secondary mb-0 text-sm">'+new Date(item.log_create_date).format("yyyy-MM-dd hh:mm")+'</p>';
    							dump += ' </td>';
    							dump += ' </tr>';
        	    			});
        	    			$("#log_list").append(dump);
        	    		}
        	    	})
    			}

    	    	
    		}
    	})
    	
    }
    function addJob(seq){
    	Kconfirm("작업을 요청하시겠습니까?","",function(){
    		Kajax("/action/addJob",{
        		target_user_seq : seq
        		,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
        	},function(res){
        		if(res.success){
        			Ktoast({text : "작업요청이 완료되었습니다."});
        			location.reload();
        		}
        	})
    	},null,true);
    }
    function cancelJob(seq){
    	Kconfirm("작업요청을 취소하시겠습니까?","",function(){
    		Kajax("/action/cancelJob",{
    			target_user_seq : seq
    			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    		},function(res){
    			if(res.success){
    				Ktoast({text:"작업요청이 취소되었습니다."});
    				location.reload();
    			}
    		})
    	},null,true);
    }
    </script>
</body>
</html>
