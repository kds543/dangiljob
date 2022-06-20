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
  <!-- Extra details for Live View on GitHub Pages -->
  <!-- Canonical SEO -->
  <link rel="canonical" href="https://www.creative-tim.com/product/soft-ui-dashboard" />
  <!--  Social tags      -->
  <meta name="keywords" content="creative tim, html dashboard, html css dashboard, web dashboard, bootstrap 5 dashboard, bootstrap 5, css3 dashboard, bootstrap 5 admin, Soft UI Dashboard bootstrap 5 dashboard, frontend, responsive bootstrap 5 dashboard, free dashboard, free admin dashboard, free bootstrap 5 admin dashboard">
  <meta name="description" content="Soft UI Dashboard is a beautiful Bootstrap 5 admin dashboard with a large number of components, designed to look beautiful and organized. If you are looking for a tool to manage and visualize data about your business, this dashboard is the thing for you.">
  <!-- Twitter Card data -->
  <meta name="twitter:card" content="product">
  <meta name="twitter:site" content="@creativetim">
  <meta name="twitter:title" content="Soft UI Dashboard by Creative Tim">
  <meta name="twitter:description" content="Soft UI Dashboard is a beautiful Bootstrap 5 admin dashboard with a large number of components, designed to look beautiful and organized. If you are looking for a tool to manage and visualize data about your business, this dashboard is the thing for you.">
  <meta name="twitter:creator" content="@creativetim">
  <meta name="twitter:image" content="https://s3.amazonaws.com/creativetim_bucket/products/450/original/opt_sd_free_thumbnail.png">
  <!-- Open Graph data -->
  <meta property="fb:app_id" content="655968634437471">
  <meta property="og:title" content="Soft UI Dashboard by Creative Tim" />
  <meta property="og:type" content="article" />
  <meta property="og:url" content="http://demos.creative-tim.com/soft-ui-dashboard/examples/dashboard.html" />
  <meta property="og:image" content="https://s3.amazonaws.com/creativetim_bucket/products/450/original/opt_sd_free_thumbnail.png" />
  <meta property="og:description" content="Soft UI Dashboard is a beautiful Bootstrap 5 admin dashboard with a large number of components, designed to look beautiful and organized. If you are looking for a tool to manage and visualize data about your business, this dashboard is the thing for you." />
  <meta property="og:site_name" content="Creative Tim" />
  <!--     Fonts and icons     -->
  <link type="text/css" href="/resources/djver/style/reset.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/common.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/swiper-bundle.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/layout.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/design.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/main.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/bootstrap.css" rel="stylesheet">
		<link type="text/css" href="/resources/djver/style/bootstrap-icons.css" rel="stylesheet" />
  <!-- Anti-flicker snippet (recommended)  -->
  
  <!--   Core JS Files   -->
  <script src="/resources/js/jquery-3.1.1.min.js"></script>
  <script src="/assets/js/core/popper.min.js"></script>
  <script src="/assets/js/core/bootstrap.min.js"></script>
  <script src="/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
  <script src="/resources/js/kcommon.js?ver=20210423"></script>
      <!-- Toastr -->
    <script src="/resources/js/plugins/toastr/toastr.min.js"></script>
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




	   <div class="login">
			<div class="form-signin  text-center">
			
			  <form>
				<h1 class="mb-5 mt-2">비밀번호 찾기</h1>
				<div class="form-floating">
				  <input type="id" class="form-control" id="id_txt" placeholder="id">
				  <label for="floatingInput">아이디</label>
				</div>
				<div class="form-floating">
				  <input type="name" class="form-control" id="phone_txt" placeholder="010-0000-0000">
				  <label for="floatingInput">휴대폰번호</label>
				</div>
				<div class="form-floating">
				  <input type="email" class="form-control" id="email_txt" placeholder="name@example.com">
				  <label for="floatingPassword">이메일</label>
				</div>
				<p class="mt-3 mb-3 text-muted">변경된 비밀번호가 이메일로 전송됩니다.</p>
				<button class="w-100 btn btn-lg btn-primary" type="button" onclick='idSearch()'>비밀번호 찾기</button>
			  </form>

			</div>
		</div>
		<%@ include file="view/navBtmMobil.jsp" %>
</body>
<script type="text/javascript">

function idSearchCall(){
	$("#check_user_id_body").css("display","none");
	$("#check_user_id").val("");
	$("#check_user_email").val("");
	$("#check_user_phone").val("");
	$("#idSearchViewBtn").trigger("click");
}

function pwdSearchCall(){
	$("#pwd_user_id").val("");
	$("#pwd_user_email").val("");
	$("#pwd_user_phone").val("");
	$("#pwdSearchViewBtn").trigger("click");
}
function idSearch(){
	Kajax("/action/pwdSearch",{
		email : $("#email_txt").val()
		,phone_number : $("#phone_txt").val()
	},function(res){
		if(res.success){
			alert("해당 이메일로 초기화된 비밀번호를 발송하였습니다.")
			/* Ktoast({
				text : "해당 이메일로 초기화된 비밀번호를 발송하였습니다."
				,type : 2
			}) */
		}else{
			alert("해당고객이 존재하지 않습니다.")
			/* Ktoast({
				text : "해당고객이 존재하지 않습니다."
				,type : 2
			}) */
		}
	})
}
function pwdSearch(){
	Kajax("/action/pwdSearch",{
		id : $("#pwd_user_id").val()
		,phone : $("#pwd_user_phone").val()
		,email : $("#pwd_user_email").val()
	},function(res){
		if(res.success){
			alert("해당 이메일로 비밀번호를 발송하였습니다.")
		//	Kalert("해당 이메일로 비밀번호를 발송하였습니다.","");
		}else{
			alert("해당고객이 존재하지 않습니다.")
			/* 
			Ktoast({
				text : "해당고객이 존재하지 않습니다."
				,type : 2
			}) */
		}
	})
}
function login(){
	Kajax("/login/login",{
		user_id : $("#id_txt").val(),
		user_pwd: $("#pass_txt").val()
	},function(res){
		if(res.success){
			location.href = "/";
		}else
		{
			Ktoast({
				text : "아이디와 비밀번호를 확인하여 주세요"
				,type : 2
			});
		}
		
	},function(res){
		Ktoast({
			text : "아이디와 비밀번호를 확인하여 주세요"
			,type : 2
		});
	})
}
</script>

</html>
