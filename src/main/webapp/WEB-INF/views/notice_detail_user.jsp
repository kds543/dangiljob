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
	  .note-editable.panel-body {
            min-height:300px;
    }
	 </style>
</head>

<body class="skin-3 fixed-sidebar">
    <div id="wrapper">
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
           <div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    <h2><strong><%=String.valueOf(request.getAttribute("page_name"))%></strong></h2>
                   
                </div>
                <div class="col-lg-2">

                </div>
            </div>
            <input type="file" name="uploadfile" id="fileuselect" style="display:none;" onchange="loadFile(this)">
          <div class="wrapper wrapper-content animated fadeInRight" style="height:80%;margin-left:10px;margin-right:10px;-webkit-overflow-scrolling:touch;">
	        <div class="row">
	        		<div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h5><%=String.valueOf(request.getAttribute("page_name"))%></h5>
                        </div>
                        <div class="panel-body">
                       <form class="form-horizontal" onsubmit="return false">
		                                <div class="form-group row row"><label class="col-lg-1 control-label">??????</label>
		
		                                    <div class="col-lg-11"><input type="text" id="title" placeholder="" class="form-control" readonly="readonly"> 
		                                    <!-- <span class="help-block m-b-none">Example block-level help text here.</span> -->
		                                    </div>
		                                </div>
		                                <div class="row">
		                                 <div class="ibox-content no-padding" style="overflow:hidden;width:100%;margin-left:20px;margin-right:20px;border:1px solid #e5e6e7">
		                                	 <div class="summernote" disable id="summernote" style="min-height:300px" >
					                        </div>
					                        </div>
		                				</div>                
		                </form>
		                
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
    
//	$("#profile_name").text(user_name+"("+type+")");
//	$("#profile_center").text(center_name);
        $(document).ready(function() {
        	
           	initview();

        
        });
        var c_seq = <%=String.valueOf(request.getAttribute("c_seq"))%>
        function initview(){
        	Kajax("/action/getNoticeItem",{
        		seq : c_seq
        	},function(res){
        		if(res.success){
        			$("#title").val(res.rows["title"]);
        			$("#summernote").html(res.rows["contents"]);
        		}
        	})
        }
        
    </script>
</body>
</html>
