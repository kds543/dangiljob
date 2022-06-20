<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<button class="btn btn-primary memberCnt" id="memberCountBottom" onclick="$('#modal_memberviewPop').modal('show')" style="font-size: 17px; font-weight: bold; cursor: pointer; display: block; border: 0px; position: absolute; left: 50%; width: 40px; border-radius: 12px; bottom: 31px; z-index: 10; height: 40px;"></button>
<div class="modal inmodal fade"  id="modal_memberviewPop" style="" tabindex="-1"  role="dialog"  aria-hidden="true">
				  <div class="modal-dialog modal-lg" style="width:100%;min-width:360px;padding-right:15px;height:100%">
				              <div class="modal-content" style="display:block;">
			                       <div class="modal-body" style="width:100%;padding:0px">
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
                            <span class="float-right small text-muted" style="font-size:120%;font-weight:bold" ><l class="memberCnt"></l>명</span>
                            <ul class="nav nav-tabs">
                                <li><a class="nav-link active" data-toggle="tab"><i class="fa fa-user"></i>회원리스트</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active">
                                    <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto;"><div class="full-height-scroll" style="overflow: hidden; width: auto;">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover">
                                                <tbody id="modalmemberviewlistbox">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 366.599px;"></div><div class="slimScrollRail" style="width: 7px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
			                            </div>
			                            	<div class="modal-footer">
									                                            <button type="button" class="btn btn-white" data-dismiss="modal">닫기</button>
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
			            		 if(ifnull(item.today_job_status , -1) == -1){
			            			 button = '<td class="client-status"><span class="label label-default" onclick="addJob('+item.seq+')">신청</span></td>'	
                                 }else{
                                	 if(ifnull(item.today_job_status , -1) == 0){
                                		 button = '<td class="client-status"><span class="label label-info" onclick="cancelJob('+item.seq+')">승인대기</span></td>' 
                                	 }else if(ifnull(item.today_job_status , -1) == 1){
                                		 button = '<td class="client-status"><span class="label label-primary">승인</span></td>'
                                	 }else{
                                		 button = '<td class="client-status"><span class="label label-danger">거절</span></td>'
                                	 }
                                	 
                                 }
			            		$("#modalmemberviewlistbox").append('<tr>'
                                        + '<td class="client-avatar" style="padding-left:25px;border-radius:0px;min-width:80px"><a href=""><img style="border-radius:0px" alt="image" src="'+imgurl+'"></a> </td>'
                                        + '<td style="min-width:125px"><a href="#contact-4" class="client-link">'+item.name+'</a><l style="margin-left:5px">('+getGender(item.regident_reg)+')</l><br>'+getAge(item.regident_reg)+'</td>'
                                        + '<td style="width:100px;min-width:100px">'+getStar(item.seq , checknull(item.score,0) , item , false)+'</td>'
                                        + '<td class="contact-type"><i class="fa fa-envelope"> </i></td>'
                                        + '<td> '+item.email+'</td>'
                                        + button
                                        + '</tr>')
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