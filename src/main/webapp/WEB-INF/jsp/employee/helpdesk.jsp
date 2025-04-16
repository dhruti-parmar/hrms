<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HelpDesk | TalentWave</title>
    
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
                  <h2>HelpDesk List</h2>
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
                        HelpDesk
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
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#addHelpDeskModal">
                <i class="lni lni-plus"></i> Add Ticket
              </button>
            </div>
          </div>

          <!-- Users Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="helpDeskTable" class="table">
                      <thead>
                        <tr>
                          <th>Index</th>
                          <th>Department</th>
                          <th>Comment</th>                          
                          <th>Status</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${empty helpDeskItems}">
                            <tr>
                              <td colspan="8" class="text-center">No HelpDesk ticket found</td>
                            </tr>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="helpDesk" items="${helpDeskItems}" varStatus="loop">
                              <tr>
									<td>
									  <p class="text-sm">${loop.count}</p>
									</td> 
                                <td>
                                  <p class="text-sm">${helpDesk.department.name}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${helpDesk.comment}</p>
                                </td>                                
                                <td>
                                  <p class="text-sm">${helpDesk.status}</p>
                                </td>
                                <td>
                                  <div class="action">
                                    <button class="text-danger" onclick="cancelHelpDesk(${helpDesk.id})">
                                      <i class="lni lni-trash-can"></i>
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
    
    <!-- Add HelpDesk Modal -->
    <div class="modal fade" id="addHelpDeskModal" tabindex="-1" aria-labelledby="addHelpDeskModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addHelpDeskModalLabel">Add Ticket</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="helpDeskForm" action="/helpDesk/create" method="post">
                 <div class="mb-3">
                     <label for="helpDeskType" class="form-label">Departments</label>
                     <select class="form-select" id="helpDeskType" required>
                         <option value="" disabled selected>Select Departments</option>
                         <option value="1">Administration</option>
                         <option value="2">Human Resources</option>
                         <option value="3">IT Support/Help Desk</option>
                         <option value="4">Software Development</option>
                         <option value="5">Sales and Marketing</option>
                         <option value="6">Finance/Accounting</option>
                     </select>
                 </div>
                 <div class="mb-3">
                     <label for="additionalInfo" class="form-label">Comment</label>
                     <input type="text" class="form-control" id="comment">
                 </div>
             </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="addHelpDeskForm" class="btn btn-primary">Submit</button>
          </div>
        </div>
      </div>
    </div>

    <script>
    $(document).ready(function() {
        // Initialize DataTable
        $('#usersTable').DataTable();
    });
    </script>
  </body>
</html>