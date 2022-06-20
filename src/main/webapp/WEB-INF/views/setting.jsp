<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title><%=String.valueOf(request.getAttribute("system_name"))%></title>
	 <%@ include file="include/importcss.jsp" %>
	  <style>
	 	td {
	 		text-indent:-10px;
	 		text-align: center;
	 	}
	 </style>
</head>

<body class="skin-3 fixed-sidebar">
    <div id="wrapper" style="overflow-y:hidden">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <%@ include file="include/head.jsp" %>
                     <%@ include file="include/left.jsp" %>
                </ul>

            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
        
          
<%@ include file="include/head2.jsp" %>
       
        </div>
          <div class="wrapper wrapper-content animated fadeInRight" style="min-width:250px">
          <div class="row">
           <div class="col-lg-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-title">
                            <h5>환경설정<small style="margin-left: 5px">&nbsp;&nbsp;알림을 받고자 하는 기준치를 작성해주시면 됩니다.

                            </small></h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                                <a class="close-link">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content">
                        <form method="get" class="form-horizontal">
                        	   <div class="form-group row"><label class="col-sm-2 control-label">단위</label>
                                    <div class="col-sm-10"><select class="form-control m-b" id="type">
                                    	<option value="0">1돈(3.75g)</option>
                                    	<option value="1">1g</option>
                                    </select>
                                    <span class="form-text m-b-none">구매를 희망하시는 금액을 적어주세요</span></div>
                                </div>
                      		   <div class="form-group row"><label class="col-sm-2 control-label">순금구매</label>
                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="buypuregold">
                                    <span class="form-text m-b-none">구매를 희망하시는 금액을 적어주세요</span></div>
                                    
                                </div>
                                <div class="hr-line-dashed"></div>
                              
                                 <div class="form-group row"><label class="col-sm-2 control-label">순금판매</label>
                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="sellpuregold">
                                     <span class="form-text m-b-none">판매를 희망하시는 금액을 적어주세요</span></div>
                                   
                                </div>
                                 <div class="form-group row"><label class="col-sm-2 control-label">매일시세받기</label>
                                    <div class="col-sm-10"><input type="checkbox" value="1" id="allday"></div>
                                </div>
                                 
                        </form>
					                          <button type="button" class="btn btn-primary" onclick="checksave()" >저장</button>
                        </div>
                      </div>
           </div>
           </div>
			</div>
         <div class="footer">
                    <div class="pull-right">
                    </div>
                   <%@ include file="include/bottom.jsp" %>
                </div>
        </div>
   </div>
    <!-- Mainly scripts -->
    
    <%@ include file="include/importjs.jsp" %>

    <script>
    	var device_code ="";
        $(document).ready(function() {
			
           	initview();

        
        });
        var datatables;
        function initview(){
        	try{
        		window.JLGame.deviceCall();
        	}catch(error){
        		
        	}
        	
        	//load();
        }
        function deviceInfoCall(device_cd){
        	device_code = device_cd;
        	load();
        }
        function gd(year, month, day) {
            return new Date(year, month - 1, day).getTime();
        }
        var puregoldbuydata = [];
        var puregoldselldata = [];
        function load(){
        	Kajax("/action/settingInfoLoad",{
        		device_code : device_code
        	},function(res){
        		if(res.success){
        			$("#buypuregold").val(comma(checknull(res.rows["buypuregold"])));
        			$("#sellpuregold").val(comma(checknull(res.rows["sellpuregold"])));
        			$("#type").val(res.rows["type"]).change();
        			$("#allday").attr("checked" , (res.rows["all_day"] == "1" ? true : false));
        		}
        	})
        }
        
      	function checksave(){
      		Kajax("/action/deviceUpdate",{
      			device_code : device_code
      			,buypuregold : uncomma($("#buypuregold").val())
      			,sellpuregold :uncomma($("#sellpuregold").val())
      			,all_day : ($('#allday').is(':checked') ? "1" : "0")
      			,type : $("#type option:selected").val()
      		},function(res){
      			if(res.success){
      				Kalert("저장이 완료되었습니다.","",function(){
      					location.href = location.href;	
      				})
      				
      			}
      		})
      	}
    </script>
</body>
</html>
