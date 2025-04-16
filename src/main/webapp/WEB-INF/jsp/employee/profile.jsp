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
              <div class="card-style settings-card-1 mb-30">
                <div class="title mb-30 d-flex justify-content-between align-items-center">
                  <h6>My Profile</h6>
                  <button class="border-0 bg-transparent">
                    <i class="lni lni-pencil-alt"></i>
                  </button>
                </div>
                <div class="profile-info">
                  <div class="d-flex align-items-center mb-30">
                    <div class="profile-image">
                      <img src="${pageContext.request.contextPath}/admin/assets/images/profile/profile-1.png" alt="" />
                      <div class="update-image">
                        <input type="file" />
                        <label for=""><i class="lni lni-cloud-upload"></i></label>
                      </div>
                    </div>
                    <div class="profile-meta">
                      <h5 class="text-bold text-dark mb-10">John Doe</h5>
                      <p class="text-sm text-gray">Web & UI/UX Design</p>
                    </div>
                  </div>
                  <div class="input-style-2">
                    <label>EmployeeCode</label>
                    <input type="employeeCode" placeholder="Employee Code" value="E01"  disabled/>
					<span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <div class="input-style-2">
                    <label>Email</label>
                    <input type="email" placeholder="admin@example.com" value="admin@example.com"  disabled/>
					<span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <div class="input-style-1">
                    <label>Password</label>
                    <input type="password" value="admin" />
                  </div>                  
                  <div class="input-style-1">
                    <label>PhoneNo</label>
                    <input type="text" placeholder="www.uideck.com" value="www.uideck.com" />
                  </div>
                  <div class="input-style-1">
                    <label>Linkdin URL</label>
                    <input type="text" placeholder="www.uideck.com" value="www.uideck.com" />
                  </div>

                  <div class="input-style-1">
                    <label>About Me</label>
                    <textarea placeholder="Write your bio here" rows="4">
  Crafted for – Business, Startup, SaaS, Apps, Event, Software, Agency, Resume and Portfolio. All Landing Pages comes with clean design and responsive layout. Also packed with all essential sections, elements, and features you need to launch</textarea>
                  </div>
                </div>
              </div>
              <!-- end card -->
			  
				<!-- ======= select style start ======= -->
                <div class="card-style mb-30">
                  <h6 class="mb-25">Education</h6>
                  <div class="select-style-1">
                    <div class="select-position">
                      <label>Degree</label>
                      <select>
                        <option value="">10th</option>
                        <option value="">12th</option>
                        <option value="" selected>Graduate</option>
                        <option value="">Post Graduate</option>
                      </select>
                    </div>
                  </div>
                  <!-- end select -->
                   <div class="input-style-2">
                    <label>Specialization</label>
                    <input type="text" placeholder="Specialized Degree" value="Computer Engineering" disabled/>
					<span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <!-- end select -->
                </div>
                <!-- end card -->
            </div>
            <!-- end col -->
			<div class="col-lg-6">
				<div class="card-style mb-30">
                  <h6 class="mb-25">Skills</h6>
                  <div class="input-style-1">
                    <label>Message</label>
                    <textarea placeholder="Message" rows="4">
Photoshop
Wordpress
HTML 5
Angular
					</textarea>
                  </div>
                </div>
				<div class="card-style mb-30">
                  <h6 class="mb-25">Role</h6>
                  <div class="input-style-2">
                    <label>Department</label>
                    <input type="text" placeholder="Department" value="Software Development" disabled/>
					<span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                  <div class="input-style-2">
                    <label>Designation</label>
                    <input type="text" placeholder="Designation" value="Junior Software Developer" disabled/>
					<span class="icon"> <i class="lni lni-lock"></i> </span>
                  </div>
                </div>
				<div class="card-style settings-card-2 mb-30">
                <div class="title mb-30">
                  <h6>Account Setting</h6>
                </div>
                <form action="#">
                  <div class="row">
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Full Name</label>
                        <input type="text" placeholder="Full Name" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Email</label>
                        <input type="email" placeholder="Email" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Company</label>
                        <input type="text" placeholder="Company" />
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>Address</label>
                        <input type="text" placeholder="Address" />
                      </div>
                    </div>
                    <div class="col-xxl-6">
                      <div class="input-style-1">
                        <label>City</label>
                        <input type="text" placeholder="City" />
                      </div>
                    </div>
                    <div class="col-xxl-6">
                      <div class="input-style-1">
                        <label>Zip Code</label>
                        <input type="text" placeholder="Zip Code" />
                      </div>
                    </div>                    
                    <div class="col-12">
                      <div class="input-style-1">
                        <label>About Me</label>
                        <textarea placeholder="Type here" rows="6"></textarea>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="main-btn primary-btn btn-hover">
                        Update Profile
                      </button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- end card -->
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
