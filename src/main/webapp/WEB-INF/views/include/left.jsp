<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Extra details for Live View on GitHub Pages -->
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="#">
        <img src="/resources/img/p_dangil_logo.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold">당일Job</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse w-auto h-auto max-height-vh-100 h-100 ps" id="sidenav-collapse-main">
      <ul class="navbar-nav">
      	<li class="nav-item">
      	<% if(String.valueOf(request.getAttribute("menu")).equals("menu_4")){ %>
          		<a class="nav-link active" href="/" >
          <% }else{  %>
          		<a class="nav-link" href="/" >
            <% } %>
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center  me-2 d-flex align-items-center justify-content-center">
              <i class="fa fa-home" style="color:black !important"></i>
            </div>
					 <span class="nav-link-text ms-1">메인</span>
          
          </a>
        </li>
        <% if(String.valueOf(request.getAttribute("type")).equals("null")){ %>
        <li class="nav-item">
          <a class="nav-link" href="/login">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center  me-2 d-flex align-items-center justify-content-center">
              <i class="fa fa-sign-out" style="color:black !important"></i>
            </div>
					 <span class="nav-link-text ms-1 active">로그인</span>
          </a>
        </li>
        <% } %>
        <li class="nav-item is_member">
         			<% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
         				<% if(String.valueOf(request.getAttribute("menu")).equals("menu_1")){ %>
         					<a class="nav-link active"   href="/view/myjobmanager">
         				<% }else{  %>
         					<a class="nav-link"   href="/view/myjobmanager">
            			<% } %>
						
					<% }else{ %>
						<% if(String.valueOf(request.getAttribute("menu")).equals("menu_1")){ %>
         					<a class="nav-link active"   href="/view/user/myjobmanager">
         				<% }else{  %>
         					<a class="nav-link"   href="/view/user/myjobmanager">
            			<% } %>
					<% } %>
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center  me-2 d-flex align-items-center justify-content-center" >
            	<i class="ni ni-building" style="color:black !important"></i>
            </div>
					 <span class="nav-link-text ms-1 active">나의배정</span>
          </a>
        </li>
        <% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
         	<li class="nav-item">
			        <% if(String.valueOf(request.getAttribute("menu")).equals("myjob")){ %>
         					<a class="nav-link active"   href="/view/myorder">
         				<% }else{  %>
         					<a class="nav-link"   href="/view/myorder">
            			<% } %>
			           <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center  me-2 d-flex align-items-center justify-content-center">
			              <i class="ni ni-single-02" style="color:black !important"></i>
			            </div>
								 <span class="nav-link-text ms-1">구인요청등록</span>
				     </a>
			</li>
		<% }else{ %>
			<li class="nav-item">
			        <% if(String.valueOf(request.getAttribute("menu")).equals("myjob")){ %>
         					<a class="nav-link active"   href="/view/myjob">
         				<% }else{  %>
         					<a class="nav-link"   href="/view/myjob">
            			<% } %>
			           <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center  me-2 d-flex align-items-center justify-content-center">
			              <i class="ni ni-single-02" style="color:black !important"></i>
			            </div>
								 <span class="nav-link-text ms-1">구직요청등록</span>
				     </a>
			</li>
		<% } %>
        <li class="nav-item is_member">
        			<% if(String.valueOf(request.getAttribute("menu")).equals("myinfo")){ %>
         					<a class="nav-link active"   href="/view/myinfo">
         				<% }else{  %>
         					<a class="nav-link"   href="/view/myinfo">
            			<% } %>
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center  me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-02" style="color:black !important"></i>
            </div>
					 <span class="nav-link-text ms-1">나의정보</span>
          </a>
        </li>
        <li class="nav-item is_member">
          <a class="nav-link" href="javascript:logout()">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center  me-2 d-flex align-items-center justify-content-center">
              <i class="fa fa-sign-out" style="color:black !important"></i>
            </div>
					 <span class="nav-link-text ms-1 active">로그아웃</span>
          </a>
        </li>
      </ul>
    <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;">
    </div>
    </div>
    <div class="ps__rail-y" style="top: 0px; right: 0px;">
    <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;">
    </div>
    </div>
    </div>
    <div class="sidenav-footer mx-3 mt-3 pt-3">
      <div class="card card-background shadow-none card-background-mask-secondary" id="sidenavCard">
        <div class="full-background" style="background-image: url('/assets/img/curved-images/white-curved.jpeg')"></div>
        <div class="card-body text-start p-3 w-100">
          <div class="icon icon-shape icon-sm bg-white shadow text-center mb-3 d-flex align-items-center justify-content-center border-radius-md">
            <i class="ni ni-diamond text-dark text-gradient text-lg top-0" aria-hidden="true" id="sidenavCardIcon"></i>
          </div>
          <div class="docs-info">
            <h6 class="text-white up mb-0"></h6>
            <p class="text-xs font-weight-bold">당신을 위한 복지몰</p>
            <a href="http://mall.damong.co.kr" class="btn btn-white btn-sm w-100 mb-0">복지몰</a>
          </div>
        </div>
      </div>
    </div>
  <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; height: 915px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 696px;">
  </div>
  </div>
  					<script>
  					var scrollBl = true;
  					var user_id = '<%=String.valueOf(request.getAttribute("user_id"))%>';
  					var type = '<%=String.valueOf(request.getAttribute("type"))%>';
  					var jobtype = '<%=String.valueOf(request.getAttribute("jobtype"))%>';
  					var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
  					var menu_p = '<%=String.valueOf(request.getAttribute("menu"))%>'
  					function logout(){
  						Kajax("/login/logout",{},function(res){
  							
  							Kalert("알림","로그아웃 되었습니다.",function(){
  				    			location.href = "/";
  				            });
  							
  							
  						});
  					}  
                   var menu = '<%=String.valueOf(request.getAttribute("menu"))%>';
                   var submenu = '<%=String.valueOf(request.getAttribute("submenu"))%>';
                   </script>
                   