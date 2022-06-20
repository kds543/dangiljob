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
          <div class="wrapper wrapper-content animated fadeInRight" style="height:80%">
	        <div class="row">
	        		<div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h5><%=String.valueOf(request.getAttribute("page_name"))%></h5>
                        </div>
                        <div class="panel-body">
                       <form class="form-horizontal" onsubmit="return false">
		                                <div class="form-group row row"><label class="col-lg-1 control-label">제목</label>
		
		                                    <div class="col-lg-11"><input type="text" id="title" placeholder="" class="form-control"> 
		                                    <!-- <span class="help-block m-b-none">Example block-level help text here.</span> -->
		                                    </div>
		                                </div>
		                                <div class="row">
		                                 <div class="ibox-content no-padding" style="overflow:hidden;width:100%;margin-left:20px;margin-right:20px;border:1px solid #e5e6e7">
		                                	 <div class="summernote" id="summernote" style="min-hegith:300px" >
					                        </div>
					                        </div>
		                				</div>                
		                </form>
		                <div class="row">
		                	<input type="radio" name="rd" checked value="0" id="ch1">예약</input>
		                	<input type="radio" name="rd" value="1" id="ch2">직접</input>
		                	<input type="radio" name="rd" value="2" id="ch3">미알람</input>
		                </div>
                         <button class="btn btn-primary" style="margin-left:auto;display:flex;margin-top:10px" onclick="noticeInsert()">  공지사항등록</button>
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
        function noticeInsert(){
        	if($("#title").val() == ""){
				Ktoast({
					text : "제목은 필수 항목입니다."
					,type : 3
				})
				return;
			}
			Kajax("/action/noticeInsert",{
				update_id : user_id
				, title : $("#title").val()
				, contents : $("#summernote").summernote("code")
				, type : "공지"
				, notices : $(":input:radio[name=rd]:checked").val()
			},function(res){
				if(res.success){
					Kalert("공지사항이 등록되었습니다.","",function(){
						history.back();
					},{type:"info"})
				}else{
					return false;
				}
			})
        }
        
        var file_name;
        var file_url;
        function loadFile(input){
    		var formData = new FormData();
    		
    		for(var i = 0 ; i < $("input[name=uploadfile]").length; i++){
    			formData.append("uploadfile0",$("input[name=uploadfile]")[i].files[0]);
    		}
    		
    		
    		 $.ajax({
    	         url: '/food/1/1/karma1193/1732',
    	         processData: false,
    	             contentType: false,
    	         data: formData,
    	         dataType : "json",
    	         type: 'POST',
    	         success: function(result){
    	             if(result.success){
    	            	 file_url = result.rows[0]["fileurl"];
    	            	 file_name =  result.rows[0]["filename"];
    	            	 $("#fileurl").val(file_name)
    	             }
    	         }
    	     });
    		
    	}
        function type_list_click(){
        	$("#type_list_additem_btn").trigger("click");
        }
        function typeListAdd(){
        	Kajax("/manager/typeListAdd",{
        		title : $("#typeList_title").val()
        		,contents : $("#typeList_contents").html()
        	},function(){
        		$("#typeList_title").val("")
        		$("#typeList_contents").html("")
        		Kalert("리스트안내가 추가되었습니다.");
        		$("#type_list_additem_btn").trigger("click");
        		typelistload();
        	})
        }
        function initview(){
        	$('.summernote').summernote({
        		tooltip : false,
        		height : "auto" ,
        		lang: 'ko-KR',
        		minHeight : 300,
        		 callbacks: {
        		        onImageUpload: function(image) {
        		        	sendFile(image[0]);
        		        }
        		    }
        	});
        	
        }
        function sendFile(file) {
            data = new FormData();
            data.append("uploadfile0", file);
            $.ajax({
            	 url: '/food/1/1/1/karma1193/1732',
    	         processData: false,
    	             contentType: false,
    	         data: data,
    	         dataType : "json",
    	         type: 'POST',
                success: function(result) {
                	if(result.success){
                		 $('#summernote').summernote("insertImage", "/imgs/"+result.rows[0]["fileurl"]);
                	}
                		
                    
                }
            });
        }
    </script>
</body>
</html>
