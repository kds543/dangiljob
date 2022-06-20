<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
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
	<link type="text/css" href="/resources/djver/style/calendar.css" rel="stylesheet"/>
	
	<%@ include file="include/importjs.jsp" %>
	
	<script src="/resources/djver/script/swiper-bundle.min.js"></script>
	<script src="/resources/djver/script/script.js"></script>
	<script src="/resources/djver/script/jquery.calendario.js"></script>
	<script src="/resources/djver/script/events-data.js"></script>
	<script src="/resources/djver/script/bootstrap.bundle.min.js"></script>
	
	
	<link type="text/css" href="/resources/djver/style/bootstrap.css" rel="stylesheet">
	<link type="text/css" href="/resources/djver/style/bootstrap-icons.css" rel="stylesheet" />
</head>
<body>
<script>
$(function(){
	$("a, header, img").each(function(){
		$(this).css({transitionDuration:".2s"});
	});
});
</script>
	<div class="bg"></div>
	<%@ include file="view/navBtmMobil.jsp" %>
	<%@ include file="include/menuheader.jsp" %>


	<header class="mobile">
		
		<div class="left">
            <a href="#" class="headerButton goBack">
                <i class="bi bi-arrow-left"></i>
            </a>
        </div>
        <div class="pageTitle">나의 일정</div>
        <div class="right">
            <a href="#" class="headerButton">
                <i class="bi bi-search"></i>
            </a>
        </div>

	</header>

	<div class="pagetitle_pc">
		<div class="maxWrap">
			<h3>나의 일정</h3>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">나의 일정</li>
			</ol>
		</div>
	</div> 


	<div class="maxWrap"><!-- class="mywidth pt-0" -->
		<div class="parallax header-stick bottommargin-lg" data-bottom-top="background-position:0px 0px;" data-top-bottom="background-position:0px -500px;">
			<div class="events-calendar">
				<div class="events-calendar-header clearfix">
					<h3 class="calendar-month-year">							
						<span id="calendar-year" class="calendar-year">2022년</span>
						<span id="calendar-month" class="calendar-month">3월</span>
						<nav>
							<span id="calendar-prev" class="calendar-prev"><i class="bi bi-chevron-left"></i></span>
							<span id="calendar-next" class="calendar-next"><i class="bi bi-chevron-right"></i></span>
							<span id="calendar-current" class="calendar-current" title="Got to current date"><i class="bi bi-arrow-clockwise "></i></span>
						</nav>
					</h3>
				</div>
				<div class="row">
					<div class="col-sm-8">		
						<div id="calendar" class="fc-calendar-container"></div>
					</div>
					<div class="col-sm-4 mt-2">
						<div class="job-today">
							<span id="clicked-year"></span>년 
							<span id="clicked-month"></span>월 
							<span id="clicked-day"></span>일 
							<span id="week">요일</span><br/>
						</div>
						
						<div class="job-body">
							<button class="w-100 btn button-border button-border-thin button-blue mt-2" data-bs-toggle="modal" data-bs-target="#modalsked">일정 등록하기</button>
							<div class="card w-100">
							    <div class="card-body">
									<h5 class="card-title">저장한 내용 확인</h5>
									<p class="card-text" id="card_field">해당 일정이 비었습니다.</p>
									<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modaledit" id="edit" onclick="loadCal()">편집하기</button>
									
							    </div>
							</div>
							<div class="daingil-none">
								<img src="/resources/djver/images/dangil_03.png" alt="해당일정이 비었습니다." />
								<p></p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>		
	</div>

	<div class="modal fade " id="modalsked" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title fw800" id="exampleModalLabel">일정 등록하기</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			<form onsubmit="return false">
				<div class="row mb-3">
					<label for="inputtitle" class="col-sm-3 col-form-label">제목</label>
					<div class="col-sm-12">
					   <input type="name" class="form-control" id="user_title" placeholder="제목">
					</div>
				</div>

				<div class="row mb-2">
					<label for="inputtel" class="col-sm-3 col-form-label" >메모</label>
					<div class="col-sm-12">
						<textarea class="form-control" id="user_contents" rows="5" placeholder="상세 내용을 입력하세요."></textarea>
					</div>
				</div>
		
		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary col" data-bs-dismiss="modal">닫기</button>
			<button type="button" class="btn btn-primary col" onclick="saveCal()">저장하기</button>
		  </div>
		  </form>
		  </div>
		</div>
	  </div>
	</div>	
	
	<div class="modal fade " id="modaledit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title fw800" id="exampleModalLabel">일정 편집하기</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			<form onsubmit="return false">
				<div class="row mb-3">
					<label for="inputtitle" class="col-sm-3 col-form-label">제목</label>
					<div class="col-sm-12">
					   <input type="name" class="form-control" id="edit_user_title" placeholder="제목">
					</div>
				</div>

				<div class="row mb-2">
					<label for="inputtel" class="col-sm-3 col-form-label" >메모</label>
					<div class="col-sm-12">
						<textarea class="form-control" id="edit_user_contents" rows="5" placeholder="상세 내용을 입력하세요."></textarea>
					</div>
				</div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-primary col" onclick="prevCal()">이전</button>
			<button type="button" disabled="" id="edit_user_term"></button>
			<button type="button" class="btn btn-primary col" onclick="nextCal()">다음</button>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary col" data-bs-dismiss="modal">닫기</button>
			<button type="button" class="btn btn-secondary col" onclick="deleteCal()">삭제하기</button>
			<button type="button" class="btn btn-primary col" onclick="updateCal()">수정하기</button>
		  </div>
		  </form>
		  </div>
		</div>
	  </div>
	</div>

	<%@ include file="include/footer.jsp" %>
	<script>
	var title_list = [];
	var contents_list = [];
	var term_list = [];
	var count, max;
	var text;
	var cday = [0,31,28,31,30,31,30,31,31,30,31,30,31];
	var tyear, tmonth, tday;
	$(document).ready(function() {
		var today = new Date();	
		
		tyear = today.getFullYear();
		tmonth = ("0"+(today.getMonth()+1)).slice(-2);
		tday = ("0"+(today.getDate())).slice(-2);
		
		$('#clicked-year').val(tyear);
		$('#clicked-month').val(tmonth);
		$('#clicked-day').val(tday);
		$('#edit').attr("disabled",true);
		setCal();
	});
	function setCal() {
		$("#callist").empty();
		$("#card_field").text("해당 일정이 비었습니다.");
		text = Array.from({length:32}, () => "");
		Kajax("/action/setJobList",{
			year : $('#clicked-year').val()
			, month : $('#clicked-month').val()
			, seq : <%=String.valueOf(request.getAttribute("user_seq")) %>
		},function(res){
			if(res.success){
				$.each(res.rows , function(index , item){
					$("#callist").append(getjobcal(item));
				})
			}
		})
		Kajax("/action/settjList",{
			year : $('#clicked-year').val()
			, month : $('#clicked-month').val()
			, seq : <%=String.valueOf(request.getAttribute("user_seq")) %>
		},function(res){
			if(res.success){
				$.each(res.rows , function(index , item){
					$("#callist").append(getjobcal(item));
				})
			}
		})
		Kajax("/action/setCalLoadList",{
			year : $('#clicked-year').val()
			, month : $('#clicked-month').val()
			, seq : <%=String.valueOf(request.getAttribute("user_seq")) %>
		},function(res){
			if(res.success){
				count=0;
				$.each(res.rows , function(index , item){
					$("#callist").append(getsetcal(item));
					count++;
				})
			}
		})
		month = cal.getMonth();
		for(i=1;i<=cday[month];i++) {
			if(i < 10 && text[i] != "") {
				var jsonobj = '{\"'+$('#clicked-month').val() + '-0' + i + '-' + $('#clicked-year').val()+'\" : ""}'
				var obj = JSON.parse(jsonobj);
				obj[$('#clicked-month').val() + '-0' + i + '-' + $('#clicked-year').val()] = "<a target='_blank'>"+text[i]+"</a>";
				
				cal.setData(obj);
			}
			else if(i>9 && text[i] != ""){
				var jsonobj = '{\"'+$('#clicked-month').val() + '-' + i + '-' + $('#clicked-year').val()+'\" : ""}'
				var obj = JSON.parse(jsonobj);
				obj[$('#clicked-month').val() + '-' + i + '-' + $('#clicked-year').val()] = "<a target='_blank'>"+text[i]+"</a>";
				
				cal.setData(obj);
			}
			else {
				var jsonobj = '{\"'+$('#clicked-month').val() + '-' + i + '-' + $('#clicked-year').val()+'\" : ""}'
				var obj = JSON.parse(jsonobj);
				obj[$('#clicked-month').val() + '-' + i + '-' + $('#clicked-year').val()] = "<a target='_blank' style="+'display:none;'+">"+text[i]+"</a>";
				
				cal.setData(obj);
			}
		}

	}
		function load(){
			title_list.splice(0);
			contents_list.splice(0);
			term_list.splice(0);
			$("#callist").empty();
			$("#card_field").empty();
			Kajax("/action/calJobList",{
				year : $('#clicked-year').val()
				, month : $('#clicked-month').val()
				, day : $('#clicked-day').val()
				, seq : <%=String.valueOf(request.getAttribute("user_seq")) %>
			},function(res){
				if(res.success){
					$.each(res.rows , function(index , item){
						$("#callist").append(getitemjob(item));
					})	
				}
			})
			Kajax("/action/caltjList",{
				year : $('#clicked-year').val()
				, month : $('#clicked-month').val()
				, day : $('#clicked-day').val()
				, seq : <%=String.valueOf(request.getAttribute("user_seq")) %>
			},function(res){
				if(res.success){
					$.each(res.rows , function(index , item){
						$("#callist").append(getitemjob(item));
					})	
				}
			})
			Kajax("/action/calLoadList",{
				year : $('#clicked-year').val()
				, month : $('#clicked-month').val()
				, day : $('#clicked-day').val()
				, seq : <%=String.valueOf(request.getAttribute("user_seq")) %>
			},function(res){
				if(res.success){
					count=0;
					$.each(res.rows , function(index , item){
						$("#callist").append(getitem(item));
						count++;
					})					
					if($("#card_field").is(':empty'))
						$("#card_field").text("해당 일정이 비었습니다.");
					if(count == 0){
						$("#edit").attr("disabled",true);
					} else {
						$("#edit").attr("disabled",false);
					}
					max=count-1;
					count=0;
				}
			})
			loadCal();
		}
		
		var cal = $( '#calendar' ).calendario( {
				onDayClick : function( $el, $contentEl, dateProperties ) {
					for( var key in dateProperties ) {
						console.log( key + ' = ' + dateProperties[ key ] );
					}
					$('#clicked-year').html( dateProperties[ 'year' ]);
					$('#clicked-month').html( dateProperties[ 'month' ] );
					$('#clicked-day').html( dateProperties[ 'day' ] );
					$('#week').val(dateProperties['weekday']);
					if($('#week').val() == 6)
						$('#week').html("토요일");
					else $('#week').html(dateProperties['weekdayname']);
					$('#clicked-year').val(dateProperties['year']);
					$('#clicked-month').val(dateProperties['month']);
					if($('#clicked-month').val() < 10) 
						$('#clicked-month').val("0"+$('#clicked-month').val())
					$('#clicked-day').val(dateProperties['day']);
					if($('#clicked-day').val() < 10) 
						$('#clicked-day').val("0"+$('#clicked-day').val())
					load();
				},
				caldata : canvasEvents
			} ),
			$month = $( '#calendar-month' ).html( cal.getMonthName() ),
			$year = $( '#calendar-year' ).html( cal.getYear() );
		
		$( '#calendar-next' ).on( 'click', function() {
			cal.gotoNextMonth( updateMonthYear );
			setCal();
		} );
		$( '#calendar-prev' ).on( 'click', function() {
			cal.gotoPreviousMonth( updateMonthYear );
			setCal();
		} );
		$( '#calendar-current' ).on( 'click', function() {
			cal.gotoNow( updateMonthYear );
			setCal();
		} );
		
		function updateMonthYear() {
			$month.html( cal.getMonthName() );
			$year.html( cal.getYear() );
			$("#clicked-year").val(cal.getYear());
			$("#clicked-month").val(cal.getMonth());
			if($("#clicked-month").val() < 10)
				$("#clicked-month").val("0"+$("#clicked-month").val());
		}
		function getsetcal(item){
			if(item.day < 10) {
				var day = (item.day).slice(-1);
			} else day = item.day;
			text[day] = text[day]+(item.user_title+"<br>").toString();
		}
		
		function getjobcal(item) {
			if(item.start_year == item.end_year) {
			if(item.diff == 0) {
				var status=1;
				for(i=item.start_day;i<=item.end_day;i++){
					if(i < 10 && status == 1 ) {
						i = i.slice(-1);
						status=0;
					}
					text[i] = text[i]+(item.onelinetext+"<br>").toString();
				}
			}
			else if(item.diff == 1) {
				if(item.start_month == cal.getMonth()) {
					var status=1;
					for(i=item.start_day;i<=cday[cal.getMonth()];i++) {
						if(i < 10 && status == 1) {
							i = i.slice(-1);
							status=0;
						}
						text[i] = text[i]+(item.onelinetext+"<br>").toString();
					}
				} else if(item.end_month == cal.getMonth()) {
					for(i=1;i<=item.end_day;i++) {
						text[i] = text[i]+(item.onelinetext+"<br>").toString();
					}
				}
			} else if(item.diff > 1) {
				if(item.start_month == cal.getMonth()) {
					var status=1;
					for(i=item.start_day;i<=cday[cal.getMonth()];i++) {
						if(i < 10 && status == 1) {
							i = i.slice(-1);
							status=0;
						}
						text[i] = text[i]+(item.onelinetext+"<br>").toString();
					}
				} else if(item.end_month == cal.getMonth()) {
					for(i=1;i<=item.end_day;i++) {
						text[i] = text[i]+(item.onelinetext+"<br>").toString();
					}
				} else {
					for(i=1;i<=cday[cal.getMonth()];i++) {
						text[i] = text[i]+(item.onelinetext+"<br>").toString();
					}
				}
			}
		} else {
			if(item.start_month == cal.getMonth() && item.start_year == cal.getYear()) {
				var status=1;
				for(i=item.start_day;i<=cday[cal.getMonth()];i++) {
					if(i < 10 && status == 1) {
						i = i.slice(-1);
						status=0;
					}
					text[i] = text[i]+(item.onelinetext+"<br>").toString();
				}
			} else if(item.end_month == cal.getMonth() && item.end_year == cal.getYear()) {
				for(i=1;i<=item.end_day;i++) {
					text[i] = text[i]+(item.onelinetext+"<br>").toString();
				}
			} else {
				for(i=1;i<=cday[cal.getMonth()];i++) {
					text[i] = text[i]+(item.onelinetext+"<br>").toString();
				}
			}
		}
		}
		
		function getitem(item){
			$("#card_field").append(("제목 : "+item.user_title+'\n'+"내용 : "+item.user_contents+'\n'+'\n').replace(/\n/g, '<br/>'));
			
			title_list[count] = item.user_title;
			contents_list[count] = item.user_contents;
			term_list[count] = item.term;
		}
		
		function getitemjob(item){
			$("#card_field").append(("배정된 일정 : "+item.onelinetext+'\n'+'\n').replace(/\n/g, '<br/>'));
		}
		
		function saveCal(){
			Kajax("/action/saveCal",{
				seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
				, year : $("#clicked-year").val()
				, month : $("#clicked-month").val()
				, day : $("#clicked-day").val()
				, user_title : $("#user_title").val()
				, user_contents : $("#user_contents").val()
			},function(res){
				if(res.success){
					alert("저장이 완료되었습니다.");
					setCal();
					load();
				}
			})
		}

		function prevCal() {
			if(count == 0) {
				alert("이전 일정이 없습니다!");
			}
			else count--; 
			loadCal(); 
		}
		function nextCal() {
			if(count == max) {
				alert("다음 일정이 없습니다!");
			}
			else count++; 
			loadCal();
		}
		
		function loadCal(){
			$('#edit_user_title').val(title_list[count]);
			$('#edit_user_contents').val(contents_list[count]);
			$('#edit_user_term').val(term_list[count]);
		}
		
		function updateCal(){
			Kajax("/action/updateCal", {
				seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
				, user_title : $("#edit_user_title").val()
				, user_contents : $("#edit_user_contents").val()
				, term : $("#edit_user_term").val()
			},function(res) {
				if(res.success){
					alert("수정이 완료되었습니다.");
					setCal();
					load();
				}
			})
		}
		function deleteCal(){
			Kajax("/action/deleteCal", {
				seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
				, term : $("#edit_user_term").val()
			},function(res) {
				if(res.success){
					alert("삭제가 완료되었습니다.");
					setCal();
					load();
				}
			})
		}
	</script>

</body>
</html>