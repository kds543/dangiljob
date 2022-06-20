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
	<!-- <link type="text/css" href="./style/uicons-regular-rounded.css" rel="stylesheet" /> -->
	<link type="text/css" href="/resources/djver/style/bootstrap-icons.css" rel="stylesheet" />
	<link href="/resources/css/plugins/sweetalert/sweetalert.css?ver=1" rel="stylesheet">
  	<%@ include file="../include/importjs.jsp" %>
  	<script src="/resources/djver/script/bootstrap.bundle.min.js"></script>
	<script src="/resources/djver/script/script.js"></script>
</head>
<body>
<script>
$(function(){
	$("a, header, img").each(function(){
		$(this).css({transitionDuration:".2s"});
	});
});
</script>
	<%@ include file="../include/menuheader.jsp" %>
	<div class="pagetitle_pc">
		<div class="maxWrap">
			<h3>나의 배정</h3>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">홈</a></li>
				<li class="breadcrumb-item active" aria-current="page">나의 배정</li>
			</ol>
		</div>
	</div>



	<div class="mywidth">
		<div class="form-mypage">
			<div class="tabs  tabs--style1 mb-20">
				<input type="radio" name="tabs3" class="tabs__radio" id="tab3" checked="checked">
				<label class="tabs__label tabs__label--13" for="tab3">진행배정</label>	
				<div class="tabs__content">					
					<div class="itemList pt-0" id="joblist">

					</div>				
				</div>

				<input type="radio" name="tabs3" class="tabs__radio" id="tab4">
				<label class="tabs__label tabs__label--13" for="tab4">진행확정</label>
				<div class="tabs__content">
					<div class="itemList pt-0" id="joblistActive">
						<div class="item">
							<div class="assign">
								<div class="left">
									<div class="top">
										<span>경기도 성남시</span>
									</div>
									<h3 class="me-1">회사명(구인시)</h3>
									<div class="rating_sm">
										<img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;">
									</div>
									<div class="btm">
										<span>2022-02-01&nbsp; 06:30am</span>
									</div>
								</div>
								<div class="right">
									<button type="button" class="btn btn-primary btn-sm me-1 mb-1">전화하기</button>
									<button type="button" class="btn btn-outline-primary btn-sm me-1 mb-1">문자하기</button>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="assign">
								<div class="left">
									<div class="top">
										<span>경기도 성남시</span>
									</div>
									<h3 class="me-1">이름(구직시)&nbsp;<span class="fw400">나이(성별)</span></h3>
									<div class="rating_sm">
										<img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;">
									</div>
									<div class="btm">
										<span>2022-02-01&nbsp; 06:30am</span>
									</div>
								</div>
								<div class="right">
									<button type="button" class="btn btn-primary btn-sm me-1 mb-1">전화하기</button>
									<button type="button" class="btn btn-outline-primary btn-sm me-1 mb-1">문자하기</button>
								</div>
							</div>
						</div>

					</div>

					
				</div> 

				<input type="radio" name="tabs3" class="tabs__radio" id="tab5">
				<label class="tabs__label tabs__label--13" for="tab5">지난배정</label>
				<div class="tabs__content">
					<div class="itemList pt-0" id="joblistComplete">
						<div class="item">
							<div class="assign">
								<div class="left">
									<div class="top">
										<span>경기도 성남시</span>
									</div>
									<h3 class="me-1">이름(구직시)&nbsp;<span class="fw400">나이(성별)</span></h3>
									<div class="rating_sm">
										<img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;"><img src="images/star_full.png" alt="평점" style="transition-duration: 0.2s;">
									</div>
									<div class="btm">
										<span>2022-02-01&nbsp; 06:30am</span>
									</div>
								</div>
								<div class="right">
									<button type="button" class="btn btn-primary btn-mm me-1 mb-1" data-bs-toggle="modal" data-bs-target="#exampleModal">평가하기</button>
								</div>
							</div>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title fw800" id="exampleModalLabel">작업 평가하기</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <div class="modal-body">
			<form>
			  <div class="center">
			    <p><span class="fw800 c_blue" id="target_name"></span>님과의 작업이 어땠나요? <span class="c_blue">(필수)</span></p>
				<div class="rating mt-2 mb-3" id="score_star">
				</div>
			  </div>
			  <hr class="mt-2 mb-2">
			  <!-- <div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked="">
					<label class="form-check-label" for="exampleRadios1">
						시간 약속을 잘 지켜요
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
					<label class="form-check-label" for="exampleRadios2">
						빠르고 정확해요
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
					<label class="form-check-label" for="exampleRadios2">
						응답이 빨라요!
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
					<label class="form-check-label" for="exampleRadios2">
						최고에요!
					</label>
				</div> -->

				
			  <div>
				<label for="message-text" class="col-form-label"><i class="bi bi-emoji-smile"></i> 의견을 남겨주세요!</label>
				<textarea class="form-control" id="evalText" placeholder="응답이 빠르고 시간 약속을 잘지켜요!"></textarea>
			  </div>
			</form>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-secondary col" data-bs-dismiss="modal">닫기</button>
			<button type="button" class="btn btn-primary col" onclick="evalSave()">평가하기</button>
		  </div>
		</div>
	  </div>
	</div>
	<%@ include file="../include/footer.jsp" %>
 <script>
	    load("#joblist",{
			user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			,status : 0
		});
	    load("#joblistActive",{
	    	user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			,status : 1
		});
	    loadlog("#joblistComplete",{
	    	user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			,status : 1
		});
    $(document).ready(function() {
    });
    function evalSave(){
		Kajax("/action/updatelogUserStar",{
    		target_user_seq : $("#score_star").attr("target_user_seq")
    		,user_seq : $("#score_star").attr("user_seq")
    		,create_date : $("#score_star").attr("log_create")
    		,star : $("#score_star").attr("score")
    		,eval_text : $("#evalText").val()
    	},function(res){
    		if(res.success){
    			Kalert("평가가 완료되었습니다. 완료되었습니다.","",function(){
    				location.reload();
    			});
    		}
    	});
	}
    function SetData(list,target){
    	$(target).empty();
    	$.each(list,function(index , item){
    		var button = "";
    		 if(ifnull(item.today_job_status , -1) == -1){
    			 button = '<span class="btn btn-secondary" style="margin-bottom:0px" onclick="addJob('+item.seq+')">신청'	
             }else{
            	 if(ifnull(item.today_job_status , -1) == 0){
            		 button = "";
            		 button +='<button onclick="okJob('+item.seq+')" class="btn btn-primary btn-sm me-1 mb-1">승인</button>'
            		 button +='<button onclick="rejectJob('+item.seq+')" class="btn btn-outline-primary btn-sm me-1 mb-1">거절</button>'
            		// button = '<span class="btn btn-primary" style="margin-bottom:0px" onclick="cancelJob('+item.seq+')">승인대기</span>' 
            	 }else if(ifnull(item.today_job_status , -1) == 1){
            		// button = '<span class="btn btn-warning" style="margin-bottom:0px">승인</span>'
            		 button = "";
            		 button += '<a href="tel:'+item.phone_number+'" class="btn btn-primary btn-sm me-1 mb-1" style="color:white" > 전화 </span>'
            		 button += '<a href="sms:'+item.phone_number+'" class="btn btn-outline-primary btn-sm me-1 mb-1" > 문자 </span>'
            	 }else{
            		 button = '<span class="btn btn-warning" style="margin-bottom:0px">거절</span>'
            	 }
             }
    		 $(target).append('<div class="item">'
    					+'<div class="assign">'
    					+'	<div class="left" style="width:100%">'
    					+'		<div class="top">'
    					+'			<span>'+item.sigungu+'</span>'
    					+'		</div>'
    					+'		<h3 class="me-1">'+item.name+'&nbsp;<span class="fw400">'+getAge(item.regident_reg)+'('+getGender(item.regident_reg)+')</span></h3>'
    					+'		<div class="rating_sm">'
    					+       getStar(item.seq , item.score , item , false)
    					+'		</div>'
    					+'		<div class="btm">'
    					+'			<span>'+new Date(item.log_create_date).format("yyyy-MM-dd hh:mm")+'</span>'
    					+'		</div>'
    					+'	</div>'
    					+'	<div class="right">'
    					+  button
    					+'	</div>'
    					+'</div>'
    					+'</div>');
    	});
    	
    	if(list.length == 0){
    		$(target).append('<tr><td>조회된 데이터가 없습니다.</td></tr>');
    	}
    }
    function SetLogData(list,target){
    	$(target).empty();
    	$.each(list,function(index , item){
    		var imgurl = checknull(item.logo_img , "/resources/img/dangil_logo_big.png?ver=20210617");
    		var button = "";
    			 //button = '<span class="btn btn-default" style="margin-bottom:0px" onclick="evalJob('+item.target_user_seq+','+item.user_seq+','+item.log_create_date+','+checknull(item.user_score,0)+',`'+checknull(item.user_log_text)+'`)">평가하기</span>'
    			 button = '<button type="button" class="btn btn-primary btn-mm me-1 mb-1" onclick="evalJob(`'+item.name+'`,'+item.target_user_seq+','+item.user_seq+','+item.log_create_date+','+checknull(item.user_score,0)+',`'+checknull(item.user_log_text)+'`)" data-bs-toggle="modal" data-bs-target="#exampleModal">평가하기</button>'
    			 $(target).append('<div class="item">'
    						+'<div class="assign">'
    						+'	<div class="left" style="width:100%">'
    						+'		<div class="top">'
    						+'			<span>'+item.sigungu+'</span>'
    						+'		</div>'
    						+'		<h3 class="me-1">'+item.name+'&nbsp;<span class="fw400">'+getAge(item.regident_reg)+'('+getGender(item.regident_reg)+')</span></h3>'
    						+'		<div class="rating_sm">'
    						+       getStar(item.seq , item.user_score , item , false)
    						+'		</div>'
    						+'		<div class="btm">'
    						+'			<span>'+new Date(item.log_create_date).format("yyyy-MM-dd hh:mm")+'</span>'
    						+'		</div>'
    						+'	</div>'
    						+'	<div class="right">'
    						+  button
    						
    						+'	</div>'
    						+'</div>'
    						+'</div>');
    	});
    	if(list.length == 0){
    		$(target).append('<tr><td>조회된 데이터가 없습니다.</td></tr>');
    	}
    }
    
    function callNumber(url,type){
    	if(type == 0){
    		location.href = "tel:"+url;	
    	}else{
    		location.href = "sms:"+url;
    	}
    }
    
    function cancelJob(seq){
    	Kconfirm("작업요청을 취소하시겠습니까?","",function(){
    		Kajax("/action/cancelJob",{
    			target_user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    			,user_seq : seq
    		},function(res){
    			if(res.success){
    				Ktoast({text:"작업요청이 취소되었습니다."});
    				load();
    			}
    		})
    	},null,true);
    }
    function clickStar(index , seq , n_target_user_seq , n_user_seq , n_create_date){
    	$(".star_"+seq).attr("src","/resources/djver/images/star_empty.png");
    	for(var i = 0 ; i < index ; i++){
    		$("#star_id_"+(i+1)+"_"+seq).attr("src","/resources/djver/images/star_full.png");
    	}
    	$("#score_star").attr("score" , index);
    }
    function evalJob(name,target_user_seq , user_seq , create_date , score , log_text){
    	initEvalStar(name,target_user_seq , user_seq , create_date , score);
    	$("#evalText").val(checknull(log_text));
    	$("#eval_modal").modal('show');
    }
    function initEvalStar(name,v_target_user_seq , v_user_seq , v_log_create_date , v_score){
    	$("#score_star").empty();
    	$("#target_name").text(name);
    	var item = {target_user_seq : v_target_user_seq , user_seq : v_user_seq , log_create_date : v_log_create_date};
    	getStar(item.seq , item.user_score , item , false)
    	$("#score_star").append(getStar(logKey(item) , v_score , item , true ));
    	$("#score_star").attr("target_user_seq" , v_target_user_seq);
    	$("#score_star").attr("user_seq" , v_user_seq);
    	$("#score_star").attr("log_create" , new Date(v_log_create_date).format("yyyy-MM-dd"));
    	$("#score_star").attr("score" , v_score);
    }
    function okJob(seq){
    	Kconfirm("작업요청을 받아들이시겠습니까?","",function(){
    		Kajax("/action/updateJob",{
    			user_seq : seq
    			, target_user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    			, status : 1
    		},function(res){
    			if(res.success){
    				Kalert("작업요청이 승인되었습니다.","",function(){
    					Kajax("/action/sendNotification",{
    						seq : seq
    						,title : "[작업알림]"
    						,contents : "<%=String.valueOf(request.getAttribute("name"))%>님께서 작업요청을 승인하셨습니다."
    					},function(res){
    						location.reload();	
    					})
    					location.reload();
    				});
    			}
    		})
    	},null,false);
    }
    function rejectJob(seq){
    	Kconfirm("작업요청을 거절하시겠습니까?","",function(){
    		Kajax("/action/updateJob",{
    			user_seq : seq
    			, target_user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
    			, status : 2
    		},function(res){
    			if(res.success){
    				Kalert("작업요청이 거절되었습니다.","",function(){
    					Kajax("/action/sendNotification",{
    						seq : seq
    						,title : "[작업알림]"
    						,contents : "<%=String.valueOf(request.getAttribute("name"))%>님께서 작업요청을 거절하셨습니다."
    					},function(res){
    						location.reload();	
    					})
    				});
    			}
    		})
    	},null,false);
    }
    function load(target,data){
    	Kajax("/action/getUserJoblist",data,function(res){
    		if(res.success){
    			SetData(res.rows,target)
    		}
    	})
    }
    
    function loadlog(target,data){
    	Kajax("/action/getUserJobloglist",data,function(res){
    		if(res.success){
    			SetLogData(res.rows,target)
    		}
    	})
    }
   
    </script>
</body>
</html>
