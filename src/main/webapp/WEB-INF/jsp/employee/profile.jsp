<%@include file="../common/init.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile | TalentWave</title>

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
                  <h2>Profile</h2>
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
                        Profile
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

          <div class="row">
            <div class="col-lg-6">
              <!-- View Profile Section -->
              <div class="card-style settings-card-1 mb-30">
                <div class="title mb-30">
                  <h6>View Profile</h6>
                </div>
                <div class="profile-info">
                  <div class="d-flex align-items-center mb-30">
                    <div class="profile-image">
                      <img src="${pageContext.request.contextPath}/admin/assets/images/profile/profile-1.png" alt="" />
                    </div>
                    <div class="profile-meta">
                      <h5 class="text-bold text-dark mb-10">${employee.name}</h5>
                      <p class="text-sm text-gray">${employee.designation.name}</p>
                    </div>
                  </div>
                  
                  <!-- Basic Information -->
                  <h6 class="mb-20">Basic Information</h6>
                  <div class="input-style-2">
                    <label>Employee Code</label>
                    <input type="text" value="${employee.id}" readonly />
                    <span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <div class="input-style-2">
                    <label>Name</label>
                    <input type="text" value="${employee.name}" readonly />
                    <span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <div class="input-style-2">
                    <label>Email</label>
                    <input type="email" value="${employee.email}" readonly />
                    <span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <div class="input-style-2">
                    <label>Department</label>
                    <input type="text" value="${employee.department.name}" readonly />
                    <span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <div class="input-style-2">
                    <label>Designation</label>
                    <input type="text" value="${employee.designation.name}" readonly />
                    <span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  
                  <!-- Contact Information -->
                  <h6 class="mb-20 mt-30">Contact Information</h6>
                  <div class="input-style-2">
                    <label>Phone</label>
                    <input type="text" value="${employee.phone}" readonly />
                  </div>
                  <div class="input-style-2">
                    <label>Address</label>
                    <input type="text" value="${employee.address}" readonly />
                  </div>
<!--                   <div class="input-style-2"> -->
<!--                     <label>LinkedIn URL</label> -->
<%--                     <input type="text" value="${employee.linkedinUrl}" readonly /> --%>
<!--                   </div> -->
                  
                  <!-- Education -->
                  <h6 class="mb-20 mt-30">Education</h6>
                  <div class="input-style-2">
                    <label>Degree</label>
                    <input type="text" value="${employee.degree}" readonly />
                  </div>
                  <div class="input-style-2">
                    <label>Specialization</label>
                    <input type="text" value="${employee.specialization}" readonly />
                  </div>
                  
                  <!-- Skills -->
                  <h6 class="mb-20 mt-30">Skills</h6>
                  <div class="input-style-2">
                    <label>Skills</label>
                    <textarea readonly rows="4">${employee.skills}</textarea>
                  </div>
                  
                  <!-- About Me -->
                  <h6 class="mb-20 mt-30">About Me</h6>
                  <div class="input-style-2">
                    <label>About Me</label>
                    <textarea readonly rows="4">${employee.aboutMe}</textarea>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- Edit Profile Section -->
            <div class="col-lg-6">
              <div class="card-style settings-card-1 mb-30">
                <div class="title mb-30">
                  <h6>Edit Profile</h6>
                </div>
                <form action="${pageContext.request.contextPath}/employee/profile/update" method="post">
                  <input type="hidden" name="id" value="${employee.id}" />
                  
                  <!-- Contact Information -->
                  <h6 class="mb-20">Contact Information</h6>
                  <div class="input-style-1">
                    <label>Phone</label>
                    <input type="text" name="phone" value="${employee.phone}" />
                  </div>
                  <div class="input-style-1">
                    <label>Address</label>
                    <input type="text" name="address" value="${employee.address}" />
                  </div>
<!--                   <div class="input-style-1"> -->
<!--                     <label>LinkedIn URL</label> -->
<%--                     <input type="text" name="linkedinUrl" value="${employee.linkedinUrl}" /> --%>
<!--                   </div> -->
                  
                  <!-- Education -->
                  <h6 class="mb-20 mt-30">Education</h6>
                  <div class="select-style-1">
                    <div class="select-position">
                      <label>Degree</label>
                      <select name="degree">
                        <option value="10th" ${employee.degree == '10th' ? 'selected' : ''}>10th</option>
                        <option value="12th" ${employee.degree == '12th' ? 'selected' : ''}>12th</option>
                        <option value="Graduate" ${employee.degree == 'Graduate' ? 'selected' : ''}>Graduate</option>
                        <option value="Post Graduate" ${employee.degree == 'Post Graduate' ? 'selected' : ''}>Post Graduate</option>
                      </select>
                    </div>
                  </div>
                  <div class="input-style-1">
                    <label>Specialization</label>
                    <input type="text" name="specialization" value="${employee.specialization}" placeholder="Enter your specialization" />
                  </div>
                  
                  <!-- Skills -->
                  <h6 class="mb-20 mt-30">Skills</h6>
                  <div class="input-style-1">
                    <label>Skills</label>
                    <textarea name="skills" placeholder="Enter your skills (one per line)" rows="4">${employee.skills}</textarea>
                  </div>
                  
                  <!-- About Me -->
                  <h6 class="mb-20 mt-30">About Me</h6>
                  <div class="input-style-1">
                    <label>About Me</label>
                    <textarea name="aboutMe" placeholder="Write your bio here" rows="4">${employee.aboutMe}</textarea>
                  </div>
                  
                  <button type="submit" class="main-btn primary-btn btn-hover">Update Profile</button>
                </form>
              </div>
            </div>
          </div>
          <!-- end row -->
        </div>
        <!-- end container -->
      </section>
      <!-- ========== section end ========== -->

      <!-- ========== footer start =========== -->
      <%@include file="../common/footer.jsp"%>
      <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->

    <!-- ========= All Javascript files linkup ======== -->
     <%@include file="../common/footer_js.jsp"%>
  </body>
</html>