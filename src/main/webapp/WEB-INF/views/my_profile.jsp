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
	<link href="/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
	<!-- <link type="text/css" href="./style/uicons-regular-rounded.css" rel="stylesheet" /> -->
	<link type="text/css" href="./style/bootstrap-icons.css" rel="stylesheet" />
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
	<%@ include file="include/menuheader.jsp" %>
	<div class="pagetitle_pc">
		<div class="maxWrap">
			<h3>프로필 정보 수정</h3>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">프로필 정보 수정</li>
			</ol>
		</div>
	</div>

	<div class="mypage">
		<div class="form-mypage">
			<ul class="image-listview">
				<li>
					<div class="item_profile">
						<img src="/resources/djver/images/photo_logo.png" id="main_img" alt="image" class="image" style="transition-duration: 0.2s;">
						<input class="form-control-circle" type="file" id="formFile">
						<div class="camera-icon">
							<span class="ladda-label"><i class="bi bi-camera-fill"></i></span>
						</div>						
					</div>
				</li>
			</ul> 
		</div>
	</div>



	<div class="mywidth pt-0">
		<div class="form-profile">
			<div class="alert alert-primary center fz13 mt-0" role="alert">
				<i class="bi bi-emoji-smile"></i> 개인 사진을 올리시면 구직(구인) 요청에 도움이 됩니다.
			</div>
			<form>
			    <div class="row mb-3">
					<label for="inputname" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
					   <input type="name" class="form-control" id="my_name" placeholder="홍길동">
					</div>
			    </div>
			    <% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
			    <div class="row mb-3">
					<label for="inputname" class="col-sm-2 col-form-label">모집타이틀</label>
					<div class="col-sm-10">
					   <input type="name" class="form-control" id="projectName" placeholder="">
					</div>
			    </div>
			    <div class="row mb-3">
					<label for="inputname" class="col-sm-2 col-form-label">모집중여부</label>
					<div class="col-sm-10">
					   <input type="checkbox" class="form-check-input" id="flexSwitchCheckDefault" placeholder="">
					</div>
			    </div>
			    <div class="row mb-3">
					<label for="inputname" class="col-sm-2 col-form-label">모집금액</label>
					<div class="col-sm-10">
					   <input type="name" class="form-control" onkeypress="numberWithCommastext(this , false)" id="pay" placeholder="0">
					</div>
			    </div>
			    <div class="row mb-3">
					<label for="inputname" class="col-sm-2 col-form-label">업무타입</label>
					<div class="col-sm-10">
					  <select class="form-control" id="worker">
			                	<option value="0" selected="selected">일당</option>
			                	<option value="1">오전</option>
			                	<option value="2">오후</option>
			                	<option value="3">야간</option>
			            </select>
					</div>
			    </div>
			    <div class="row mb-3">
					<label for="inputname" class="col-sm-2 col-form-label">모집나이</label>
					<div class="col-sm-10">
					   <select class="form-control" id="m_age">
		                <option value="0">전체</option><option value="20">20세이상</option><option value="21">21세이상</option><option value="22">22세이상</option><option value="23">23세이상</option><option value="24">24세이상</option><option value="25">25세이상</option><option value="26">26세이상</option><option value="27">27세이상</option><option value="28">28세이상</option><option value="29">29세이상</option><option value="30">30세이상</option><option value="31">31세이상</option><option value="32">32세이상</option><option value="33">33세이상</option><option value="34">34세이상</option><option value="35">35세이상</option><option value="36">36세이상</option><option value="37">37세이상</option><option value="38">38세이상</option><option value="39">39세이상</option><option value="40">40세이상</option><option value="41">41세이상</option><option value="42">42세이상</option><option value="43">43세이상</option><option value="44">44세이상</option><option value="45">45세이상</option><option value="46">46세이상</option><option value="47">47세이상</option><option value="48">48세이상</option><option value="49">49세이상</option><option value="50">50세이상</option><option value="51">51세이상</option><option value="52">52세이상</option><option value="53">53세이상</option><option value="54">54세이상</option><option value="55">55세이상</option><option value="56">56세이상</option><option value="57">57세이상</option><option value="58">58세이상</option><option value="59">59세이상</option></select>
					</div>
			    </div>
			    <div class="row mb-3">
					<label for="inputname" class="col-sm-2 col-form-label">내국인여부</label>
					<div class="col-sm-10">
					   <select class="form-control" id="contry">
			                	<option value="-1">국적무관</option>
			                	<option value="1">내국인만</option>
			                	<option value="0">외국인만</option>
			                </select>
					</div>
			    </div>
			    <% } %>
				<div class="row mt-5">
					<div class="col-12">
					<button class=" btn btn-lg btn-primary w-100" type="button" onclick="saveData()">정보 수정 완료</button>
					</div>
				</div>	

				<span class="fz13 center d-block  mt-3"><i class="bi bi-exclamation-triangle-fill"></i> 허위정보 입력시 서비스이용 제한 및 개인적인 불이익이 <br /> 발생할 수 있습니다.</span>
			</form>
			
		</div>
	</div>


	<%@ include file="include/footer.jsp" %>
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
 function saveData(){
	 
	 if($("#name").val() == ""){
		  Ktoast({
				text : "이름을 입력해 주세요"
				,type : 3
			})
	  return;
	  }
	 <% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
	 
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
	  <% } %>
	  Kajax("/action/updateMyjob",{
		  onelinetext : $("#projectName").val()
		  ,rec_yn : $("#flexSwitchCheckDefault").is(":checked")
		  ,rec_req : $("#flexSwitchCheckDefault").is(":checked")
		  ,rec_pay : uncomma($("#pay").val())
		  ,rec_age : $("#m_age option:selected").val()
		  ,rec_contry : $("#contry option:selected").val()
		  ,rec_date_start : $("#date_start").val()
		  ,name : $("#my_name").val()
		  ,rec_date_end : $("#date_end").val()
		  ,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
	  },function(res){
		  if(res.success){
			  Kalert("저장이 완료되었습니다.");
		  }
	  })
	  
 }
    load();
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
    			$("#my_name").val(res.rows.name);
    			if(checknull(res.rows.logo_img) != ""){
    				$("#main_img").attr("src",res.rows.logo_img);
               	 $("#main_img").attr("url",res.rows.logo_img);	
    			}
    			  $("#projectName").val(res.rows.onelinetext)
    			  $('input:checkbox[id="flexSwitchCheckDefault"]').prop("checked", res.rows.rec_yn);
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
