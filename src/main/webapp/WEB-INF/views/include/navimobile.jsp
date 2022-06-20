<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navMobile">
		<div class="head">
			<div class="info">
				<img src="/resources/djver/images/nav_logo.png" alt="logo">
				<div class="box">
				<%if(String.valueOf(request.getAttribute("user_seq"))!="null"){%>
					<e><p><%=String.valueOf(request.getAttribute("name"))%> <a href="javascript:logout()" style="color: white;font-size: 14px;text-decoration: underline !important;margin-left: 10px">로그아웃</a></p></e>
				<% }else{ %>
					<a href="/login"><p>로그인/회원가입</p></a>					
				<% } %>
					<span class="text_map">
						<img src="/resources/djver/images/icon_nav_map.png" alt="map">
						<span>현재위치(설정 위치)</span>
					</span>
				</div>
			</div>
			<a href="#" class="btn_close">
				<img src="/resources/djver/images/nav_close.png" alt="메뉴 닫기">
			</a>
		</div>
		<div class="body">
			<nav>
				<p class="title">일자리 찾기</p>
				<ul>
					<li class="on" style="display:none">
						<a href="javascript:;">일자리 찾기 (직종별)</a>
						<ul class="depth2" style="display:none">
							<li><a href="javascript:;">건설인력</a></li>
							<li><a href="javascript:;">물류인력</a></li>
							<li><a href="javascript:;">여성인력</a></li>
							<li><a href="javascript:;">용달/화물차</a></li>
							<li><a href="javascript:;">중장비</a></li>
							<li><a href="javascript:;">기타</a></li>
						</ul>
					</li>
					<li><a href="/map">내주변 일자리 찾기(지도)</a></li>
					<li style="display:none" class="none"><a href="javascript:;">커뮤니티</a></li>
					<li style="display:none"><a href="javascript:;">자유 게시판</a></li>
					<li style="display:none"><a href="javascript:;">정회원 스토리</a></li>
					<li style="display:none"><a href="javascript:;">이용가이드</a></li>
					<li style="display:none" class="none"><a href="javascript:;">포인트</a></li>
					<li style="display:none"><a href="javascript:;">전체 포인트</a></li>
					<li style="display:none"><a href="javascript:;">무료 포인트 획득</a></li>
					<li style="display:none"><a href="javascript:;">포인트 내역</a></li>
					<li class="mall">
						<p>복지몰 이용하기</p>
						<a href="https://choamall.com" class="banner">
							<img src="/resources/img/1234.PNG" alt="" style="width:100%;height:100%">
						</a>
					</li>
					<li><a href="javascript:;">당일잡 소개</a></li>
				</ul>
				<a style="display:none" href="javascript:;" class="btn_contect">직업소개소 가입 및 창업문의</a>
				<div class="btm" style="display:none">
					<a href="javascript:;">
						<span>마이찜</span>
						<img src="images/icon_nav_heart.png" alt="heart">
					</a>
					<a href="javascript:;">
						<span>고객센터</span>
						<img src="images/icon_nav_question.png" alt="question">
					</a>
					<a href="javascript:;">
						<span>설정</span>
						<img src="images/icon_nav_setting.png" alt="setting">
					</a>
				</div>
			</nav>
		</div>
	</div>
	