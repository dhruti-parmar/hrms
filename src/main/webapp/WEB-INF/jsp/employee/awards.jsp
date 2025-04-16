<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>Awards | TalentWave</title>
    
    <sec:csrfMetaTags/>

    <!-- ========== All CSS files linkup ========= -->
    <%@include file="../common/header_css.jsp"%>
    
  </head>
  <body>
    <!-- ======== Preloader =========== -->
    <div id="preloader">
      <div class="spinner"></div>
    </div>
    <!-- ======== Preloader =========== -->

    <!-- ======== sidebar-nav start =========== -->
    <%@include file="../common/sidebar.jsp"%>
    <!-- ======== sidebar-nav end =========== -->

    <!-- ======== main-wrapper start =========== -->
    <main class="main-wrapper">
      <!-- ========== header start ========== -->
      <%@include file="../common/header.jsp"%>
      <!-- ========== header end ========== -->

      <!-- ========== section start ========== -->
      <section class="section">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title">
                  <h2>Awards List</h2>
                </div>
              </div>
              <!-- end col -->
              <div class="col-md-6">
                <div class="breadcrumb-wrapper">
                  <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item">
                        <a href="/dashboard">Dashboard</a>
                      </li>
                      <li class="breadcrumb-item active" aria-current="page">
                        Awards
                      </li>
                    </ol>
                  </nav>
                </div>
              </div>
              <!-- end col -->
            </div>
            <!-- end row -->
          </div>
          <!-- ========== title-wrapper end ========== -->

          <!-- Add User Section -->
          <div class="row mb-30">
            <div class="col-lg-12 text-end">
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#attendanceModal">
                <i class="lni lni-plus"></i> Add Awards
              </button>
            </div>
          </div>

          <!-- Users Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                  	
                  	<div class="single-notification">
		              <div class="notification">
		                <div class="image success-bg">
		                  <i class="lni lni-star-fill"></i>
		                  <i class="lni lni-star-fill"></i>
		                  <i class="lni lni-star-fill"></i>
		                </div>
		                <a href="#0" class="content">
		                  <h6> Employee of the Month</h6>
		                  <p class="text-sm text-gray">
		                    In recognition of your outstanding performance, dedication, and commitment to excellence, 
		                    you have set a remarkable example for your peers. Your hard work and contributions have 
		                    significantly impacted our team and organization.
		                  </p>
		                  <span class="text-sm text-medium text-gray">23rd, january 2025</span>
		                </a>
		              </div>
		            </div>
                  	  <!-- end row -->
                  	
                  	<div class="single-notification">		              
		              <div class="notification">
		                <div class="image primary-bg">
		                  <i class="lni lni-star-fill"></i>	                  
		                  <i class="lni lni-star-half"></i>
		                </div>
		                <a href="#0" class="content">
		                  <h6>Spot Award Certificate</h6>
		                  <p class="text-sm text-gray">
		                    Your dedication and commitment to excellence have not gone unnoticed.
		                    This Spot Award recognizes your ability to go above and beyond in your role,
		                    making a significant impact on our team and organization.
		                  </p>
		                  <span class="text-sm text-medium text-gray">25 min ago</span>
		                </a>
		              </div>
		              <div class="action">
		                <button class="delete-btn">
		                  <i class="lni lni-trash-can"></i>
		                </button>
		                <button class="more-btn dropdown-toggle" id="moreAction" data-bs-toggle="dropdown" aria-expanded="false">
		                  <i class="lni lni-more-alt"></i>
		                </button>
		                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="moreAction">
		                  <li class="dropdown-item">
		                    <a href="#0" class="text-gray">Mark as Read</a>
		                  </li>
		                  <li class="dropdown-item">
		                    <a href="#0" class="text-gray">Reply</a>
		                  </li>
		                </ul>
		              </div>
		            </div>
		              <!-- end row -->
		              
<!--                     <table id="example" class="table display"> -->
<!-- 				        <thead> -->
<!-- 				            <tr> -->
<!-- 				                <th></th> -->
<!-- 				            </tr> -->
<!-- 				        </thead> -->
<!-- 				        <tbody> -->
<%-- 				            <c:choose> --%>
<%-- 				                <c:when test="${awardItems == null || empty awardItems}"> --%>
<!-- 				                    <tr> -->
<!-- 				                        <td colspan="5" style="text-align: center;">No records found.</td> -->
<!-- 				                    </tr> -->
<%-- 				                </c:when> --%>
<%-- 				                <c:otherwise> --%>
<%-- 				                    <c:forEach var="item" items="${awardItems}" varStatus="loop"> --%>
<!-- 				                        <tr> -->
<!-- 				                            <td> -->
											  
<!-- 											</td>											 -->
<!-- 				                        </tr> -->
<%-- 				                    </c:forEach> --%>
<%-- 				                </c:otherwise> --%>
<%-- 				            </c:choose> --%>
<!-- 				        </tbody> -->
<!-- 				    </table> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- end container -->
      </section>
      <!-- ========== section end ========== -->

      <!-- ========== footer start =========== -->
      <%@include file="../common/footer.jsp"%>
      <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->
    <%@include file="../common/footer_js.jsp"%>
    
    <script>
    $(document).ready(function() {
        $('#attendanceTable').DataTable();
    });
   
    </script>
  </body>
</html>