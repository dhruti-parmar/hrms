<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Leave | TalentWave</title>
    
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
                  <h2>Leaves List</h2>
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
                        Leaves
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
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                <div class="icon purple">
                	PL
                </div>
                <div class="content">
                  <h3 class="text-bold">20</h3>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                <div class="icon success">
                 SL
                </div>
                <div class="content">
                  <h6 class="text-bold">6</h6>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                <div class="icon orange">
                 FL
                </div>
                <div class="content">
                  <h6 class="text-bold">1</h6>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
            <div class="col-xl-3 col-lg-4 col-sm-6">
              <div class="icon-card mb-30">
                <div class="icon primary">
                 CO
                </div>
                <div class="content">
                  <h6 class="text-bold">0</h6>
                </div>
              </div>
              <!-- End Icon Cart -->
            </div>
            <!-- End Col -->
          </div>
          
          <!-- Add User Section -->
          <div class="row mb-30">
            <div class="col-lg-12 text-end">
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#addLeaveModal">
                <i class="lni lni-plus"></i> Add New Leave
              </button>
            </div>
          </div>

          <!-- Users Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="leaveTable" class="table">
                      <thead>
                        <tr>
                          <th>Index</th>
                          <th>Leave From</th>
                          <th>Leave To</th>                          
                          <th>Type</th>
	                      <th>Comment</th>
                          <th>Half Day</th>
                          <th>Status</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
<%--                         <c:choose> --%>
<%--                           <c:when test="${empty leaveApplications}"> --%>
<!--                             <tr> -->
<!--                               <td colspan="8" class="text-center">No leave applied</td> -->
<!--                             </tr> -->
<%--                           </c:when> --%>
<%--                           <c:otherwise> --%>
<%--                             <c:forEach var="leave" items="${leaveApplications}" varStatus="loop"> --%>
                              <tr>
                              	<td>
               					  <p class="text-sm">${loop.count}</p>
                              	</td>
                                <td>
                                  <p class="text-sm">${leave.startDate}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.endDate}</p>
                                </td>                                
                                <td>
                                  <p class="text-sm">${leave.leaveType.type}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.comment}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.isHalfDay}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.status}</p>
                                </td>
                                <td>
                                  <div class="action">
                                    <button class="text-danger" onclick="cancelLeave(${leave.id})">
                                      <i class="lni lni-trash-can"></i>
                                    </button>
                                  </div>
                                </td>
                              </tr>
<%--                             </c:forEach> --%>
<%--                           </c:otherwise> --%>
<%--                         </c:choose> --%>
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
    
    <!-- Add Leave Modal -->
    <div class="modal fade" id="addLeaveModal" tabindex="-1" aria-labelledby="addLeaveModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addLeaveModalLabel">Add New Leave</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="leaveForm" action="/employee/leave/add" method="post">
                 <div class="mb-3">
                     <label for="leaveType" class="form-label">Leave Type</label>
                     <select class="form-select" id="leaveType" required>
                         <option value="" disabled selected>Select Leave Type</option>
                         <option value="PL">PL</option>
                         <option value="SL">SL</option>
                         <option value="Floater">Floater</option>
                         <option value="Camp off">Camp off</option>
                         <option value="LWP">LWP</option>
                     </select>
                 </div>
                 <div class="mb-3">
                     <label for="fromDate" class="form-label">From Date</label>
                     <input type="text" class="form-control" id="fromDate" required>
                 </div>
                 <div class="mb-3">
                     <label for="toDate" class="form-label">To Date</label>
                     <input type="text" class="form-control" id="toDate" required>
                 </div>
                 <div class="mb-3" id="halfDayToggleContainer" style="display: none;">
                     <label class="form-label">Is Half Day?</label>
                     <div class="form-check form-switch">
                         <input class="form-check-input" type="checkbox" id="isHalfDay">
                         <label class="form-check-label" for="isHalfDay">Toggle Half Day</label>
                     </div>
                 </div>
                 <div class="mb-3">
                     <label for="leaveReason" class="form-label">Leave Reason</label>
                     <textarea class="form-control" id="leaveReason" rows="3" required></textarea>
                 </div>
                 <div class="mb-3">
                     <label for="additionalInfo" class="form-label">Additional Information</label>
                     <input type="text" class="form-control" id="additionalInfo">
                 </div>
             </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="addLeaveForm" class="btn btn-primary">Add Leave</button>
          </div>
        </div>
      </div>
    </div>

    <script>
    $(document).ready(function() {
        // Initialize DataTable
        $('#leaveTable').DataTable();
		
     // Initialize date pickers
        $('#fromDate, #toDate').datepicker({
            format: 'dd/mm/yyyy',
            todayHighlight: true,
            autoclose: true
        });

        // Handle date selection
        $('#fromDate, #toDate').on('change', function() {
            const fromDate = new Date($('#fromDate').val());
            const toDate = new Date($('#toDate').val());
         // Calculate the difference in days
            const timeDiff = toDate - fromDate;
            const dayDiff = timeDiff / (1000 * 3600 * 24) + 1; // Adding 1 to include the start day

            // Show or hide the half-day toggle based on the number of days selected
            if (dayDiff === 1) {
                $('#halfDayToggleContainer').show();
            } else {
                $('#halfDayToggleContainer').hide();
                $('#isHalfDay').prop('checked', false); // Reset the toggle if more than one day
            }
        });

        // Handle form submission
        $('#submitLeave').on('click', function(event) {
            event.preventDefault(); // Prevent default form submission

            // Validate the form (you can add more validation as needed)
            if ($('#leaveForm')[0].checkValidity()) {
                // Gather form data
                const leaveData = {
                    leaveType: $('#leaveType').val(),
                    fromDate: $('#fromDate').val(),
                    toDate: $('#toDate').val(),
                    isHalfDay: $('#isHalfDay').is(':checked'),
                    leaveReason: $('#leaveReason').val(),
                    additionalInfo: $('#additionalInfo').val()
                };

                // Here you can send the leaveData to your server or handle it as needed
                console.log('Leave Application Data:', leaveData);

                // Close the modal after submission
                $('#leaveModal').modal('hide');
                // Optionally, reset the form
                $('#leaveForm')[0].reset();
                $('#halfDayToggleContainer').hide();
            } else {
                // If the form is invalid, show validation messages
                $('#leaveForm')[0].reportValidity();
            }
        });            
    });
    </script>
  </body>
</html>