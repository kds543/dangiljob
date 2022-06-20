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
  <%@ include file="../include/importcss.jsp" %>
  <link id="pagestyle" href="/assets/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />
</head>
<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
  <%@ include file="../include/left.jsp" %>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg">
  <div class="modal inmodal fade"  id="eval_modal" tabindex="-1"  role="dialog"  aria-hidden="true">
									               <div class="modal-dialog modal-lg" style="width:95%;min-width:360px">
									                       <div class="modal-content" style="display:block;">
									                                        <div class="modal-header">
									                                        
									                                            <button type="button" class="close" onclick="$('#eval_modal').modal('hide')"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									                                            <h4 class="modal-title" id="s_title">평가하기</h4>
									                                           
									                                        </div>
									                                        <div class="modal-body" style="width:100%;margin-left:0px !important">
									                                         <form method="get" onsubmit="return false" action="return false">
											                                    <div class="form-group  row">
												                                    <div class="col-sm-12" id="score_star">
												                                    </div>
												                                </div>
												                                  <div class="form-group  row">
												                                    <div class="col-sm-12"><textarea class="form-control" style="height:120px" id="evalText" rows="" cols=""></textarea></div>
												                                </div>
												                              </form>
									                            			</div>
									                            			<div class="modal-footer">
									                                            <button type="button" class="btn btn-white" onclick="$('#eval_modal').modal('hide')">닫기</button>
									                                            <button type="button" class="btn btn-primary" onclick="evalSave()">평가하기</button>
									                                        </div>
									                  </div>
									            </div>
									            <script type="text/javascript">
										            
									            
									            	
									            </script>
		  </div>
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg position-sticky mt-1 top-1 px-0 mx-1 shadow-none border-radius-xl z-index-sticky" id="navbarBlur" data-scroll="true">
      <div class="container-fluid py-1 px-3">
        <div class="sidenav-toggler sidenav-toggler-inner d-xl-block d-none ">
          <a href="javascript:;" class="nav-link text-body p-0">
            <div class="sidenav-toggler-inner">
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
              <i class="sidenav-toggler-line"></i>
            </div>
          </a>
        </div>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          <div class="ms-md-auto pe-md-3 d-flex align-items-center" id="topfilterBtn">
          </div>
          <ul class="navbar-nav  justify-content-end">
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid">
      <div class="row min-vh-75" >
      <div class="row" style="padding:10px">
           <div class="col-lg-12">
					                                  <div class="ibox">
                        <div class="ibox-content">
                        <!-- 
                            <div class="input-group">
                                <input type="text" placeholder="Search client " class="input form-control">
                                <span class="input-group-append">
                                        <button type="button" class="btn btn btn-primary"> <i class="fa fa-search"></i> Search</button>
                                </span>
                            </div>
                            -->
                            <div class="clients-list">
                            <span class="float-right small text-muted" style="font-size:120%;font-weight:bold" ></span>
                            <div class="nav-wrapper position-relative end-0">
							   <ul class="nav nav-pills nav-fill p-1" role="tablist">
							      <li class="nav-item">
							         <a class="nav-link mb-0 px-0 py-1 active" data-bs-toggle="tab" href="#tab-1" role="tab" aria-controls="profile" aria-selected="true">
							         	진행배정
							         </a>
							      </li>
							      <li class="nav-item">
							         <a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#tab-2" role="tab" aria-controls="dashboard" aria-selected="false">
							         	진행확정
							         </a>
							      </li>
							      <li class="nav-item">
							         <a class="nav-link mb-0 px-0 py-1" data-bs-toggle="tab" href="#tab-3" role="tab" aria-controls="dashboard" aria-selected="false">
							         	지난배정
							         </a>
							      </li>
							    </ul>
							</div>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane active">
                                			<div class="ibox">
						                        <div class="col-12">
										          <div class="card">
										            <div class="card-body px-0 pt-0 pb-2">
										              <div class="table-responsive p-0">
										                <table class="table align-items-center mb-0">
										                  <thead>
										                  </thead>
										                  <tbody id="joblist">
										                  </tbody>
										                </table>
										              </div>
										            </div>
										          </div>
										        </div>
						                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane">
                                		<div class="ibox">
						                        <div class="col-12">
										          <div class="card">
										            <div class="card-body px-0 pt-0 pb-2">
										              <div class="table-responsive p-0">
										                <table class="table align-items-center mb-0">
										                  <thead>
										                  </thead>
										                  <tbody id="joblistActive">
										                  </tbody>
										                </table>
										              </div>
										            </div>
										          </div>
										        </div>
						                    </div>
                                </div>
                                <div id="tab-3" class="tab-pane">
                                			<div class="ibox">
						                        <div class="col-12">
										          <div class="card">
										            <div class="card-body px-0 pt-0 pb-2">
										              <div class="table-responsive p-0">
										                <table class="table align-items-center mb-0">
										                  <thead>
										                  </thead>
										                  <tbody id="joblistComplete">
										                  </tbody>
										                </table>
										              </div>
										            </div>
										          </div>
										        </div>
						                    </div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
           </div>
           </div>
      </div>
      <footer class="footer pt-3" style="display:none">
        <div class="container-fluid">
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
  <%@ include file="../include/importjs.jsp" %>
 <script>
	    load("#joblist",{
			target_user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			,status : 0
		});
	    load("#joblistActive",{
	    	target_user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			,status : 1
		});
	    loadlog("#joblistComplete",{
	    	target_user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			,status : 1
		});
    $(document).ready(function() {
    });
    function SetData(list,target){
    	$(target).empty();
    	$.each(list,function(index , item){
    		var imgurl = checknull(item.logo_img , "/resources/img/dangil_logo_big.png?ver=20210617");
    		var button = "";
    		 if(ifnull(item.today_job_status , -1) == -1){
    			 button = '<span class="btn btn-secondary" style="margin-bottom:0px" onclick="addJob('+item.seq+')">신청'	
             }else{
            	 if(ifnull(item.today_job_status , -1) == 0){
            		 button = '<span class="btn btn-info" style="cursor:pointer;margin-bottom:0px"  onclick="okJob('+item.seq+')">승인</span><span style="margin-left:10px;cursor:pointer;margin-bottom:0px" class="btn btn-danger" onclick="rejectJob('+item.seq+')">거절</span>'
            		// button = '<span class="btn btn-primary" style="margin-bottom:0px" onclick="cancelJob('+item.seq+')">승인대기</span>' 
            	 }else if(ifnull(item.today_job_status , -1) == 1){
            		// button = '<span class="btn btn-warning" style="margin-bottom:0px">승인</span>'
            		 button = "";
            		 button += '<a href="tel:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-bottom:0px"><i class="fa fa-phone"></i> 전화 </span>'
            		 button += '<a href="sms:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-left:5px;margin-bottom:0px"><i class="fa fa-envelope"></i> 문자 </span>'
            	 }else{
            		 button = '<span class="btn btn-warning" style="margin-bottom:0px">거절</span>'
            	 }
            	 button += '<a class="btn btn-primary" style="margin-bottom:0px;margin-left:5px" href="/view/userview/userdetail/'+item.seq+'">상세정보</a>'
             }
    		 $(target).append('<tr>'
                     + '<td>'
                     + '  <div class="d-flex px-3 py-1">'
                     + '<div>'
                     + '   <img src="'+imgurl+'" class="avatar me-3">'
                     + ' </div>'
                     + ' <div class="d-flex flex-column justify-content-center">'
                     + '   <h6 class="mb-0 text-sm">'+item.name+'</h6>'
                     + '   <p class="text-sm font-weight-bold text-secondary mb-0"><span class="text-success">'+getAge(item.regident_reg)+'</span> ('+getGender(item.regident_reg)+')</p>'
                     + ' </div>'
                     + '</div>'
                     + '</td>'
                     + '<td>'
                     + '<p class="text-sm font-weight-bold mb-0">'+getStar(logKey(item) , checknull(item.score,0) , item , false,"0px")+'</p>'
                     + '</td>'
                     + '<td class="align-middle text-center text-sm">'
                     + '<p class="text-sm font-weight-bold mb-0">'+new Date(item.log_create_date).format("yyyy-MM-dd hh:mm")+'</p>'
                     + '</td>'
                     + '<td class="align-middle text-end">'
                     + '<div class="d-flex px-3 py-1 justify-content-center align-items-center">'
                     +  button
                     + '</div>'
                     + '</td>'
                     + '</tr>')
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
    			 button = '<span class="btn btn-default" style="margin-bottom:0px" onclick="evalJob('+item.target_user_seq+','+item.user_seq+','+item.log_create_date+','+checknull(item.user_score,0)+',`'+checknull(item.user_log_text)+'`)">평가하기</span>'
    			 button += '<a class="btn btn-primary" style="margin-bottom:0px;margin-left:5px" href="/view/userview/userdetail/'+item.seq+'">상세정보</a>'
    			 $(target).append('<tr>'
                         + '<td>'
                         + '  <div class="d-flex px-3 py-1">'
                         + '<div>'
                         + '   <img src="'+imgurl+'" class="avatar me-3">'
                         + ' </div>'
                         + ' <div class="d-flex flex-column justify-content-center">'
                         + '   <h6 class="mb-0 text-sm">'+item.name+'</h6>'
                         + '   <p class="text-sm font-weight-bold text-secondary mb-0"><span class="text-success">'+getAge(item.regident_reg)+'</span> ('+getGender(item.regident_reg)+')</p>'
                         + ' </div>'
                         + '</div>'
                         + '</td>'
                         + '<td>'
                         + '<p class="text-sm font-weight-bold mb-0">'+getStar(logKey(item) , checknull(item.user_score,0) , item , false,"0px")+'</p>'
                         + '</td>'
                         + '<td class="align-middle text-center text-sm">'
                         + '<p class="text-sm font-weight-bold mb-0">'+new Date(item.log_create_date).format("yyyy-MM-dd hh:mm")+'</p>'
                         + '</td>'
                         + '<td class="align-middle text-end">'
                         + '<div class="d-flex px-3 py-1 justify-content-center align-items-center">'
                         +  button
                         + '</div>'
                         + '</td>'
                         + '</tr>')
    	});
    	if(list.length == 0){
    		$(target).append('<tr><td>조회된 데이터가 없습니다.</td></tr>');
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
    function evalJob(target_user_seq , user_seq , create_date , score , log_text){
    	initEvalStar(target_user_seq , user_seq , create_date , score);
    	$("#evalText").val(checknull(log_text));
    	$("#eval_modal").modal('show');
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
    						,contents : user_name+"님께서 작업요청을 승인하셨습니다."
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
    						,contents : user_name+"님께서 작업요청을 거절하셨습니다."
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
