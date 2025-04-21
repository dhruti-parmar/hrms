<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employees List | TalentWave</title>
    
    <sec:csrfMetaTags/>

    <!-- ========== All CSS files linkup ========= -->
    <%@include file="../common/header_css.jsp"%>
    
    <!-- Select2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css" rel="stylesheet" />
    
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
                  <h2>Employees List</h2>
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
                        Employees
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

          <!-- Add Employee Section -->
          <div class="row mb-30">
            <div class="col-lg-12 text-end">
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">
                <i class="lni lni-plus"></i> Add New Employee
              </button>
            </div>
          </div>

          <!-- Employees Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="employeesTable" class="table">
                      <thead>
                        <tr>
                          <th><h6>Index</h6></th>
                          <th><h6>Name</h6></th>
                          <th><h6>Email</h6></th>
                          <th><h6>Role</h6></th>
                          <th><h6>Department</h6></th>
                          <th><h6>Designation</h6></th>
                          <th><h6>Created At</h6></th>
                          <th><h6>Updated At</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${empty employees}">
                            <tr>
                              <td colspan="9" class="text-center">No employees found</td>
                            </tr>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="employee" items="${employees}" varStatus="loop">
                              <tr>
                                <td>
                                  <p class="text-sm">${loop.count}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${employee.name}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${employee.email}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${employee.role}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${employee.department.name}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${employee.designation.name}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${employee.createdAt}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${employee.updatedAt}</p>
                                </td>
                                <td>
                                  <div class="action">
                                    <button class="text-primary me-2" onclick="editEmployee(${employee.id}, '${employee.name}', '${employee.email}', '${employee.role}', ${employee.department.id}, ${employee.designation.id})">
                                      <i class="lni lni-pencil"></i>
                                    </button>
                                    <button class="text-danger" onclick="deleteEmployee(${employee.id})">
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
    
    <!-- Add Employee Modal -->
    <div class="modal fade" id="addEmployeeModal" tabindex="-1" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addEmployeeModalLabel">Add New Employee</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="addEmployeeForm" action="/admin/employees/create-employee" method="post">
              <div class="mb-3">
                <label for="employeeUser" class="form-label">Select User</label>
                <select class="form-select select2" id="employeeUser" name="user.id" required>
                  <option value="">Select User</option>
                  <c:forEach var="user" items="${users}">
                    <option value="${user.id}" data-email="${user.email}">${user.email}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="mb-3">
                <label for="employeeName" class="form-label">Name</label>
                <input type="text" class="form-control" id="employeeName" name="name" required>
              </div>
              <div class="mb-3">
                <label for="employeeEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="employeeEmail" name="email" required >
              </div>
              
              <div class="mb-3">
                <label for="employeeDepartment" class="form-label">Department</label>
                <select class="form-select" id="employeeDepartment" name="department.id" required>
                  <option value="" disabled selected>Select Department</option>
                  <c:forEach var="department" items="${departments}">
                    <option value="${department.id}">${department.name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="mb-3">
                <label for="employeeDesignation" class="form-label">Designation</label>
                <select class="form-select" id="employeeDesignation" name="designation.id" required>
                  <option value="" disabled selected>Select Designation</option>
                  <c:forEach var="designation" items="${designations}">
                    <option value="${designation.id}">${designation.name}</option>
                  </c:forEach>
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="addEmployeeForm" class="btn btn-primary">Add Employee</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit Employee Modal -->
    <div class="modal fade" id="editEmployeeModal" tabindex="-1" aria-labelledby="editEmployeeModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editEmployeeModalLabel">Edit Employee</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="editEmployeeForm" action="/admin/employees/update-employee" method="post">
              <input type="hidden" id="editEmployeeId" name="id">
              <div class="mb-3">
                <label for="editEmployeeName" class="form-label">Name</label>
                <input type="text" class="form-control" id="editEmployeeName" name="name" required>
              </div>
              <div class="mb-3">
                <label for="editEmployeeEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="editEmployeeEmail" name="email" required>
              </div>
              <div class="mb-3">
                <label for="editEmployeeDepartment" class="form-label">Department</label>
                <select class="form-select" id="editEmployeeDepartment" name="department.id" required>
                  <option value="" disabled selected>Select Department</option>
                  <c:forEach var="department" items="${departments}">
                    <option value="${department.id}">${department.name}</option>
                  </c:forEach>
                </select>
              </div>
              <div class="mb-3">
                <label for="editEmployeeDesignation" class="form-label">Designation</label>
                <select class="form-select" id="editEmployeeDesignation" name="designation.id" required>
                  <option value="" disabled selected>Select Designation</option>
                  <c:forEach var="designation" items="${designations}">
                    <option value="${designation.id}">${designation.name}</option>
                  </c:forEach>
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="editEmployeeForm" class="btn btn-primary">Update Employee</button>
          </div>
        </div>
      </div>
    </div>

    <!-- DataTable JS -->
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>
    
    <!-- Select2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script>
    $(document).ready(function() {
        // Initialize DataTable
        $('#employeesTable').DataTable({
            responsive: true,
            language: {
                search: "",
                searchPlaceholder: "Search employee...",
                lengthMenu: "Show _MENU_ entries",
                paginate: {
                    next: '<i class="lni lni-chevron-right"></i>',
                    previous: '<i class="lni lni-chevron-left"></i>'
                }
            }
        });
        
        // Initialize Select2 for the user dropdown in add employee form
        $('#employeeUser').select2({
            theme: 'bootstrap-5',
            width: '100%',
            placeholder: 'Search user...',
            allowClear: true,
            dropdownParent: $('#addEmployeeModal')
        });

        // Handle user selection in the add employee form
        $('#employeeUser').on('change', function() {
            const selectedOption = $(this).find('option:selected');
            const email = selectedOption.data('email');
            if (email) {
                $('#employeeEmail').val(email);
            }
        });
    });

    function editEmployee(id, name, email, role, departmentId, designationId) {
        $('#editEmployeeId').val(id);
        $('#editEmployeeName').val(name);
        $('#editEmployeeEmail').val(email);
        $('#editEmployeeRole').val(role);
        $('#editEmployeeDepartment').val(departmentId);
        $('#editEmployeeDesignation').val(designationId);
        $('#editEmployeeModal').modal('show');
    }
    
    function deleteEmployee(id) {
        if (confirm('Are you sure you want to delete this Employee?')) {
            window.location.href = '/admin/employees/delete-employee/' + id;
        }
    }

    function updateUserDetails(select) {
        const selectedOption = select.options[select.selectedIndex];
        const email = selectedOption.getAttribute('data-email');
        document.getElementById('employeeEmail').value = email;
    }
    </script>
  </body>
</html>