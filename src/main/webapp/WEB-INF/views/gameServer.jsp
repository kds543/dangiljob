<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>플레이고고</title>
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
        <div class="modal inmodal fade" id="client_pop" tabindex="-1" role="dialog"  aria-hidden="true">
               <div class="modal-dialog modal-lg">
                       <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">게임서버추가</h4>
                                           
                                        </div>
                                        <div class="modal-body" style="width:100%;">
					             		    <form class="form-horizontal" >
					             		    	<div class="form-group row"><label class="col-sm-2 control-label">게임서버</label>
				                                    <div class="col-sm-10"><input type="text" class="form-control" id="serverNumber">
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                                 <div class="form-group row"><label class="col-sm-2 control-label">기본자원(음식,나무,돌(125%))1억당</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="default_resource">
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                                 <div class="form-group row"><label class="col-sm-2 control-label">금자원-1억당</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="gold_resource">
				                                </div>
				                                 </div>
					                              
					                	</form>
                                        </div>
 						 <div class="modal-footer">
					                 <button style="width:50px;margin-bottom:0px" type="button" data-dismiss="modal" class="btn btn-white"  >닫기</button>
					                 <button type="button" class="btn btn-primary" id="detail_btn" onclick="createClient()" >저장</button>
					     </div>     
                                       
                            </div>
                           
                  </div>
            </div>
            <div class="modal inmodal fade" id="d_pop" tabindex="-1" role="dialog"  aria-hidden="true">
               <div class="modal-dialog modal-lg">
                       <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            <h4 class="modal-title">자원관리</h4>
                                           
                                        </div>
                                        <div class="modal-body" style="width:100%;">
					             		    <form class="form-horizontal" >
					             		    	<div class="form-group row"><label class="col-sm-2 control-label">게임서버</label>
				                                    <div class="col-sm-10"><input type="text" class="form-control" id="update_serverNumber">
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                                 <div class="form-group row"><label class="col-sm-2 control-label">기본자원(음식,나무,돌(125%))1억당</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="update_default_resource">
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                                 <div class="form-group row"><label class="col-sm-2 control-label">금자원-1억당</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="update_gold_resource">
				                                </div>
				                                 </div>
					                	</form>
                                        </div>
 						 <div class="modal-footer">
					                 <button style="width:50px;margin-bottom:0px" type="button" data-dismiss="modal" class="btn btn-white"  >닫기</button>
					                 <button type="button" class="btn btn-primary" id="d_btn" onclick="d_update()" >저장</button>
					     </div>     
                                       
                            </div>
                           
                  </div>
            </div>
          <div class="wrapper wrapper-content animated fadeInRight">
	        <div class="row">
	        	<div class="col-lg-12">
	                <div class="panel panel-primary">
	                    <div class="panel-heading">
	                        <h5>게임서버관리</h5>
	                        <div class="ibox-tools">
	                        	<button class="btn btn-success" style="margin-top:-5px;display:none" id="d_pop_btn" data-toggle="modal" data-target="#d_pop">게임서버추가</button>
	                        	<button class="btn btn-success" style="margin-top:-5px" data-toggle="modal" data-target="#client_pop" id="client_pop_btn">게임서버추가</button>
                       	 	</div>
	                    </div>
	                    <div class="panel-body">
	                    <div class="row">
	                       <table class="table table-striped table-hover datatable-cls" style="border-collapse:collapse !important;width:100%;text-align: center"  id="datatable" style="width:100%;" >
				                    <thead>
				                    <tr>
				                    	<th style='min-width:120px;'>게임서버</th>
				                    	<th>기본자원(음식,나무,돌(75%))1억당</th>
				                    	<th>금자원-1억당</th>
				                    	<th>수정</th>
				                    	<th>삭제</th>
				                    </tr>
				                    </thead>
				                    <tbody>
				                    </tbody>
				              </table>
				        </div>
				        <div class="row">
				        </div>
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
$(document).ready(function() {
    
	datatables = $('#datatable').DataTable({
        dom: '<"html5buttons"B>fitp',
        "columnDefs": [
        	{
            	'targets': 3,
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta){
                    return '<center><button class="btn btn-primary" onclick="modyclient('+data+')">수정</button></center>';
                }
            },{
            	'targets': 4,
                'searchable': false,
                'orderable': false,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta){
                    return '<center><button class="btn btn-primary" onclick="del('+data+')">삭제</button></center>';
                }
            }
		],
		language : lang_kor,
        "ordering": true,
        order : [[0,"desc"]],
        info : false,
        "fixedHeader":true,
        "scrollX": true,
        autoWidth : true,
        fixedColumns: true,
        responsive: true,
        "ScrollCollapse": true,
        buttons: [
       //     { extend: 'copy'},
       //     {extend: 'csv'},
            
      //      {extend: 'pdf', title: 'ExampleFile'},
        ]

    });
    
    
    load();
  });
function pageLengChange(){
	$("#cnt_100_btn").removeClass("btn-primary");
	$("#cnt_100_btn").removeClass("btn-white");
	if(pageCnt == 100){
		$("#cnt_100_btn").addClass("btn-white");	
		pageCnt = 10;
	}else{
		$("#cnt_100_btn").addClass("btn-primary");
		pageCnt = 100;
	}
	datatables.page.len( pageCnt ).draw()
}
function del(seq){
	Kconfirm("게임서버를 삭제하시겠습니까?","",function(){
		Kajax("/action/deleteGameServer",{
			seq : seq
		},function(res){
			if(res.success){
				Kalert("삭제가 완료되었습니다.","",function(){
					load();
				})
			}
		})	
	})
}
function createClient(){
	Kajax("/action/createGameServer",{
		server_name : $("#serverNumber").val()
		,Default_Resource : uncomma($("#default_resource").val())
		,Gold_Resource : uncomma($("#gold_resource").val())
	},function(res){
		if(res.success){
			$("#client_pop_btn").trigger("click");
			Kalert("게임서버가 생성되었습니다.","",function(){
				load();
			})
		}
	})
}
var current_seq = 0;
function modyclient(seq){
	current_seq = seq;
	Kajax("/action/getServeItem",{
		seq : seq
	},function(res){
		if(res.success){
			$("#update_serverNumber").val(res.rows.server_name);
			$("#update_default_resource").val(comma(res.rows.Default_Resource));
			$("#update_gold_resource").val(comma(res.rows.Gold_Resource));
			$("#d_pop_btn").trigger("click");
		}
	})
}
function d_update(){
	Kajax("/action/updateServerItem",{
		food : uncomma($("#update_default_resource").val())
		,wood : uncomma($("#update_gold_resource").val())
		,server_name : $("#update_serverNumber").val()
		,seq : current_seq
	},function(res){
		if(res.success){
			$("#d_pop_btn").trigger("click");
			load();
		}
	})
}
function checkboxall(){
    // Check/uncheck checkboxes for all rows in the table
   $('input[name=datatablecheckbox]').prop('checked', $("#checkboxall1_btn").is(":checked"));
   $("#checkboxall2_btn").prop("checked", $("#checkboxall1_btn").is(":checked"));
}
function load(){
	datatables.clear().draw();
	Kajax("/action/getGameServer",{},
			function(res){
		if(res.success){
			$.each(res.rows , function(index, item){
				datatables.row.add( [
	    			item.server_name
	    			,numberWithCommas(item.Default_Resource,true)
	    			,numberWithCommas(item.Gold_Resource,true)
	    			,item.seq
	    			,item.seq
	            	]);
			})
		}
		datatables.row().draw(true);
	})
	
}
</script>
</body>
</html>
