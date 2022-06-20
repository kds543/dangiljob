<!--   Core JS Files   -->
<script src="/resources/js/jquery-3.1.1.min.js"></script>
  <script src="/resources/js/kcommon.js?ver=20220104"></script>
  <script src="/resources/js/plugins/slimscroll/jquery.slimscroll.min.js?ver=K1"></script>
<script src="/resources/djver/script/swiper-bundle.min.js"></script>
	<script src="/resources/djver/script/script.js"></script>
	  <script src="/assets/js/plugins/sweetalert.min.js"></script>
	  <!-- Toastr -->
    <script src="/resources/js/plugins/toastr/toastr.min.js"></script>
  <script src="/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
	<script>
	var scrollBl = true;
  					var user_id = '<%=String.valueOf(request.getAttribute("user_id"))%>';
  					var type = '<%=String.valueOf(request.getAttribute("type"))%>';
  					var jobtype = '<%=String.valueOf(request.getAttribute("jobtype"))%>';
  					var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
  					var menu_p = '<%=String.valueOf(request.getAttribute("menu"))%>'
  						</script>
