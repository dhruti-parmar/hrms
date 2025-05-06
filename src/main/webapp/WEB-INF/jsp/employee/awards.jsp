<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>My Awards | TalentWave</title>
    
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
                  <h2>My Awards</h2>
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

          <!-- Awards List -->
          <div class="row">
            <div class="col-lg-12">
              <div class="card-style mb-30">
                <div class="table-wrapper table-responsive">
                  <c:choose>
                    <c:when test="${empty awards}">
                      <div class="text-center py-5">
                        <h4>No awards received yet</h4>
                        <p class="text-gray">Your awards will appear here when you receive them.</p>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <c:forEach items="${awards}" var="award">
                        <div class="single-notification">
                          <div class="notification">
                            <div class="image ${award.status == 'ACTIVE' ? 'success-bg' : 'primary-bg'}">
                              <i class="lni lni-star-fill"></i>
                              <i class="lni lni-star-fill"></i>
                              <i class="lni lni-star-fill"></i>
                            </div>
                            <div class="content">
                              <h6>${award.name}</h6>
                              <p class="text-sm text-gray">${award.description}</p>
                              <span class="text-sm text-medium text-gray">
                                <fmt:formatDate value="${award.date}" pattern="dd MMMM yyyy"/>
                              </span>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
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
  </body>
</html>