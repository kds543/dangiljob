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
				<% if(String.valueOf(request.getAttribute("menu")).equals("joblist")){ %>
				<li class="on">
				<% }else{ %>
				<li>
				<% } %>
				
				<a href="/view/joblist">일자리</a></li>
				<% if(String.valueOf(request.getAttribute("menu")).equals("map")){ %>
				<li class="on"><a href="/map">내주변 일자리(지도)</a></li>
				 <% }else{  %>
	          	<li><a href="/map">내주변 일자리(지도)</a></li>
	            <% } %>
				<li style="display:none"><a href="javascript:;">커뮤니티</a></li>
				<li>
					<a href="#" class="btn_depth2">마이페이지</a>
					<ul class="pc_depth2">
						<li>
							<a href="javascript:pMovePage('/view/myjobmanager');">나의 배정</a>
						</li>
						<li>
							<a href="javascript:pMovePage('/view/calendar');">나의 일정</a>
						</li>
						<li>
							<a href="javascript:pMovePage('/view/myinfo')">내 정보</a>
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
			<a href="javascript:pMovePage('/view/myinfo')">
				<img src="/resources/djver/images/icon_member.png" alt="내 정보" >
			</a>
			<a style="display:none" href="javascript:;" class="btn_show_search">
				<img src="/resources/djver/images/icon_search_header.png" alt="검색" >
			</a>
		</aside>
	</header>
	<header class="mobile">
		<h1>
			<a href="/">
				<img src="/resources/djver/images/logo_mobile.png" alt="당일JOB 로고">
			</a>
		</h1>

		<aside>
			<a href="/map">
				<img src="/resources/djver/images/icon_map_mobile.png" alt="지도" style="height: 22px;">
			</a>
			<a href="javascript:pMovePage('/view/myinfo')">
				<img src="/resources/djver/images/icon_member_mobile.png" alt="내 정보" style="height: 22px;">
			</a>
			<a href="javascript:;" class="btn_menu">
				<img src="/resources/djver/images/icon_menu.png" alt="메뉴" style="height: 16px;">
			</a>
		</aside>
	</header>
	<script>
	function logout(){
		Kajax("/login/logout",{},function(res){
			Kalert("알림","로그아웃 되었습니다.",function(){
    			location.href = "/";
            });
		});
	}  
		function pMovePage(url){
			if(ismember()){
				location.href = url;
			}else{
				alert("회원로그인 후 이용가능합니다.");
				location.href = "/login"
				return;
			}
		}
		function ismember(){
			<%if(String.valueOf(request.getAttribute("user_seq"))!="null"){%>
				 return true;
			<% }else{ %>
			 	 return false;
			<% } %>
		}
	</script>