<%@ page contentType="text/html;charset=UTF-8" language="java" %>	
					<% if(String.valueOf(request.getAttribute("menu")).equals("menu_4")){ %>
						<li id="menu_4" class="active">
					<% }else{  %>
						<li>
					<% } %>
                        <a href="/">
                        	<i class="fa fa-home"></i> <span class="nav-label">지도</span>
                        </a>
                    </li>
                    <% if(String.valueOf(request.getAttribute("menu")).equals("menu_1")){ %>
						<li id="menu_1" class="active">
					<% }else{  %>
						<li>
					<% } %>
					<% if(String.valueOf(request.getAttribute("type")).equals("A01")){ %>
						<a href="/view/myjobmanager">
					<% }else{ %>
						<a href="/view/user/myjobmanager">
					<% } %>
                        
                        	<i class="fa fa-newspaper-o"></i> <span class="nav-label">나의배정</span>
                        </a>
                    </li>
                    
                    <% if(String.valueOf(request.getAttribute("menu")).equals("menu_2")){ %>
						<li style="display:none" id="menu_2" class="active">
					<% }else{  %>
						<li  style="display:none">
					<% } %>
                        <a href="/view/sellClient">
                        	<i class="fa fa-calendar"></i> <span class="nav-label">나의일정</span>
                        </a>
                    </li>
                    
                     <% if(String.valueOf(request.getAttribute("menu")).equals("menu_2")){ %>
						<li  style="display:none" id="menu_2" class="active">
					<% }else{  %>
						<li  style="display:none">
					<% } %>
                        <a href="/view/sellClient">
                        	<i class="fa fa-comments"></i> <span class="nav-label">커뮤니티</span>
                        </a>
                    </li>
                     <% if(String.valueOf(request.getAttribute("menu")).equals("myinfo")){ %>
						<li id="menu_2" class="active">
					<% }else{  %>
						<li>
					<% } %>
                        <a href="/view/myinfo">
                        	<i class="fa fa-user"></i> <span class="nav-label">나의정보</span>
                        </a>
                    </li>
                    <li>
                    	<a href="javascript:logout()">
                        	<i class="fa fa-sign-out"></i> <span class="nav-label">로그아웃</span>
                        </a>
                    </li>
  					<script>
                   var menu = '<%=String.valueOf(request.getAttribute("menu"))%>';
                   var submenu = '<%=String.valueOf(request.getAttribute("submenu"))%>';
                   if(submenu != '') $("#"+submenu).addClass("active");
                   </script>
                   