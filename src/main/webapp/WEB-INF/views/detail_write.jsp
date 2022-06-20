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
	<!-- <link type="text/css" href="/resources/djver/style/uicons-regular-rounded.css" rel="stylesheet" /> -->
	<link type="text/css" href="/resources/djver/style/bootstrap-icons.css" rel="stylesheet" />
	<link href="/resources/css/plugins/sweetalert/sweetalert.css?ver=1" rel="stylesheet">
	<link href="/resources/css/plugins/toastr/toastr.min.css" rel="stylesheet">
	<!-- <link type="text/css" href="/resources/djver/style/uicons-regular-rounded.css" rel="stylesheet" /> -->
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


	<div class="subtitle">
		<div class="maxWrap">
		  <div class="row">
			<div class="col left">
			  <h4>구인/구직정보 등록하기</h4>
			</div>
		  </div>
		</div>
	</div>





	<div class="detail_bg">
		<div class="detail_write">
			<div class="title">
			<h3>구인(구직) 정보를 입력해주세요</h3>
			</div>

			<form onsubmit="return false">
			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">공개여부</label>
				<div class="col-sm-10">
				  <label for="inputname" class="col-sm-2 col-form-label">
					<input type="checkbox" name="public_scope" id="jobs_public_scope" value="true" onclick="oneCheck(this)"><span class="fw-bold fz13 ms-1">공개</span>
					<input type="checkbox" name="public_scope" id="jobs_private_scope" value="false" onclick="oneCheck(this)"><span class="fw-bold fz13 ms-1"> 비공개</span>
				  </label>
				</div>
			  </div>
			  
			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
				   <input type="title" class="form-control" id="onelinetext" placeholder="제목을 입력해주세요">
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm-10">
				<% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
					<input type="name" class="form-control" id="rec_name" placeholder="회사명을 입력해주세요">
				<% }else{ %>
				   <input type="name" class="form-control" id="rec_name" placeholder="지원자명을 입력해주세요">
				<% } %>
				</div>
			  </div>


			  <div class="row mb-3">
			  <% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
					<label for="inputname" class="col-sm-2 col-form-label">모집분야</label>
				<% }else{ %>
				   <label for="inputname" class="col-sm-2 col-form-label">지원분야</label>
				<% } %>
				
				<div class="col-sm-10">
				   <select id="rec_job" class="form-select">
					  <option value="T00">건설인력</option>
					  <option value="T01">물류인력</option>
					  <option value="T02">여성인력</option>
					  <option value="T03">중장비</option>
					  <option value="T04">용달/화물차</option>
					  <option value="T05">기타</option>
					</select>
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">업무분야</label>
				<div class="col-sm-10">
				   <input type="name" class="form-control" id="rec_detail_job" placeholder="상세한 업무분야를 입력해주세요">
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">지급액</label>
				<div class="col-sm-10">
				   <input type="name" class="form-control" id="rec_pay" onKeyup="numberWithCommastext(this, false)" placeholder="지급액을 입력해주세요">
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">추가 지급액</label>
				<div class="col-sm-10">
				   <input type="expay" class="form-control" id="rec_pay_sub" placeholder="추가 지급액을 입력해주세요">
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">업무시간</label>
				<div class="col-sm-10">
				   <input type="name" class="form-control" id="rec_date_time" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" placeholder="총 업무시간을 입력해주세요">
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">시작일</label>
				<div class="col-sm-10">
				   <input type="date" class="form-control" id="rec_date_start" placeholder="총 업무시간을 입력해주세요">
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">종료일</label>
				<div class="col-sm-10">
				   <input type="date" class="form-control" id="rec_date_end" placeholder="총 업무시간을 입력해주세요">
				</div>
			  </div>			  

			  <div class="row mb-3">
				<label for="inputgender" class="col-sm-2 col-form-label" >요청성별</label>
				<div class="col-sm-10">
					<div class="row">
						<div class="col pe-0">
						  <input type="radio" class="btn-check valid" name="rec_gender" value="남성" id="jobs-application-gender-male">
						  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-application-gender-male">남성</label>
						</div>
						<div class="col pe-0">
							<input type="radio" class="btn-check valid" name="rec_gender" value="여성" id="jobs-application-gender-female">
							<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-application-gender-female">여성</label>
						</div>
						<div class="col ">
						  <input type="radio" class="btn-check valid" name="rec_gender" value="관계없음" id="jobs-application-gender-d">
						  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-application-gender-d">관계없음</label>
						</div>
					</div>
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputnationality" class="col-sm-2 col-form-label" >국적</label>
				<div class="col-sm-10">
					<div class="row">
						<div class="col pe-0">
						  <input type="radio" class="btn-check valid" name="rec_contry" value="내국인만" id="jobs-nationality-local">
						  <label class="btn btn-outline-primary nott ls0 w-100" for="jobs-nationality-local">내국인만</label>
						</div>
						<div class="col pe-0">
							<input type="radio" class="btn-check valid" name="rec_contry" value="외국인만" id="jobs-nationality-foreigner">
							<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-nationality-foreigner">외국인만</label>
						</div>
						<div class="col ">
							<input type="radio" class="btn-check valid" name="rec_contry" value="관계없음" id="jobs-nationality-d" >
							<label class="btn btn-outline-primary nott ls0 w-100" for="jobs-nationality-d">관계없음</label>
						</div>
					</div>
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">최저연령</label>
				<div class="col-4">
				   <input type="name" class="form-control" id="rec_age" placeholder="">
				</div>부터
				<!-- <div class="col-2">
				   <span>부터</span>
				</div> -->
				<div class="col-4">
				   <input type="name" class="form-control" id="rec_age2" placeholder="">
				</div>까지
				<!-- <div class="col-2">
				  <span>까지</span>
				</div> -->
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">근무지역</label>
				<div class="col-sm-10">
				    <input type="name" class="form-control" id="location_addr" placeholder="클릭시 맵연결가능여부 확인, 시,군 까지">
				</div>

			  </div>



			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">연락처</label>
				<div class="col-sm-10">
				   <input type="name" class="form-control" id="rec_phone_number" placeholder="-은 뺴고 입력해주세요" setPhoneNumber>
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">상세업무</label>
				<div class="col-sm-10">
				  <textarea class="form-control mb-2" id="rec_detail" rows="7">
				  </textarea>
				</div>
			  </div>

			  <div class="row mb-3">
				<label for="inputname" class="col-sm-2 col-form-label">요청사항</label>
				<div class="col-sm-10">
				  <textarea class="form-control mb-2" id="rec_req" rows="3">
				  </textarea>
				</div>
			  </div>
			  <div class="row mb-3">
			  	<div class="col-3 pe-0">
					<button class="btn btn-lg btn-secondary w-100" type="button" onclick="history.back()">취소</button>
					</div>
					<div class="col-9">
					<button class=" btn btn-lg btn-primary w-100" type="button" onclick="saveRec()">등록하기</button>
					</div>
			  </div>
					
				</div>	
			</form>
	</div>
	<%@ include file="include/footer.jsp" %>
	<script>
		function oneCheck(a) {
			var obj = document.getElementsByName("public_scope");
			for(var i=0; i<obj.length; i++) {
				if(obj[i]!=a) {
					obj[i].checked = false;
				}
			}
		}
		load();
		function load(){
			Kajax("/action/getMyinfo",{
				seq : <%=String.valueOf(request.getAttribute("c_seq"))%>
			},function(res){
				if(res.success){
					$("#user_name").text(res.rows.name);
					$("#user_title").text(res.rows.onelinetext);
					$("#my_score").text(res.rows.my_score);
					$("#onelinetext").val(res.rows.onelinetext);
					$("#rec_name").val(res.rows.rec_name);
					$("#rec_job").val(checknull(res.rows.rec_job,"T00")).attr("selected", "selected");
					$("#rec_detail_job").val(res.rows.rec_detail_job);
					$("#rec_pay").val(comma(checknull(res.rows.rec_pay,0)));
					$("#rec_pay_sub").val(comma(checknull(res.rows.rec_pay_sub,0)));
					$("#rec_date_time").val(res.rows.rec_date_time);
					$("#rec_date_start").val(res.rows.rec_date_start);
					$("#rec_date_end").val(res.rows.rec_date_end);
				    $('input:radio[name=rec_gender]:input[value=' + res.rows.rec_gender + ']').attr("checked", true);
				    $('input:radio[name=rec_contry]:input[value=' + res.rows.rec_contry + ']').attr("checked", true);
					$("#rec_age").val(res.rows.rec_age.split("-")[0]);
					$("#rec_age2").val(res.rows.rec_age.split("-")[1]);
					$("#location_addr").val(res.rows.location_addr);
					$("#location_addr").attr("lon",res.rows.lon);
					$("#location_addr").attr("lat",res.rows.lat);
					$("#rec_phone_number").val(res.rows.rec_phone_number);
					$("#rec_detail").val(res.rows.rec_detail);
					$("#rec_req").val(res.rows.rec_req);
					$('input:checkbox[name=public_scope]:input[value=' + res.rows.rec_public_scope + ']').attr("checked", true);
				}
			})
		}
		
		function saveRec(){
			Kajax("/actionupdate/saveRec",{
				seq : <%=String.valueOf(request.getAttribute("c_seq"))%>
				, onelinetext : $("#onelinetext").val()
				, rec_name : $("#rec_name").val()
				, rec_job : $("#rec_job option:selected").val()
				, rec_detail_job : $("#rec_detail_job").val()
				, rec_pay : uncomma($("#rec_pay").val())
				, rec_pay_sub : uncomma($("#rec_pay_sub").val())
				, rec_date_time : $("#rec_date_time").val()
				, rec_date_start : $("#rec_date_start").val()
				, rec_date_end : $("#rec_date_end").val()
				, rec_gender : $(":input:radio[name=rec_gender]:checked").val()
				, rec_contry : $(":input:radio[name=rec_contry]:checked").val()
				, rec_age : $("#rec_age").val()+"-"+$("#rec_age2").val()
				, location_addr : $("#location_addr").val()
				, lon : $("#location_addr").attr("lon")
				, lat : $("#location_addr").attr("lat")
				, rec_phone_number : $("#rec_phone_number").val()
				, rec_detail : $("#rec_detail").val()
				, rec_req : $("#rec_req").val()
				, rec_public_scope : $(":input:checkbox[name=public_scope]:checked").val()
				
			},function(res){
				if(res.success){
					alert("저장이 완료되었습니다.");
					load();
				}
			})
		}
	    $('input[setPhoneNumber]').on('keyup', function() { 
	    	$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
	    });
	</script>
</body>
</html>
