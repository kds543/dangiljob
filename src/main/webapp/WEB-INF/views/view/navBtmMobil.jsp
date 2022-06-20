<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navBtmMobile">
		<a href="/">
			<i class="icon_btm_home"></i>
			<span>홈</span>
		</a>
		<a href="javascript:navMovePage('/view/myjobmanager')">
			<i class="icon_btm_cal"></i>
			<span>나의배정</span>
		</a>
		<a href="javascript:navMovePage('/view/calendar')">
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