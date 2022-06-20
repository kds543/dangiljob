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
	                        <h5>메이플스토리</h5>
	                        <div class="ibox-tools">
                       	 	</div>
	                    </div>
	                    <div class="panel-body">
	                    <div class="row">
	                       <table class="table table-striped table-hover datatable-cls" style="border-collapse:collapse !important;width:100%;text-align: center"  id="datatable" style="width:100%;" >
				                    <thead>
				                    <tr>
				                    	<th style='min-width:120px;'>물리서버</th>
				                    	<th>게임플레이어</th>
				                    	<th>아이디</th>
				                    	<th>생성일자</th>
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
function load(){
	datatables.clear().draw();
	Kajax("/action/getLog",{},
			function(res){
		if(res.success){
			$.each(res.rows , function(index, item){
				datatables.row.add( [
	    			item.m_server
	    			,item.app_server
	    			,item.id
	    			,new Date(item.create_date).format("yyyy-MM-dd HH:mm")
	            	]);
			})
		}
		datatables.row().draw(true);
	})
	
}
</script>
</body>
</html>
