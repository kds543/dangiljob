<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="pc">
		<h1>
			<a href="javascript:;">
				<img src="/resources/djver/images/logo.png" alt="logo">
			</a>
		</h1>

		<nav>
			<ul>
			 <% if(String.valueOf(request.getAttribute("menu")).equals("home")){ %>
				 <li class="on"><a href="/">홈</a></li>
			  <% }else{  %>
			  	<li><a href="/">홈</a></li>
			  <% } %>
				<li><a href="/view/joblist">일자리</a></li>
				 <% if(String.valueOf(request.getAttribute("menu")).equals("map")){ %>
				 	<li class="on"><a href="/map">내주변 일자리(지도)</a></li>
				  <% }else{  %>
				  	<li><a href="/map">내주변 일자리(지도)</a></li>
				  <% } %>
				<a href="javascript:;">커뮤니티</a>
				<li>
				 <% if(String.valueOf(request.getAttribute("type")).equals("null")){ %>
					<a href="javascript:ismembercheck()" class="btn_depth2">마이페이지</a>
					 <% }else{  %>
						 <a href="#" class="btn_depth2">마이페이지</a>
					<% } %>
					<ul class="pc_depth2">
						<li>
							<a href="javascript:navMovePage('/view/myjobmanager')">나의 배정</a>
						</li>
						<li>
							<a href="javascript:navMovePage('/view/calendar');">나의 일정</a>
						</li>
						<li>
							<a href="javascript:navMovePage('/view/myinfo')">내 정보</a>
						</li>
						<%if(String.valueOf(request.getAttribute("user_seq"))!="null"){%>
						<li>
							<a href="javascript:logout()">로그아웃</a>
						</li>
						<%} %>
					</ul>
				</li>
			</ul>
		</nav>

		<aside>
			<a href="/map">
				<img src="/resources/djver/images/icon_head_map.png" alt="맵" >
			</a>
			 <% if(String.valueOf(request.getAttribute("type")).equals("null")){ %>
			  	<a href="javascript:ismembercheck()">
					<img src="/resources/djver/images/icon_member.png" alt="내 정보" >
				</a>
			 <% }else{  %>
				 <a href="/view/myinfo">
					<img src="/resources/djver/images/icon_member.png" alt="내 정보" >
				</a>
			<% } %>
			
			<a href="javascript:;" style="visibility: hidden;" class="btn_show_search">
				<img src="/resources/djver/images/icon_search_header.png" alt="검색" >
			</a>
		</aside>
	</header>

	<header class="mobile">
		<div class="left">
            <a href="javascript:history.back()" class="headerButton goBack">
                <i class="bi bi-arrow-left"></i>
            </a>
        </div>
        <div class="pageTitle"><%=String.valueOf(request.getAttribute("submenu"))%></div>
       <div class="right" style="visibility: hidden">
            <a href="#" class="headerButton">
                <i class="bi bi-gear-fill"></i>
            </a>
        </div>
	</header>
	<div class="navBtmMobile">
		<a href="/">
			<i class="icon_btm_home"></i>
			<span>홈</span>
		</a>
		<a href="javascript:navMovePage('/view/myjobmanager')">
			<i class="icon_btm_cal"></i>
			<span>나의배정</span>
		</a>
		<a href="javascript:navMovePage('/view/calendar/')">
			<i class="icon_btm_list"></i>
			<span>나의일정</span>
		</a>
		<a href="javascript:alert('개발진행중입니다.')">
			<i class="icon_btm_com"></i>
			<span>커뮤니티</span>
		</a>
		<a id="myinfobtn" href="javascript:navMovePage('/view/myinfo')">
			<i class="icon_btm_user"></i>
			<span>내정보</span>
		</a>
	</div>
	
	<script>
	function logout(){
		Kajax("/login/logout",{},function(res){
			Kalert("알림","로그아웃 되었습니다.",function(){
    			location.href = "/";
            });
		});
	}  
	function navMovePage(url){
		if(navismember()){
			location.href = url;
		}else{
			alert("회원로그인 후 이용가능합니다.");
			location.href = "/login"
			return;
		}
	}
	function navismember(){
		<%if(String.valueOf(request.getAttribute("user_seq"))!="null"){%>
			 return true;
		<% }else{ %>
		 	 return false;
		<% } %>
	}
	</script>