<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당일천국</title>
    <%@ include file="include/importcss.jsp" %>
    <script src="/resources/js/jquery-3.1.1.min.js"></script>
     <%@ include file="include/importjs.jsp" %>

</head>

<body class="gray-bg" style="background-color:#34495e;">

    <div class="middle-box text-center loginscreen animated fadeInDown" style="width:87%">
        <div class="ibox-content" style="margin-top:56px;border-radius:18px">
            <div>
            	<center><img alt="image" style="border: 0px solid gold;height:80px;width:95px" src="/resources/img/logo.png?ver=20210617" /></center>
            </div>
            <h3 style="margin-top:22px">당일천국</h3>
            <p>방문을 환영합니다.
                <!--Continually expanded and constantly improved Inspinia Admin Them (IN+)-->
            </p>
            <form class="m-t" role="form" onsubmit="return false">
                <div class="form-group">
                    <input type="text" id="id_txt" class="form-control" placeholder="아이디" required="">
                </div>
                <div class="form-group">
                    <input type="password" id="pass_txt" class="form-control" placeholder="비밀번호" required="">
                </div>
                <button type="button" class="btn btn-primary block full-width m-b" onclick="login()">로그인</button>
                <a class="btn btn-sm btn-white btn-block" href="regform">회원가입 </a>
                <p class="text-muted text-center"><small>아이디찾기</small> <a href="#"><small>비밀번호찾기</small></a></p>
            </form>
            <p class="m-t"> <small>©2021. 당일천국. All rights reserved.</small> </p>
        </div>
    </div>

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
