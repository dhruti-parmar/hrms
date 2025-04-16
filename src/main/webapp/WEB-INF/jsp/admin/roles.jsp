<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Roles | TalentWave</title>
    
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
                  <h2>Roles List</h2>
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
                        Roles
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

          <!-- Add Role Section -->
          <div class="row mb-30">
            <div class="col-lg-12 text-end">
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#addRoleModal">
                <i class="lni lni-plus"></i> Add New Role
              </button>
            </div>
          </div>

          <!-- Roles Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="rolesTable" class="table">
                      <thead>
                        <tr>
                          <th><h6>Name</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${empty roles}">
                            <tr>
                              <td colspan="2" class="text-center">No roles found</td>
                            </tr>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="role" items="${roles}">
                              <tr>
                                <td>
                                  <p class="text-sm">${role.name}</p>
                                </td>
                                <td>
                                  <div class="action">
                                    <button class="text-primary me-2" onclick="editRole(${role.id})">
                                      <i class="lni lni-pencil"></i>
                                    </button>
                                    <button class="text-danger" onclick="deleteRole(${role.id})">
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
    
    <!-- Add Role Modal -->
    <div class="modal fade" id="addRoleModal" tabindex="-1" aria-labelledby="addRoleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addRoleModalLabel">Add New Role</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="addRoleForm" action="/admin/roles/add" method="post">
              <div class="mb-3">
                <label for="name" class="form-label">Role Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="addRoleForm" class="btn btn-primary">Add Role</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit Role Modal -->
    <div class="modal fade" id="editRoleModal" tabindex="-1" aria-labelledby="editRoleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editRoleModalLabel">Edit Role</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="editRoleForm">
              <input type="hidden" id="editRoleId" name="id">
              <div class="mb-3">
                <label for="editName" class="form-label">Role Name</label>
                <input type="text" class="form-control" id="editName" name="name" required>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="submitEditForm()">Update Role</button>
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
        $('#rolesTable').DataTable({
            responsive: true,
            language: {
                search: "",
                searchPlaceholder: "Search roles...",
                lengthMenu: "Show _MENU_ entries",
                info: "Showing _START_ to _END_ of _TOTAL_ entries",
                infoEmpty: "Showing 0 to 0 of 0 entries",
                infoFiltered: "(filtered from _MAX_ total entries)",
                paginate: {
                    first: "First",
                    last: "Last",
                    next: "Next",
                    previous: "Previous"
                }
            },
            dom: '<"row"<"col-sm-12 col-md-6"l><"col-sm-12 col-md-6"f>>rt<"row"<"col-sm-12 col-md-6"i><"col-sm-12 col-md-6"p>>',
            pageLength: 10,
            lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
            order: [[0, 'asc']],
            processing: true,
            serverSide: false,
            searching: true,
            paging: true,
            info: true,
            columnDefs: [
            	{
            		targets: 1,
            		searchable: false,
            		orderable: false
            	}
            ]
        });

        // Style the DataTable elements
        $('.dataTables_length select').addClass('form-select');
        $('.dataTables_filter input').addClass('form-control');
        $('.dataTables_paginate .paginate_button').addClass('btn btn-sm');
        $('.dataTables_paginate .paginate_button.current').addClass('btn-primary');
        $('.dataTables_paginate .paginate_button:not(.current)').addClass('btn-outline-primary');

        // Get CSRF token from meta tag
        const csrfTokenElement = document.querySelector('meta[name="_csrf"]');
        const csrfHeaderElement = document.querySelector('meta[name="_csrf_header"]');

        if (csrfTokenElement && csrfHeaderElement) {
            const csrfToken = csrfTokenElement.getAttribute('content');
            const csrfHeader = csrfHeaderElement.getAttribute('content');

            console.log('CSRF Token:', csrfToken);
            console.log('CSRF Header:', csrfHeader);
        } else {
            console.error('CSRF meta tags not found');
        }
    });

    function editRole(roleId) {
        console.log('Edit role called with ID:', roleId);
        // Fetch role details and populate the edit form
        fetch(`/admin/roles/\${roleId}`, {
                headers: {
                    'Content-Type': 'application/json',
                }
            })
            .then(response => {
                console.log('Edit role response status:', response.status);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(role => {
                console.log('Role data received:', role);
                document.getElementById('editRoleId').value = role.id;
                document.getElementById('editName').value = role.name;
                $('#editRoleModal').modal('show');
            })
            .catch(error => {
                console.error('Error fetching role:', error);
                alert('Error fetching role details: ' + error.message);
            });
    }

    function submitEditForm() {
        console.log('Submit edit form called');
        const form = document.getElementById('editRoleForm');
        const formData = {
            id: form.id.value,
            name: form.name.value
        };

        console.log('Sending update request with data:', formData);

        fetch('/admin/roles/update', {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(formData)
            })
            .then(response => {
                console.log('Update response status:', response.status);
                if (!response.ok) {
                    return response.text().then(text => {
                        console.error('Update error response:', text);
                        throw new Error(text)
                    });
                }
                return response;
            })
            .then(() => {
                console.log('Update successful');
                $('#editRoleModal').modal('hide');
                location.reload();
            })
            .catch(error => {
                console.error('Error updating role:', error);
                alert('Error updating role: ' + error.message);
            });
    }

    function deleteRole(roleId) {
        console.log('Delete role called with ID:', roleId);
        if (confirm('Are you sure you want to delete this role?')) {
            fetch(`/admin/roles/\${roleId}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json',
                    }
                })
                .then(response => {
                    console.log('Delete response status:', response.status);
                    if (!response.ok) {
                        return response.text().then(text => {
                            console.error('Delete error response:', text);
                            throw new Error(text)
                        });
                    }
                    return response;
                })
                .then(() => {
                    console.log('Delete successful');
                    location.reload();
                })
                .catch(error => {
                    console.error('Error deleting role:', error);
                    alert('Error deleting role: ' + error.message);
                });
        }
    }
    </script>
  </body>
</html>