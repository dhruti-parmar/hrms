<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>404 Error | TalentWave</title>

    <!-- ========== All CSS files linkup ========= -->
    <%@include file="header_css.jsp"%>
  </head>
  <body>
    <!-- ======== Preloader =========== -->
    <div id="preloader">
      <div class="spinner"></div>
    </div>
    <!-- ======== Preloader =========== -->

    <!-- ======== main-wrapper start =========== -->
    <main class="container">
    
      <!-- ========== error-section start ========== -->
      <section class="signin-section">
        <div class="container mt-30">
          <div class="row">
            <div class="col-lg-6 offset-lg-3">
              <div class="signin-wrapper">
                <div class="form-wrapper text-center">
                  <h1 class="mb-15 fs-1">404<br/>Page Not Found</h1>
                  <p class="mb-50 text-sm">
                    The page you are looking for does not exist.
                  </p>
                  <a href="javascript:void(0);" onclick="event.preventDefault(); window.history.back();" class="main-btn primary-btn btn-hover">Go Back</a>
                </div>
              </div>
            </div>
            <!-- end col -->
          </div>
          <!-- end row -->
        </div>
      </section>
      <!-- ========== signin-section end ========== -->

      <!-- ========== footer start =========== -->
      <%@include file="footer.jsp"%>
      <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->

    <!-- ========= All Javascript files linkup ======== -->
    <%@include file="footer_js.jsp"%>
  </body>
</html>
