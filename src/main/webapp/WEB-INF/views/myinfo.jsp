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
  <%@ include file="include/importjs.jsp" %>
</head>
<body class="g-sidenav-show  bg-gray-100">
 <script>
$(function(){
	$("a, header, img").each(function(){
		$(this).css({transitionDuration:".2s"});
	});
});
</script>
<%@ include file="include/menuheader.jsp" %>
		<script>
		$("#myinfobtn").addClass("on");
	</script>
	<div class="pagetitle_pc">
		<div class="maxWrap">
			<h3>나의 정보</h3>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">나의 정보</li>
			</ol>
		</div>
	</div>

	

	<div class="mypage">
		<div class="form-mypage">
				<ul class="listview image-listview">
					<li>
						<div class="item">
							<img src="/resources/djver/images/photo_logo.png" alt="image" id="main_img" class="image">
							<div class="in">
								<div>
									<header><l id="type_name">구인회원</l> / 정회원</header>
									<h3 id="my_name">홍길동</h3>
									<div id="my_star">
									</div>
								</div>
								<!-- <button type="button" class="btn btn-primary rounded-pill btn-sm">수정</button> -->
								<a href="/view/my_profile"><img src="/resources/djver/images/nav_arrow_right.png" alt="" style="width: 7px;height: 15px;transition-duration: 0.2s;opacity: 0.5;" /></a> 
							</div>
						</div>
					</li>
					</ul>
					<div class="my_count">
							<div class="row center">
								<div class="col"  style="border-right:1px solid #eee;"><span>상세정보<br /> <a href="/view/my_profile_detail"  class="c_blue fw700">관리</a></span></div>
								<div class="col" style="border-right:1px solid #eee;"><span>내 포인트<br /> <t class="c_blue" id="point">0</t></span></div>
								<div class="col" style="visibility: hidden"><span><i class="bi bi-bell-fill"></i> 새 알림 <a href="#" class="c_blue">9</a>건</span></div>
							</div>
						</div>
					
				
				<div class="my_menu" style="display:none">					
					<div class="row justify-content-center">	
						<div class="col"><img src="/resources/djver/images/userpass.png" alt="이용권 결제" /><span>이용권 결제</span></div>
						<div class="col"><img src="/resources/djver/images/event.png" alt="이벤트" /><span>이벤트</span></div>
						<div class="col"><img src="/resources/djver/images/point.png" alt="포인트 적립" /><span>포인트 적립</span></div>
						<div class="col"><img src="/resources/djver/images/board.png" alt="커뮤니티" /><span>커뮤니티</span></div>
					</div>
				</div>
				<ul class="listview link-listview" >
				<% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
					<% if(String.valueOf(request.getAttribute("onlinetext")).equals(null)) { %>
						<li style="border-bottom:1px solid #eee;"><a href="/view/detail_write/<%=String.valueOf(request.getAttribute("user_seq"))%>"><i class="bi bi-question-circle-fill"></i>구인정보등록하기</a></li>
					<% } %>
				 <% } else {%>
				    	<li style="border-bottom:1px solid #eee;"><a href="/view/detail_write/<%=String.valueOf(request.getAttribute("user_seq"))%>"><i class="bi bi-question-circle-fill"></i>구직정보등록하기</a></li>
				 <% } %>
				
					<li style="display:none"><a href="#"><i class="bi bi-question-circle-fill"></i> 서비스 문의</a></li>
					<li style="display:none"><a href="term.html"><i class="bi bi-file-earmark-text-fill"></i> 이용약관</a></li>
					<li style="display:none"><a href="privacy.html"><i class="bi bi-file-earmark-text-fill"></i> 개인정보취급방침</a></li>
					<li style="display:none"><a href="#"><i class="bi bi-megaphone-fill"></i> 공지사항</a></li>
					<li style="border-bottom:1px solid #eee;display:none"><a href="#"><i class="bi bi-gear-fill"></i> 앱설정</a></li>
				</ul>
				<div class="ver mb-4">앱 버전 확인</div>
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
    			$("#my_star").empty();
    			$("#my_star").append(getStar(res.rows.seq , res.rows.my_score , res.rows , false));
    			$("#my_star").append('<a href="#"  class="fz12">(0)</a>');
    			$("#point").text(comma(res.rows.point));
    			$("#my_name").text(res.rows.name);
    			$("#type_name").text((res.rows.type == "A01" ? "구인회원" : "구직회원"))
    			/*
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
    			*/
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
