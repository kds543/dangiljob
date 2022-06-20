<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
		<link type="text/css" href="/resources/djver/style/bootstrap-icons.css" rel="stylesheet" />
		
		<script src="/resources/js/jquery-3.1.1.min.js"></script>
		<script src="/resources/djver/script/swiper-bundle.min.js"></script>
		<script src="/resources/djver/script/script.js"></script>
		 <script src="/resources/js/kcommon.js?ver=20210423"></script>
		 <script src="/assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
      <!-- Toastr -->
    <script src="/resources/js/plugins/toastr/toastr.min.js"></script>
</head>
<%@ include file="include/androidBridge.jsp" %>
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

			  <form onsubmit="return false">
				<img class="mb-4" src="/resources/djver/images/logo_login.png" alt="로고" width="120" height="120">
				<!-- <h1 class="h3 mb-3 fw-bold">내가 가는 곳이  곧 일터!</h1> -->

				<div class="form-floating">
				  <input type="id" id="id_txt" class="form-control" id="floatingInput" placeholder="name@example.com">
				  <label for="floatingInput">아이디</label>
				</div>
				<div class="form-floating">
				  <input type="password" id="pass_txt" class="form-control" id="floatingPassword" placeholder="Password">
				  <label for="floatingPassword">비밀번호</label>
				</div>

				<div class="checkbox mb-3">
				  <label>
					<input type="checkbox" value="remember-me"><span class="fw-bold fz13 ms-1"> 자동 로그인</span>
				  </label>
				</div>
				<button class="w-100 btn btn-lg btn-primary" type="button" onclick="login()">로그인</button>
				<p class="mt-3 mb-3 text-muted"><a href="/view/idSearch">아이디 찾기</a>  |  <a href="/view/pwdSearch">비밀번호 찾기</a></p>
				
				<div class="joinin">
					<p class="mt-6 fw-bold">당일JOB 이용이 처음이신가요?&nbsp;<a href="regform" class="fw-bold c_blue">회원가입</a></p>
					
				</div>
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
function pwdSearch(){
	Kajax("/action/pwdSearch",{
		id : $("#pwd_user_id").val()
		,phone : $("#pwd_user_phone").val()
		,email : $("#pwd_user_email").val()
	},function(res){
		if(res.success){
			Kalert("해당 이메일로 비밀번호를 발송하였습니다.","");
		}else{
			Ktoast({
				text : "해당고객이 존재하지 않습니다."
				,type : 2
			})
		}
	})
}
function login(){
	Kajax("/login/login",{
		user_id : $("#id_txt").val(),
		user_pwd: $("#pass_txt").val()
	},function(res){
		if(res.success){
			checkdeviceload($("#id_txt").val());
		}else
		{
			alert("아이디와 비밀번호를 확인하여 주세요");
		}
	},function(res){
		alert("아이디와 비밀번호를 확인하여 주세요");
	})
}
</script>

</html>
