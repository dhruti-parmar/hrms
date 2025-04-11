<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="admin/assets/images/logo.png" type="image/x-icon" />
    <title>Users | TalentWave</title>
    
    <sec:csrfMetaTags/>

    <!-- ========== All CSS files linkup ========= -->
    <%@include file="header_css.jsp"%>
  </head>
  <body>
    <!-- ======== Preloader =========== -->
    <div id="preloader">
      <div class="spinner"></div>
    </div>
    <!-- ======== Preloader =========== -->

    <!-- ======== sidebar-nav start =========== -->
    <%@include file="sidebar.jsp"%>
    <!-- ======== sidebar-nav end =========== -->

    <!-- ======== main-wrapper start =========== -->
    <main class="main-wrapper">
      <!-- ========== header start ========== -->
      <%@include file="header.jsp"%>
      <!-- ========== header end ========== -->

      <!-- ========== section start ========== -->
      <section class="section">
        <div class="container-fluid">
          <!-- ========== title-wrapper start ========== -->
          <div class="title-wrapper pt-30">
            <div class="row align-items-center">
              <div class="col-md-6">
                <div class="title">
                  <h2>Users List</h2>
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
                        Users
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

          <!-- Search and Add User Section -->
          <div class="row mb-30">
            <div class="col-lg-6">
              <div class="search-style-2">
                <form action="/users" method="get">
                  <input type="text" name="search" placeholder="Search users..." value="${param.search}" />
                  <button type="submit"><i class="lni lni-search-alt"></i></button>
                </form>
              </div>
            </div>
            <div class="col-lg-6 text-end">
              <button class="main-btn primary-btn btn-hover" data-bs-toggle="modal" data-bs-target="#addUserModal">
                <i class="lni lni-plus"></i> Add New User
              </button>
            </div>
          </div>

          <!-- Users Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th><h6>Name</h6></th>
                          <th><h6>Email</h6></th>
                          <th><h6>Action</h6></th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${empty users}">
                            <tr>
                              <td colspan="3" class="text-center">No users found</td>
                            </tr>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="user" items="${users}">
                              <tr>
                                <td>
                                  <p class="text-sm">${user.name}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${user.email}</p>
                                </td>
                                <td>
                                  <div class="action">
                                    <button class="text-primary me-2" onclick="editUser(${user.id})">
                                      <i class="lni lni-pencil"></i>
                                    </button>
                                    <button class="text-danger" onclick="deleteUser(${user.id})">
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

          <!-- Pagination -->
          <div class="pagination-wrapper">
            <nav aria-label="Page navigation">
              <ul class="pagination">
                <c:forEach begin="1" end="${totalPages}" var="i">
                  <li class="page-item ${currentPage == i ? 'active' : ''}">
                    <a class="page-link" href="/users?page=${i}&search=${param.search}">${i}</a>
                  </li>
                </c:forEach>
              </ul>
            </nav>
          </div>
        </div>
        <!-- end container -->
      </section>
      <!-- ========== section end ========== -->

      <!-- ========== footer start =========== -->
      <%@include file="footer.jsp"%>
      <!-- ========== footer end =========== -->
    </main>
    <!-- ======== main-wrapper end =========== -->
    <%@include file="footer_js.jsp"%>
    
    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="addUserForm" action="/users/add" method="post">
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
              </div>
              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
              </div>
              <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <select class="form-control" id="role" name="role" required>
                  <option value="ROLE_ADMIN">Admin</option>
                  <option value="ROLE_USER">User</option>
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" form="addUserForm" class="btn btn-primary">Add User</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form id="editUserForm">
              <input type="hidden" id="editUserId" name="id">
              <div class="mb-3">
                <label for="editName" class="form-label">Name</label>
                <input type="text" class="form-control" id="editName" name="name" required>
              </div>
              <div class="mb-3">
                <label for="editEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="editEmail" name="email" required>
              </div>
              <div class="mb-3">
                <label for="editRole" class="form-label">Role</label>
                <select class="form-control" id="editRole" name="role" required>
                  <option value="ROLE_ADMIN">Admin</option>
                  <option value="ROLE_USER">User</option>
                </select>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" onclick="submitEditForm()">Update User</button>
          </div>
        </div>
      </div>
    </div>

    <script>
    $(document).ready(function() {
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

    function editUser(userId) {
        console.log('Edit user called with ID:', userId);
        // Fetch user details and populate the edit form
        fetch(`/users/\${userId}`, {
                headers: {
                    'Content-Type': 'application/json',
                }
            })
            .then(response => {
                console.log('Edit user response status:', response.status);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(user => {
                console.log('User data received:', user);
                document.getElementById('editUserId').value = user.id;
                document.getElementById('editName').value = user.name;
                document.getElementById('editEmail').value = user.email;
                document.getElementById('editRole').value = user.role;
                $('#editUserModal').modal('show');
            })
            .catch(error => {
                console.error('Error fetching user:', error);
                alert('Error fetching user details: ' + error.message);
            });
    };

    function submitEditForm() {
        console.log('Submit edit form called');
        const form = document.getElementById('editUserForm');
        const formData = {
            id: form.id.value,
            name: form.name.value,
            email: form.email.value,
            role: form.role.value
        };

        console.log('Sending update request with data:', formData);

        fetch('/users/update', {
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
                $('#editUserModal').modal('hide');
                location.reload();
            })
            .catch(error => {
                console.error('Error updating user:', error);
                alert('Error updating user: ' + error.message);
            });
    }

    function deleteUser(userId) {
        console.log('Delete user called with ID:', userId);
        if (confirm('Are you sure you want to delete this user?')) {
            fetch(`/users/\${userId}`, {
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
                    console.error('Error deleting user:', error);
                    alert('Error deleting user: ' + error.message);
                });
        }
    }
    </script>
  </body>
</html>