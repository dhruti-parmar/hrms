<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Designations | TalentWave</title>
    
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
                  <h2>Designations List</h2>
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
                        Designations
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

          <!-- Add Designation Section -->
          <div class="row mb-30">
            <div class="col-lg-12 text-end">
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#addDesignationModal">
                <i class="lni lni-plus"></i> Add New Designation
              </button>
            </div>
          </div>

          <!-- Designations Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="designationsTable" class="table">
                      <thead>
                        <tr>
                          <th><h6>Index</h6></th>
                          <th><h6>Designation Name</h6></th>
                          <th><h6>Created At</h6></th>
                          <th><h6>Updated At</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${empty designations}">
                            <tr>
                              <td colspan="5" class="text-center">No designations found</td>
                            </tr>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="designation" items="${designations}" varStatus="loop">
                              <tr>
                                <td>
                                  <p class="text-sm">${loop.count}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${designation.name}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${designation.createdAt}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${designation.updatedAt}</p>
                                </td>
                                <td>
                                  <div class="action">
                                    <button class="text-primary me-2" onclick="editDesignation(${designation.id}, '${designation.name}')">
                                      <i class="lni lni-pencil"></i>
                                    </button>
                                    <button class="text-danger" onclick="deleteDesignation(${designation.id})">
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
    
    <!-- Add Designation Modal -->
    <div class="modal fade" id="addDesignationModal" tabindex="-1" aria-labelledby="addDesignationModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addDesignationModalLabel">Add New Designation</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="addDesignationForm" action="/admin/designation/create-designation" method="post">
              <div class="mb-3">
                <label for="designationName" class="form-label">Designation Name</label>
                <input type="text" class="form-control" id="designationName" name="name" required>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="addDesignationForm" class="btn btn-primary">Add Designation</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit Designation Modal -->
    <div class="modal fade" id="editDesignationModal" tabindex="-1" aria-labelledby="editDesignationModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editDesignationModalLabel">Edit Designation</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="editDesignationForm" action="/admin/designation/update-designation" method="post">
              <input type="hidden" id="editDesignationId" name="id">
              <div class="mb-3">
                <label for="editDesignationName" class="form-label">Designation Name</label>
                <input type="text" class="form-control" id="editDesignationName" name="name" required>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="editDesignationForm" class="btn btn-primary">Update Designation</button>
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
        $('#designationsTable').DataTable({
            responsive: true,
            language: {
                search: "",
                searchPlaceholder: "Search designations...",
                lengthMenu: "Show _MENU_ entries",
                paginate: {
                    next: '<i class="lni lni-chevron-right"></i>',
                    previous: '<i class="lni lni-chevron-left"></i>'
                }
            }
        });
    });

    function editDesignation(id, name) {
        $('#editDesignationId').val(id);
        $('#editDesignationName').val(name);
        $('#editDesignationModal').modal('show');
    }

    function deleteDesignation(id) {
        if (confirm('Are you sure you want to delete this designation?')) {
            window.location.href = '/admin/designation/delete-designation/' + id;
        }
    }
    </script>
  </body>
</html>