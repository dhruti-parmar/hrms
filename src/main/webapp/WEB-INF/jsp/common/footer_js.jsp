<!-- ========= All Javascript files linkup ======== -->
<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/dynamic-pie-chart.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/fullcalendar.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/jvectormap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/world-merc.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/polyfill.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/main.js"></script>

<!-- DataTable JS -->
<script src="${pageContext.request.contextPath}/admin/assets/js/plugin/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/plugin/dataTables.bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/plugin/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/plugin/responsive.bootstrap5.min.js"></script>

<script>
    $(document).ready(function() {
        // Get the current URL
        var currentUrl = window.location.pathname;

        // Extract the page name from the URL
        var pageName = currentUrl.split('/');
        
        pageName = pageName.length>0?pageName[2]: null;
		
        // Remove active class from all nav items
        $('.nav-item').removeClass('active');

        if(pageName!=null){
            // Add active class to the corresponding nav item
            $('#nav-' + pageName).addClass('active');        	
        }else{
            $('#nav-dashboard').addClass('active');
        }
    });
</script>