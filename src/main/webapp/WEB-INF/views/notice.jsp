<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>개인정보보호정책</title>
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
          <div class="wrapper wrapper-content animated fadeInRight">
	        <div class="row">
	        	<div class="col-lg-12">
	                <div class="panel panel-primary">
	                    <div class="panel-heading">
	                        <h5><%=String.valueOf(request.getAttribute("page_name"))%></h5>
	                        <div class="ibox-tools" style="top:10px;right:30px">
                       	 	</div>
	                    </div>
	                    <div class="panel-body">
	                    <div class="row">
	                       <table class="table table-striped table-hover datatable-cls" style="border-collapse:collapse !important;width:100%;text-align: center"  id="datatable" style="width:100%;" >
				                    <thead>
				                    <tr>
				                    	<th style='min-width:120px;width:20%' >등록일</th>
				                    	<th style='width:80%' >제목</th>
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
    
    
    $('#datatable tbody').on('click', 'td', function () {
		if(datatables.cell(this).index().columnVisible != 4){
			location.href = "/view/notice_detailU/"+datatables.row( this ).data()[3];
			return;
		}
	
    } );
    
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
function checkboxall(){
    // Check/uncheck checkboxes for all rows in the table
   $('input[name=datatablecheckbox]').prop('checked', $("#checkboxall1_btn").is(":checked"));
   $("#checkboxall2_btn").prop("checked", $("#checkboxall1_btn").is(":checked"));
}
function load(){
	datatables.clear().draw();
	Kajax("/action/getNotice",{},
			function(res){
		for(var i = 0 ; i < res.rows.length; i++){
			datatables.row.add( [
    			new Date(res.rows[i]["create_date"]).format("yyyy-MM-dd"),
    			checknull(res.rows[i]["title"]),
    			checknull(res.rows[i]["contents"]),
    			res.rows[i]["seq"]
            	]);
		}
		datatables.row().draw(true);
		
	})
	
}
</script>
</body>
</html>
