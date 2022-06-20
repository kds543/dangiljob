<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<button class="btn btn-primary memberCnt" id="memberCountBottom" onclick="$('#modal_memberviewPop').modal('show')" style="font-size: 17px; font-weight: bold; cursor: pointer; display: block; border: 0px; position: absolute; left: 50%; border-radius: 12px; bottom: 15px; z-index: 10;"></button>
<div class="modal inmodal fade"  id="modal_memberviewPop" class="bg-gray-100" tabindex="-1"  role="dialog"  aria-hidden="true">
				  <div class="modal-dialog modal-lg" style="width:100%;min-width:400px;padding-right:15px;height:100%">
				              <div class="modal-content" style="display:block;">
			                       <div class="modal-body" style="width:100%;padding:0px">
						                       <div class="ibox">
						                        <div class="col-12">
										          <div class="card">
										            <div class="card-header pb-0 p-3">
										              <h6>회원리스트</h6>
										            </div>
										            <div class="card-body px-0 pt-0 pb-2">
										              <div class="table-responsive p-0">
										                <table class="table align-items-center mb-0">
										                  <tbody id="modalmemberviewlistbox">
										                   
										                  </tbody>
										                </table>
										              </div>
										            </div>
										          </div>
										        </div>
						                    </div>
			                            </div>
			                            	<div class="modal-footer">
	                                            <button type="button" class="btn btn-white" onclick="$('#modal_memberviewPop').modal('hide')">닫기</button>
	                                        </div>
				                  </div>
			            </div>
			            <script type="text/javascript">
			            var modalmemberlist = null;
			            function modalSetData(list){
			            	modalmemberlist = list;
			            	$("#modalmemberviewlistbox").empty();
			            	$.each(modalmemberlist,function(index , item){
			            		var imgurl = checknull(item.logo_img , "/resources/img/dangil_logo_big.png?ver=20210617");
			            		var button = "";
			            		 
			            			 if(item.type == "A01"){
			            				 if(ifnull(item.today_job_status , -1) == -1){
			    	            			 button = ''	
			                            }else if(ifnull(item.today_job_status , -1) == 1){
			                            	button += '<a href="tel:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-bottom:0px"><i class="fa fa-phone"></i> 전화 </span>'
			                       		 	button += '<a href="sms:'+item.phone_number+'" class="btn btn-success" style="padding: 3px 16px;cursor:pointer;margin-left:5px;margin-bottom:0px"><i class="fa fa-envelope"></i> 문자 </span>'
			                            }else if(ifnull(item.today_job_status , -1) == 0){
			                            	button = '<span class="btn btn-info" style="cursor:pointer;margin-bottom:0px"  onclick="okJob('+item.seq+')">승인</span><span style="margin-left:10px;cursor:pointer;margin-bottom:0px" class="btn btn-danger" onclick="rejectJob('+item.seq+')">거절</span>' 
			                            }else{
			                            	button = '<span class="btn btn-warning" style="margin-bottom:0px">거절되셧습니다.</span>'
			                            }
			            				 $("#modalmemberviewlistbox").append('<tr>'
							                      + '<td>'
							                + '<div style="padding: 20px;border: 1px solid;border-radius: 11px;">'      
			            	                + '<div class="d-flex">'
			            	                + '<div class="avatar avatar-xl bg-gradient-dark border-radius-md p-2">'
			            	                + '   <img src="'+imgurl+'" alt="slack_logo">'
			            	                + ' </div>'
			            	                + '  <div class="ms-3 my-auto">'
			            	                + '    <h6>'+item.name+'</h6>'
			            	                + '    <div class="avatar-group">'
			            	                + getStar(item.seq , checknull(item.score,0) , item , false,"0px")
			            	                + '    </div>'
			            	                + '  </div>'
			            	                + '  <div class="ms-auto">'
			            	                + '    <div class="dropdown">'
			            	                + '      <button class="btn btn-link text-secondary ps-0 pe-2" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
			            	                + '       <i class="fa fa-ellipsis-v text-lg" aria-hidden="true"></i>'
			            	                + '     </button>'
			            	                + '     <div class="dropdown-menu dropdown-menu-end me-sm-n4 me-n3" aria-labelledby="navbarDropdownMenuLink">'
			            	                + '       <a class="dropdown-item" href="/view/userdetail/'+item.seq+'">상세정보</a>'
			            	                + '     </div>'
			            	                + '   </div>'
			            	                + ' </div>'
			            	                + '</div>'
			            	                + ' <p class="text-sm mt-3">'+checknull(item.onelinetext,"입력된 메시지가 없습니다.")+'</p>'
			            	                + '  <hr class="horizontal dark">'
			            	                + ' <div class="row">'
			            	                + '   <div class="col-6">'
			            	                + '     <h6 class="text-sm mb-0" style="margin-left:5px">'+getAge(item.regident_reg)+'('+getGender(item.regident_reg)+')</h6>'
			            	                + '   <span class="badge bg-gradient-info ms-auto float-end" style="float:left !important">'+checknull(item.sigungu)+'</span>'
			            	                + '  </div>'
			            	                + '  <div class="col-6 text-end">'
			            	                + button
			            	                + '   </div>'
			            	                + ' </div>'
			            	                + '</div>'
			            	                + '</div>'
			            	                + '</div>'
						                    + '</td>'
						                    + '</tr>')
				            			
				            		 }else{
				            			 if(ifnull(item.today_job_status , -1) == -1){
					            			 button = '<span class="btn btn-secondary" style="margin-bottom:0px" onclick="addJob('+item.seq+')">신청'	
		                                 }else{
		                                	 if(ifnull(item.today_job_status , -1) == 0){
		                                		 button = '<span class="btn btn-primary" style="margin-bottom:0px" onclick="cancelJob('+item.seq+')">승인대기</span>' 
		                                	 }else if(ifnull(item.today_job_status , -1) == 1){
		                                		 button = '<span class="btn btn-success" style="margin-bottom:0px">승인</span>'
		                                	 }else{
		                                		 button = '<span class="btn btn-warning" style="margin-bottom:0px">거절</span>'
		                                	 }
		                                 }
				            			 $("#modalmemberviewlistbox").append('<tr>'
									                + '<td>'
									                + '<div style="padding: 20px;border: 1px solid;border-radius: 11px;">'      
					            	                + '<div class="d-flex">'
					            	                + '<div class="avatar avatar-xl bg-gradient-dark border-radius-md p-2">'
					            	                + '   <img src="'+imgurl+'" alt="slack_logo">'
					            	                + ' </div>'
					            	                + '  <div class="ms-3 my-auto">'
					            	                + '    <h6>'+item.name+'</h6>'
					            	                + '    <div class="avatar-group">'
					            	                + getStar(item.seq , checknull(item.score,0) , item , false,"0px")
					            	                + '    </div>'
					            	                + '  </div>'
					            	                + '  <div class="ms-auto">'
					            	                + '    <div class="dropdown">'
					            	                + '      <button class="btn btn-link text-secondary ps-0 pe-2" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'
					            	                + '       <i class="fa fa-ellipsis-v text-lg" aria-hidden="true"></i>'
					            	                + '     </button>'
					            	                + '     <div class="dropdown-menu dropdown-menu-end me-sm-n4 me-n3" aria-labelledby="navbarDropdownMenuLink">'
					            	                + '       <a class="dropdown-item" href="/view/userview/userdetail/'+item.seq+'">상세정보</a>'
					            	                + '     </div>'
					            	                + '   </div>'
					            	                + ' </div>'
					            	                + '</div>'
					            	                + ' <p class="text-sm mt-3">'+checknull(item.onelinetext,"입력된 메시지가 없습니다.")+'</p>'
					            	                + '  <hr class="horizontal dark">'
					            	                + ' <div class="row">'
					            	                + '   <div class="col-6">'
					            	                + '     <h6 class="text-sm mb-0"  style="margin-left:5px">'+getAge(item.regident_reg)+'('+getGender(item.regident_reg)+')</h6>'
					            	                + '   <span class="badge bg-gradient-info ms-auto float-end" style="float:left !important">'+checknull(item.sigungu)+'</span>'
					            	                + '  </div>'
					            	                + '  <div class="col-6 text-end">'
					            	                + button
					            	                + '   </div>'
					            	                + ' </div>'
					            	                + '</div>'
					            	                + '</div>'
					            	                + '</div>'
								                    + '</td>'
								                    + '</tr>')
				            		 }
			            	});
			            }
			            function cancelJob(seq){
			            	Kconfirm("작업요청을 취소하시겠습니까?","",function(){
			            		Kajax("/action/cancelJob",{
			            			target_user_seq : seq
			            			,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
			            		},function(res){
			            			if(res.success){
			            				Ktoast({text:"작업요청이 취소되었습니다."});
			            				load();
			            			}
			            		})
			            	},null,true);
			            }
			            function callNumber(url,type){
			            	if(type == 0){
			            		location.href = "tel:"+url;	
			            	}else{
			            		location.href = "sms:"+url;
			            	}
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
			            function addJob(seq){
			            	Kconfirm("작업을 요청하시겠습니까?","",function(){
			            		Kajax("/action/addJob",{
				            		target_user_seq : seq
				            		,user_seq : <%=String.valueOf(request.getAttribute("user_seq"))%>
				            	},function(res){
				            		if(res.success){
				            			Ktoast({text : "작업요청이 완료되었습니다."});
				            			load();
				            		}
				            	})
			            	},null,true);
			            }
			            </script>
		  </div>