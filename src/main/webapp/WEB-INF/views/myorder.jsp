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
    <style>
    	.flatpickr-day.today {
	    	background-color: transparent !important;
		    color: black;
		    border: 1px solid gray;
    	}
    </style>
</head>
<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
  <%@ include file="include/left.jsp" %>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
  <input type="file" name="uploadfile" style="display:none" accept="image/png, image/jpeg" id="img2_b" onchange="loadFileBack(this,'#main_img')">
    <!-- Navbar -->
    <div class="container-fluid">
      <div class="row" >
      	<div class="row">
        <div class="col-lg-9 col-12 mx-auto">
          <div class="card card-body mt-4">
            <h6 class="mb-0">구인정보</h6>
            <p class="text-sm mb-0">구인모집정보를 입력해주세요</p>
            <hr class="horizontal dark my-3">
            <label for="projectName" class="form-label">구인모집타이틀</label>
            <input type="text" class="form-control" id="projectName">
            <div class="row mt-4">
              <div class="col-12 col-md-6">
                <div class="form-group">
                  <label>
                    	구인모집중여부
                  </label>
                  <p class="form-text text-muted text-xs ms-1">
                    	구인모집중일경우 메인화면에 노출됩니다.
                  </p>
                  <div class="form-check form-switch ms-1">
                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onclick="notify(this)" data-type="warning" data-content="모집중으로 선택될경우 메인화면에 노출됩니다." data-title="Warning" data-icon="ni ni-bell-55">
                    <label class="form-check-label" for="flexSwitchCheckDefault"></label>
                  </div>
                </div>
              </div>
            </div>
            <!-- 
            <label class="mt-4 form-label">Project Tags</label>
            <select class="form-control" name="choices-multiple-remove-button" id="choices-multiple-remove-button" multiple>
              <option value="Choice 1" selected>Choice 1</option>
              <option value="Choice 2">Choice 2</option>
              <option value="Choice 3">Choice 3</option>
              <option value="Choice 4">Choice 4</option>
            </select>
             -->
              <div class="row">
              <div class="col-6">
                <label class="form-label">모집금액</label>
                <input class="form-control" type="text" id="pay" onkeypress="numberWithCommastext(this , false)">
              </div>
              <div class="col-6">
                <label class="form-label">업무타입</label>
                		<select class="form-control" id="worker">
			                	<option value="0" selected="selected">일당</option>
			                	<option value="1">오전</option>
			                	<option value="2">오후</option>
			                	<option value="3">야간</option>
			            </select>
              </div>
            </div>
              <div class="row">
		              <div class="col-6">
		                <label class="form-label">모집나이</label>
		                <select class="form-control" id="m_age">
		                </select>
		              </div>
		              <div class="col-6">
		                <label class="form-label">내국인여부</label>
			                <select class="form-control" id="contry">
			                	<option value="-1">국적무관</option>
			                	<option value="1">내국인만</option>
			                	<option value="0">외국인만</option>
			                </select>
		              </div>
              </div>
            <div class="d-flex justify-content-end mt-4">
              <button type="button" name="button" class="btn bg-gradient-primary m-0 ms-2" onclick="saveData()">저장</button>
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
  <script src="/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="/assets/js/plugins/choices.min.js"></script>
  <script src="/assets/js/plugins/quill.min.js"></script>
  <script src="/assets/js/plugins/flatpickr.min.js"></script>
  <script src="/assets/js/plugins/dropzone.min.js"></script>
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
	 <script src="/assets/js/plugins/dragula/dragula.min.js"></script>
	 <script src="/assets/js/plugins/jkanban/jkanban.js"></script>
	 <script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js""></script>
	 <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
	 
 <script>
 	flatpickr.localize(flatpickr.l10ns.ko);
    load();
    $("#m_age").append("<option value='0'>전체</option>")
    for(var age = 0 ; age < 40; age++){
    	$("#m_age").append("<option value='"+(20+age)+"'>"+(20+age)+"세이상</option>")
    }
    if (document.getElementById('editor')) {
        var quill = new Quill('#editor', {
          theme: 'snow' // Specify theme in configuration
        });
      }

      if (document.querySelector('.datetimepicker')) {
        flatpickr('.datetimepicker', {
          allowInput: true,
          local:'ko'
        }); // flatpickr
      }

      Dropzone.autoDiscover = false;
      var drop = document.getElementById('dropzone')
      /*
      if (document.getElementById('choices-multiple-remove-button')) {
          var element = document.getElementById('choices-multiple-remove-button');
          const example = new Choices(element, {
            removeItemButton: true
          });

          example.setChoices(
            [{
                value: 'One',
                label: 'Label One',
                disabled: true
              },
              {
                value: 'Two',
                label: 'Label Two',
                selected: true
              },
              {
                value: 'Three',
                label: 'Label Three'
              },
            ],
            'value',
            'label',
            false,
          );
        }
      */
      load();
    $(document).ready(function() {
    });
      function saveData(){
    	  if($("#flexSwitchCheckDefault").is(":checked")){
    		  if($("#projectName").val() == ""){
    			  Ktoast({
						text : "모집타이틀을 입력해주세요."
						,type : 3
					})
        		  return;
        	  }
    		  if($("#pay").val() == ""){
    			  Ktoast({
						text : "모집금액을 입력해 주세요"
						,type : 3
					})
      		  return;
    		  }
    		  if($("#m_age").val() == ""){
    			  Ktoast({
						text : "모집금액을 입력해 주세요"
						,type : 3
					})
      		  return;
    		  }
    		  
    		  if($("#date_start").val() == ""){
    			  Ktoast({
						text : "모집시작일을 입력해주세요"
						,type : 3
					})
					return;
    		  }
    		  if($("#date_end").val() == ""){
    			  Ktoast({
						text : "모집종료일을 입력해주세요"
						,type : 3
					})
					return;
    		  }
    	  }
    	  
    	  Kajax("/action/updateMyjob",{
    		  onelinetext : $("#projectName").val()
    		  ,rec_yn : $("#flexSwitchCheckDefault").is(":checked")
    		  ,rec_pay : uncomma($("#pay").val())
    		  ,rec_age : $("#m_age option:selected").val()
    		  ,rec_contry : $("#contry option:selected").val()
    		  ,rec_date_start : $("#date_start").val()
    		  ,rec_date_end : $("#date_end").val()
    		  ,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    	  },function(res){
    		  if(res.success){
    			  Kalert("저장이 완료되었습니다.");
    		  }
    	  })
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
    			  $("#projectName").val(res.rows.onelinetext)
    			  $('input:checkbox[id="flexSwitchCheckDefault"]').attr("checked", res.rows.rec_yn);
        		  $("#pay").val(comma(checknull(res.rows.rec_pay,0)));
        		  $("#m_age").val(checknull(res.rows.rec_age,0));
        		  $("#contry").val(checknull(res.rows.rec_contry,0));
        		  $("#date_start").val(new Date(res.rows.rec_date_start).format("yyyy-MM-dd"))
        		  $("#date_end").val(new Date(res.rows.rec_date_end).format("yyyy-MM-dd"))
    		}
    	})
    }
   
    </script>
</body>
</html>
