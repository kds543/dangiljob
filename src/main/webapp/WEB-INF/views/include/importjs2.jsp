<!--   Core JS Files   -->
<script src="/resources/js/jquery-3.1.1.min.js"></script>
  <script src="/assets/js/core/popper.min.js"></script>
  <script src="/assets/js/core/bootstrap.min.js"></script>
  <script src="/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Kanban scripts -->
  <script src="/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="/assets/js/plugins/jkanban/jkanban.js"></script>
  <script src="/assets/js/plugins/sweetalert.min.js"></script>
  <script src="/resources/js/plugins/sweetalert/sweetalert.min.js"></script>
  <script src="/resources/js/kcommon.js?ver=20210723"></script>
  <script src="/resources/js/plugins/slimscroll/jquery.slimscroll.min.js?ver=K1"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    var user_name = "<%=String.valueOf(request.getAttribute("name"))%>";
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/assets/js/soft-ui-dashboard.min.js?v=1.0.3"></script>
  <!-- IonRangeSlider -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ion-rangeslider/2.3.1/js/ion.rangeSlider.min.js"></script> 
         <!-- Toastr -->
    <script src="/resources/js/plugins/toastr/toastr.min.js"></script>
    <script src="/assets/js/plugins/quill.min.js"></script>
      <%@ include file="androidBridge.jsp" %>