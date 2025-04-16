<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>Attendance | TalentWave</title>
    
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
                  <h2>Attendance List</h2>
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
                        Attendance
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
                <i class="lni lni-plus"></i> Add Attendance
              </button>
            </div>
          </div>

          <!-- Users Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="example" class="table display">
				        <thead>
				            <tr>
				                <th>Index</th>
				                <th>Date</th>
				                <th>Working Hours</th>
				                <th>Half Day</th>
				                <th>Status</th>
				                <th>Action</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:choose>
				                <c:when test="${attendanceRecords == null || empty attendanceRecords}">
				                    <tr>
				                        <td colspan="5" style="text-align: center;">No records found.</td>
				                    </tr>
				                </c:when>
				                <c:otherwise>
				                    <c:forEach var="item" items="${attendanceRecords}" varStatus="loop">
				                        <tr>
				                            <td>
											  <p class="text-sm">${loop.count}</p>
											</td>
											<td>
											  <p class="text-sm">${attendance.date}</p>
											</td>
											<td>
											  <p class="text-sm">${attendance.hours}</p>
											</td>
											</td>
											<td>
											  <p class="text-sm">${attendance.isHalfDay}</p>
											</td>
				                            <td>
												<c:choose>
													<c:when test="${attendance.present == true}">
														<p class="text-sm"><div class="badge col-green">Present</div></p>
													</c:when>
													<c:when test="${attendance.present == false}">
														<p class="text-sm"><div class="badge col-red">Leave</div></p>
													</c:when>
													<c:when test="${attendance.isHoliday == true}">
														<p class="text-sm"><div class="badge col-red">Holiday</div></p>
													</c:when>
													<c:otherwise>
														<p class="text-sm"><div class="badge col-blue">Weekend</div></p>
													</c:otherwise>
												</c:choose>		                                
											</td>
											<td>
											  <div class="action">
												<button class="text-primary me-2" onclick="editAttendance(${attendance.id})">
												  <i class="lni lni-pencil"></i>
												</button>
											  </div>
											</td>
				                        </tr>
				                    </c:forEach>
				                </c:otherwise>
				            </c:choose>
				        </tbody>
				    </table>
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
    
    <!-- Add User Modal -->
    <!-- The Modal -->
	<div class="modal fade" id="attendanceModal" tabindex="-1" aria-labelledby="attendanceModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h5 class="modal-title" id="attendanceModalLabel">Add Attendance</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	
	      <!-- Modal Body -->
	      <div class="modal-body">
	        <form id="addAttendanceForm" action="/employee/attendance/create" method="post">
	          <!-- Date Picker -->
	          <div class="form-group mb-3">
	            <label for="attendanceDate" class="form-label">Date</label>
	            <input type="date" class="form-control" id="attendanceDate" value="">
	          </div>
	
	          <!-- Toggle Switches -->
	          <div class="form-group mb-3">
	            <div class="form-check form-switch toggle-switch">
	              <input class="form-check-input" type="checkbox" id="halfdaySwitch" checked>
	              <label class="form-check-label" for="halfdaySwitch">Half Day</label>
	            </div>
	            <div class="form-check form-switch toggle-switch">
	              <input class="form-check-input" type="checkbox" id="leaveSwitch">
	              <label class="form-check-label" for="leaveSwitch">Leave</label>
	            </div>
	            <div class="form-check form-switch toggle-switch">
	              <input class="form-check-input" type="checkbox" id="holidaySwitch">
	              <label class="form-check-label" for="holidaySwitch">Holiday</label>
	            </div>
	          </div>
	
	          <!-- Time Input -->
	          <div class="form-group mb-3">
	            <label for="attendanceTime" class="form-label">Time</label>
	            <input type="time" class="form-control" id="attendanceTime" value="08:00">
	          </div>
	        </form>
	      </div>
	
	      <!-- Modal Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Submit</button>
	      </div>
	    </div>
	  </div>
	</div>

    <!-- Edit User Modal -->
    <!-- The Modal -->
	<div class="modal fade" id="editAttendanceModal" tabindex="-1" aria-labelledby="editAttendanceModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h5 class="modal-title" id="editAttendanceModalLabel">Edit Attendance</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	
	      <!-- Modal Body -->
	      <div class="modal-body">
	        <form id="editAttendanceForm" action="/employee/attendance/edit" method="post">
	          <!-- Date Picker -->
	          <div class="form-group mb-3">
	            <label for="attendanceDate" class="form-label">Date</label>
	            <input type="date" class="form-control" id="attendanceDate" value="">
	          </div>
	
	          <!-- Toggle Switches -->
	          <div class="form-group mb-3">
	            <div class="form-check form-switch toggle-switch">
	              <input class="form-check-input" type="checkbox" id="halfdaySwitch" checked>
	              <label class="form-check-label" for="halfdaySwitch">Half Day</label>
	            </div>
	            <div class="form-check form-switch toggle-switch">
	              <input class="form-check-input" type="checkbox" id="leaveSwitch">
	              <label class="form-check-label" for="leaveSwitch">Leave</label>
	            </div>
	            <div class="form-check form-switch toggle-switch">
	              <input class="form-check-input" type="checkbox" id="holidaySwitch">
	              <label class="form-check-label" for="holidaySwitch">Holiday</label>
	            </div>
	          </div>
	
	          <!-- Time Input -->
	          <div class="form-group mb-3">
	            <label for="attendanceTime" class="form-label">Time</label>
	            <input type="time" class="form-control" id="attendanceTime" value="08:00">
	          </div>
	        </form>
	      </div>
	
	      <!-- Modal Footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Submit</button>
	      </div>
	    </div>
	  </div>
	</div>

    <script>
    $(document).ready(function() {
        $('#attendanceTable').DataTable();
    });
   
    </script>
  </body>
</html>