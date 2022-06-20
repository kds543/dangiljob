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
	 	.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
		    border-top: 1px solid #e7eaec;
		    line-height: 1.42857;
		    padding: 8px;
		    vertical-align: top;
		    text-align: right;
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
                                            <h4 class="modal-title">클라이언트추가</h4>
                                           
                                        </div>
                                        <div class="modal-body" style="width:100%;">
					             		    <form class="form-horizontal" >
					             		    	<div class="form-group row"><label class="col-sm-2 control-label">물리서버</label>
				                                    <div class="col-sm-10"><input type="text" class="form-control" id="m_server">
				                                    
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                              
				                                 <div class="form-group row"><label class="col-sm-2 control-label">계정</label>
				                                    <div class="col-sm-10"><input type="password" class="form-control" id="user_id">
				                                   
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                                 <div class="form-group row"><label class="col-sm-2 control-label">게임서버</label>
				                                    <div class="col-sm-10"><select class="form-control game_server" id="game_server"> </select>
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
					             		    	<div class="form-group row"><label class="col-sm-2 control-label">식량</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="food">
				                                    
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                              
				                                 <div class="form-group row"><label class="col-sm-2 control-label">나무</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="wood">
				                                   
				                                </div>
				                                 </div>
				                                <div class="hr-line-dashed"></div>
				                                 <div class="form-group row"><label class="col-sm-2 control-label">석재</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="stone">
				                                </div>
				                                 </div>
				                                 <div class="hr-line-dashed"></div>
				                                 <div class="form-group row"><label class="col-sm-2 control-label">골드</label>
				                                    <div class="col-sm-10"><input type="text" onkeyup="numberWithCommastext(this)" class="form-control" id="gold">
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
	                        <h5>클라이언트</h5>
	                        <div class="ibox-tools">
                       	 	</div>
	                    </div>
	                    <div class="panel-body">
	                    <div class="row">
	                       <table class="table table-striped table-hover datatable-cls" style="border-collapse:collapse !important;width:100%;text-align: center"  id="datatable" style="width:100%;" >
				                    <thead>
				                    <tr>
				                    	<th style='min-width:120px;'>클라이언트넘버</th>
				                    	<th style='min-width:120px;'>게임서버</th>
				                    	<th>앱플레이어넘버</th>
				                    	<th>계정</th>
				                    	<th>식/목/석/금화</th>
				                    	<th>자원별금액</th>
				                    	<th>금액</th>
				                    	<th>실결제금액</th>
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
	Kajax("/action/getGameServer",{}
	,function(res){
		if(res.success){
			var dump ="";
			$.each(res.rows,function(index , item){
				dump += '<option value="'+item.seq+'">'+item.server_name+'</option>';
			});
			$(".game_server").append(dump);
		}
	})
    
    
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
function noticeDel(){
	Kconfirm("공지사항을 삭제하시겠습니까?","",function(){
		updatecnt = 0;
		for (var i = 0 ; i < $('input[name=datatablecheckbox]:checked').length; i++){
    		Kajax("/manager/action/noticeDel",{
    			seq : $($('input[name=datatablecheckbox]:checked')[i]).val()
    			,update_id : user_id
    		},function(res){
    			if(res.success){
    				
    			}
    			if(updatecnt+1 >= $('input[name=datatablecheckbox]:checked').length){
    				Kalert("공지사항이 삭제가 완료되었습니다.","",function(){
    					location.href = location.href;
    				})
    			}
    			updatecnt++;
    		})
    	}
	})
}
function createClient(){
	Kajax("/action/createClient",{
		m_server : $("#m_server").val()
		,id : $("#user_id").val()
		,game_server : $("#game_server option:selected").val()
	},function(res){
		if(res.success){
			$("#client_pop_btn").trigger("click");
			Kalert("클라이언트가 생성되었습니다.","",function(){
				load();
			})
		}
	})
}
function del(seq){
	Kconfirm("삭제하시겠습니까?","",function(){
		Kajax("/action/deleteClient",{
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
var current_seq = 0;
function modyclient(seq){
	current_seq = seq;
	Kajax("/action/getClientItem",{
		seq : seq
	},function(res){
		if(res.success){
			$("#food").val(comma(res.rows.food));
			$("#wood").val(comma(res.rows.wood));
			$("#stone").val(comma(res.rows.stone));
			$("#gold").val(comma(res.rows.gold));
			$("#d_pop_btn").trigger("click");
		}
	})
}
function d_update(){
	Kajax("/action/updateResources",{
		food : uncomma($("#food").val())
		,wood : uncomma($("#wood").val())
		,stone: uncomma($("#stone").val())
		,gold : uncomma($("#gold").val())
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
	Kajax("/action/getClient",{},
			function(res){
		if(res.success){
			$.each(res.rows , function(index, item){
				datatables.row.add( [
					item.seq
					,item.server_name
					,item.app_player
					,item.id
	    			,numberWithCommas(item.food,true) + " / "+numberWithCommas(item.wood,true)+" / "+numberWithCommas(item.stone,true) +" / "+numberWithCommas(item.gold,true)
	    			,numberWithCommas(Calc(item.food,item.Default_Resource),true) + " / "+numberWithCommas(Calc(item.wood,item.Default_Resource),true)+" / "+numberWithCommas(Calc(item.stone,item.Default_Resource*1.25),true) +" / "+numberWithCommas(Calc(item.stone,item.Gold_Resource),true)
	    			,numberWithCommas((Calc(item.food,item.Default_Resource)+Calc(item.wood,item.Default_Resource)+Calc(item.stone,item.Default_Resource*1.25)+Calc(item.stone,item.Gold_Resource)),true)
	    			,numberWithCommas(Math.round((Calc(item.food,item.Default_Resource)+Calc(item.wood,item.Default_Resource)+Calc(item.stone,item.Default_Resource*1.25)+Calc(item.stone,item.Gold_Resource))),true)
	            	]);
			})
		}
		datatables.row().draw(true);
		
	})
	
}

function Calc(value , def)
{
	return Math.round(value / 100000000 * def);
}
</script>
</body>
</html>
