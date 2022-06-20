<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<li class="nav-header" style="background-color: white;background-image: none;">
                        <div class="dropdown profile-element"> <span>
                         <center><img alt="image" style="border: 0px solid gold;height:80px;width:95px" src="/resources/img/logo.png?ver=20210617" /></center>
                         </span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a href="javascript:location.href='/manager/view/setting'">설정</a></li>
                               
                                <li class="divider"></li>
                                <li><a href="javascript:logout()">Logout</a></li>
                            </ul>
                        </div>
                       
                        <div class="logo-element" >
                            	당
                        </div>
                    </li>
<script src="/resources/js/jquery-3.1.1.min.js"></script>   
                  
                    <!-- Sweet Alert -->
                     <!-- Sweet alert -->
 
<style>
.sweet-alert h2{font-size:19px}
</style>
<script>

var scrollBl = true;
var user_id = '<%=String.valueOf(request.getAttribute("user_id"))%>';
var type = '<%=String.valueOf(request.getAttribute("type"))%>';
var jobtype = '<%=String.valueOf(request.getAttribute("jobtype"))%>';
var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
var menu_p = '<%=String.valueOf(request.getAttribute("menu"))%>'
$(function(){
	if(!isMobile)
	{
		$(".footer").css("display","none");
	}else{
		$(".footer").css("display","none");
	//	$("#"+menu_p).removeClass("active");
		
	}
	try{
		if(menu_p != "menu_4")window.JLGame.onload();	
	}catch(err){
		
	}
    
});

function loading(bool){
	if(bool){
		 $("#loading")
		    .css("z-index","10001")
		    .css("top",$(this).height()/2-$("#loading").height())
		    .css("display","block");
		 $("#r_body").css("display","none");
	}else{
		$("#loading").css("display","none");
		$("#r_body").css("display","block");
	}
}

function loadingvisible(bool){
	if(bool){
		 $("#loading")
		    .css("z-index","10001")
		    .css("top",$(this).height()/2-$("#loading").height())
		    .css("display","block");
		 //$("#r_body").css("display","none");
		 $("#r_body").css("visibility","hidden");
	}else{
		$("#loading").css("display","none");
		$("#r_body").css("visibility","visible");
	}
}
var isDrag;
var startX;
var startY;
var offsetX;
var direction;
var timerId= 0;
$(this).on('touchstart', function(e) {
    isDrag = true;
    clearTimeout(timerId);
    startX = e.originalEvent.touches[0].clientX;
    startY = e.originalEvent.touches[0].clientY;
    //console.log(startX + ' / ' + startY);
});

function swipecall(type){
	if(type == "left"){
		$("body").removeClass("mini-navbar")
	}else{
		 if(!($("body").hasClass("mini-navbar"))){
         	$(".fa-bars").trigger("click");
         }
	}
}


function moveChange(url){
	if(isMobile){
		location.href = "/m"+url;
	}else{
		location.href = url;
	}
}   

function deviceCheckandInsert(device_code,token){
	Kajax("/action/devicdeCheck",{
		device_code : device_code
	},function(res){
		if(res.success){
			if(res.rows["cnt"] == 0){
				Kajax("/action/deviceInsert",{
					device_code : device_code
					,token : token
				},function(res){
					
				})
			}else{
				Kajax("/action/deviceTokenCheck",{
					device_code : device_code
					,token : token
				},function(res){
					if(res.success){
						if(res.rows["cnt"] == 0){
							Kajax("/action/deviceTokenUpdate",{
								device_code : device_code
								,token : token
							})	
						}
					}else{
						
					}
				})
			}
		}
	})
}

function deviceCheckandInsert2(device_code,token){
	Kajax("/action/devicdeCheck",{
		device_code : device_code
	},function(res){
		if(res.success){
			if(res.rows["cnt"] == 0){
				Kajax("/action/deviceInsert",{
					device_code : device_code
					,token : token
				},function(res){
					if(res.success){
						Kajax("/action/deviceCodeUpdate",{
							device_code : device_code
							,token : token
						},function(res){
							Kajax("/action/tempDelete",{
								device_code : device_code
								,token : token
							})
						})
					}
				})
			}else{
				Kajax("/action/deviceTokenCheck",{
					device_code : device_code
					,token : token
				},function(res){
					if(res.success){
						if(res.rows["cnt"] == 0){
							Kajax("/action/deviceTokenUpdate",{
								device_code : device_code
								,token : token
							})	
						}
					}else{
						
					}
				})
			}
		}
	})
}

function deviceCheckUpdate(device_code , buypuregold , sellpuregold){
	Kajax("/action/deviceUpdate",{
		device_code : device_code
		,buypuregold : buypuregold
		,sellpuregold : sellpuregold
	},function(res){
		if(res.success){
			Kalert("설정이 저장되었습니다.","");
		}
	})
}
	function logout(){
		Kajax("/login/logout",{},function(res){
			
			Kalert("알림","로그아웃 되었습니다.",function(){
    			location.href = "/";
            });
			
			
		});
	}       
	function callUrl(value){
		//alert(value)
		location.href = "manager/view/customer";
	}
</script>