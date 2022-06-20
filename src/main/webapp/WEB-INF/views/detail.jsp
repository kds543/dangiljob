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
<body>
<script>
$(function(){
	$("a, header, img").each(function(){
		$(this).css({transitionDuration:".2s"});
	});
});
</script>

	<%@ include file="include/head.jsp" %>
	<%@ include file="view/navBtmMobil.jsp" %>

	<!-- <div class="pagetitle_pc">
		<div class="maxWrap">
			<h3>구인상세정보</h3>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">목록명</a></li>
				<li class="breadcrumb-item active" aria-current="page">구인상세정보</li>
			</ol>
		</div>
	</div> -->


	<div class="detail_bg">
		<div class="detail_view">
		<img src="/resources/djver/images/imagelogo_01.jpg" class="img-fluid" alt="회사사진또는로고">
			<div class="title">			
				<p><l id="user_name"></l>&nbsp;<img src="/resources/djver/images/icon_star.png" alt="평점"> <span>(<l id="my_score">4.5</l>)</span></p>
				<h3 id="user_title"></h3> 
			</div>

			<div class="cont">
				<div class="col">
					<dl>
						<dt>모집분야</dt>
						<dd><strong  class="fw800" id="rec_job">건설인력</strong></dd>
					</dl>
					<dl>
						<dt>업무분야</dt>
						<dd><strong  class="fw800" id="rec_detail_job">자재관리</strong></dd>
					</dl>
					<dl>
						<dt>지급액</dt>
						<dd><strong  class="fw800" id="rec_pay">200,000</strong>&nbsp;원</dd>
					</dl>
					<dl>
						<dt>추가 지급액</dt>
						<dd><strong  class="fw800" id="rec_pay_sub">100,000</strong>&nbsp;원</dd>
					</dl>
				</div>
				<div class="col">
					<dl>
						<dt>업무시간</dt>
						<dd id="rec_date_time">총</dd>
					</dl>
					<dl>
						<dt>시작일시</dt>
						<dd id="rec_date_start">2022-01-04  <span class="ps-2">AM&nbsp;07:00</span></dd>
					</dl>
					<dl>
						<dt>종료일시</dt>
						<dd id="rec_date_end">2022-01-04  <span class="ps-2">PM&nbsp;07:00</span></dd>
					</dl>
				</div>
			</div>
			
			<div class="moreinfo">
				<h4>지원자격 및 근무지역 정보</h4>
				<div class="cont2">
					<div class="col">
						<dl>
							<dt>요청성별</dt>
							<dd id="rec_gender">남성</dd>
						</dl>
						<dl>
							<dt>국적</dt>
							<dd id="rec_contry">내국인만</dd>
						</dl>
						<dl>
							<dt>최저연령</dt>
							<dd id="rec_age">만 22세 ~ (최대)72년생까지 </dd>
						</dl>
					</div>
					<div class="col">
						<dl>
							<dt>근무지역</dt>
							<dd id="location">경기도 분당구</dd>
						</dl>
						
						<dl>
							<dt>연락처 </dt>
							<dd>***********</dd>
						</dl>
						<dl  style="padding-left:0;">
							<dt></dt>
							<dd><span><i class="bi bi-exclamation-triangle-fill c_blue"></i>&nbsp;연락처는 배정확정시 선택된 배정확정자에게만 공개됩니다.</span></dd>
						</dl>
						

					</div>
				</div>

				<div class="detailwork">
					<h4>상세업무</h4>
					<l id="rec_detail"></l>
					
				</div>

				<div class="Request">
					<h4>요청사항</h4>
					<l id="rec_req"></l>
					
				</div>

				<div class="alert alert-light" role="alert">
				  <i class="bi bi-emoji-expressionless-fill"></i> &nbsp;부적절한 콘텐츠의 경우 신고해주세요. <button type="button" class="btn btn-outline-secondary btn-sm ms-3" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</button>				  
				</div>

				<div class="row mb-5">
					<div class="col-3 pe-0">
						<button class="w-100 btn btn-lg button-border button-border-thin button-blue mt-2" type="button" onclick="history.back()">목록</button>
					</div>
					<div class="col-9">
					<% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
						<button class="w-100 btn btn-lg btn-primary mt-2 mb-2 "  style="display:none" type="button" id="jobbtn1" onclick="addJob(<%=String.valueOf(request.getAttribute("c_seq"))%>)">신청하기</button>
						<button class="w-100 btn btn-lg btn-primary mt-2 mb-2 " style="display:none" id="jobbtn2" type="button" onclick="cancelJob(<%=String.valueOf(request.getAttribute("c_seq"))%>)">승인대기</button>
						<button class="w-100 btn btn-lg button-border button-border-thin button-blue mt-2 " id="jobbtn3" style="display:none" type="button">승인</button>
						<button class="w-100 btn btn-lg button-border button-border-thin button-blue mt-2 " id="jobbtn4" style="display:none" type="button">거절</button>
						<button class="w-100 btn btn-lg btn-primary mt-2 mb-2 " id="jobbtn5" style="display:none" type="button" onclick="history.back()">확인</button>
					<% }else{ %>
						<button class="w-100 btn btn-lg btn-primary mt-2 mb-2 " type="button" onclick="history.back()">확인</button>
					<% } %>
					</div>
				</div>
			</div>


		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			정말로 신고 하시겠습니까?
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary col-3"  data-bs-dismiss="modal">취소</button>
			<button type="button" class="btn btn-primary col-3">확인</button>
		  </div>
		</div>
	  </div>
	</div>
	<%@ include file="include/footer.jsp" %>
	<script>
		load();
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
		function load(){
			Kajax("/action/getMyinfo",{
				seq : <%=String.valueOf(request.getAttribute("c_seq"))%>
			},function(res){
				if(res.success){
					$("#user_name").text(res.rows.name);
					$("#user_title").text(checknull(res.rows.onelinetext,"정보없음"));
					$("#my_score").text(checknull(res.rows.my_score,0));
					$("#rec_job").text(checknull(res.rows.rec_job_name,"정보없음"));
					$("#rec_detail_job").text(checknull(res.rows.rec_detail_job,"정보없음"));
					$("#rec_pay").text(comma(checknull(res.rows.rec_pay,0)));
					$("#rec_pay_sub").text(comma(checknull(res.rows.rec_pay_sub,0)));
					$("#rec_age").text(checknull(res.rows.rec_age,"정보없음"));
					$("#rec_gender").text(checknull(res.rows.rec_gender,"정보없음"));
					$("#rec_contry").text(checknull(res.rows.rec_contry,"정보없음"));
					$("#rec_date_start").text(checknull(res.rows.rec_date_start,"정보없음"));
					$("#rec_date_end").text(checknull(res.rows.rec_date_end,"정보없음"));
					$("#rec_date_time").text(checknull(NullCheck(res.rec_date_time)+"시간","정보없음"));
					$("#rec_detail").append(checknull(res.rows.rec_detail,"정보없음"));
					$("#rec_req").append(checknull(res.rows.rec_req,"정보없음"));
					if(res.rows.type == "A02"){
						Kajax("/actionone/logstatus",{
	        	    		target_user_seq : <%=String.valueOf(request.getAttribute("c_seq"))%>,
	        	    		user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
	        	    	},function(res){
	        	    		if(res.success){
	        	    			var button = "";
	        	    			 if(ifnull(res.rows.today_job_status , -1) == -1){
			            			$("#jobbtn1").css("display","block");	
	                             }else{
	                            	 if(ifnull(res.rows.today_job_status , -1) == 0){
	                            		 $("#jobbtn2").css("display","block"); 
	                            	 }else if(ifnull(res.rows.today_job_status , -1) == 1){
	                            		 $("#jobbtn3").css("display","block");
	                            	 }else{
	                            		 $("#jobbtn4").css("display","block");
	                            	 }
	                             }
	        	    		}else{
	        	    			$("#jobbtn1").css("display","block");	
	        	    		}
	        	    	})
					}else{
						$("#jobbtn5").css("display","block");
					}
					if(res.rows.type == "A01") {
						
					}
				}
			})
		}
		function NullCheck(str) {
			 var newStr = str;
			 
			 if(newStr == null || newStr == "undefined") {
				 newStr = 0;
			 }
			 return newStr;
		 }
	</script>
</body>
</html>

