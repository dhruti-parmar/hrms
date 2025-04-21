<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Leave-Types | TalentWave</title>
    
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
                  <h2>Leave-Types List</h2>
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
                        Leave-Types
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

          <!-- Add Leave-Types Section -->
          <div class="row mb-30">
            <div class="col-lg-12 text-end">
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#addLeaveTypeModal">
                <i class="lni lni-plus"></i> Add New Leave-Types
              </button>
            </div>
          </div>

          <!-- Leave-Types Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="leaveTypesTable" class="table">
                      <thead>
                        <tr>
                          <th><h6>Index</h6></th>
                          <th><h6>Type</h6></th>
                          <th><h6>Description</h6></th>
                          <th><h6>Created At</h6></th>
                          <th><h6>Updated At</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${empty leaveTypes}">
                            <tr>
                              <td colspan="6" class="text-center">No leave types found</td>
                            </tr>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="leaveType" items="${leaveTypes}" varStatus="loop">
                              <tr>
                                <td>
                                  <p class="text-sm">${loop.count}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leaveType.type}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leaveType.description}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leaveType.createdAt}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leaveType.updatedAt}</p>
                                </td>
                                <td>
                                  <div class="action">
                                    <button class="text-primary me-2" onclick="editLeaveType(${leaveType.id}, '${leaveType.type}', '${leaveType.description}')">
                                      <i class="lni lni-pencil"></i>
                                    </button>
                                    <button class="text-danger" onclick="deleteLeaveType(${leaveType.id})">
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
    
    <!-- Add leave-types Modal -->
    <div class="modal fade" id="addLeaveTypeModal" tabindex="-1" aria-labelledby="addLeaveTypeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addLeaveTypeModalLabel">Add New Leave Type</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="addLeaveTypeForm" action="/admin/leave-types/create-leave-type" method="post">
              <div class="mb-3">
                <label for="leavetypeName" class="form-label">Type</label>
                <input type="text" class="form-control" id="leavetypeName" name="type" required>
              </div>
              <div class="mb-3">
                <label for="leavetypeDescription" class="form-label">Description</label>
                <textarea class="form-control" id="leavetypeDescription" name="description" rows="3"></textarea>
              </div>
            </form>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="addLeaveTypeForm" class="btn btn-primary">Add Leave Type</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit leave type Modal -->
    <div class="modal fade" id="editLeaveTypeModal" tabindex="-1" aria-labelledby="editLeaveTypeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editLeaveTypeModalLabel">Edit Leave-Type</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="editLeaveTypeForm" action="/admin/leave-types/update-leave-type" method="post">
              <input type="hidden" id="editLeaveTypeId" name="id">
              <div class="mb-3">
                <label for="editLeaveTypeName" class="form-label">Type</label>
                <input type="text" class="form-control" id="editLeaveTypeName" name="type" required>
              </div>
              <div class="mb-3">
                <label for="editLeaveTypeDescription" class="form-label">Description</label>
                <textarea class="form-control" id="editLeaveTypeDescription" name="description" rows="3"></textarea>
              </div>
            </form>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="editLeaveTypeForm" class="btn btn-primary">Update Leave Type</button>
          </div>
        </div>
      </div>
    </div>

    <!-- DataTable JS -->
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>

    <script>
    $(document).ready(function() {
        // Initialize DataTable
        $('#leaveTypesTable').DataTable({
            responsive: true,
            language: {
                search: "",
                searchPlaceholder: "Search leave-type...",
                lengthMenu: "Show _MENU_ entries",
                paginate: {
                    next: '<i class="lni lni-chevron-right"></i>',
                    previous: '<i class="lni lni-chevron-left"></i>'
                }
            }
        });
    });

    function editLeaveType(id, type, description) {
        $('#editLeaveTypeId').val(id);
        $('#editLeaveTypeName').val(type);
        $('#editLeaveTypeDescription').val(description);
        $('#editLeaveTypeModal').modal('show');
    }
    
    function deleteLeaveType(id) {
        if (confirm('Are you sure you want to delete this Leave-Type?')) {
            window.location.href = '/admin/leave-types/delete-leave-type/' + id;
        }
    }
    </script>
  </body>
</html>