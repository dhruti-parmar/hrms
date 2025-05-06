<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Leave Approvals | TalentWave</title>
    
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
                  <h2>Leave Approvals</h2>
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
                        Leave Approvals
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

          <!-- Alert Messages -->
<%--           <c:if test="${not empty param.success}"> --%>
<!--             <div class="alert alert-success alert-dismissible fade show" role="alert"> -->
<!--               Leave application processed successfully! -->
<!--               <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> -->
<!--             </div> -->
<%--           </c:if> --%>
<%--           <c:if test="${not empty param.error}"> --%>
<!--             <div class="alert alert-danger alert-dismissible fade show" role="alert"> -->
<%--               ${param.error} --%>
<!--               <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> -->
<!--             </div> -->
<%--           </c:if> --%>

          <!-- Leave Approvals Table -->
          <div class="tables-wrapper">
            <div class="row">
              <div class="col-lg-12">
                <div class="card-style mb-30">
                  <div class="table-wrapper table-responsive">
                    <table id="leaveApprovalsTable" class="table">
                      <thead>
                        <tr>
                          <th>Index</th>
                          <th>Employee</th>
                          <th>Leave Type</th>
                          <th>From Date</th>
                          <th>To Date</th>
                          <th>Days</th>
                          <th>Half Day</th>
                          <th>Reason</th>
                          <th>Status</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:choose>
                          <c:when test="${empty leaveApplications}">
                            <tr>
                              <td colspan="10" class="text-center">No leave applications pending</td>
                            </tr>
                          </c:when>
                          <c:otherwise>
                            <c:forEach var="leave" items="${leaveApplications}" varStatus="loop">
                              <tr>
                                <td>
                                  <p class="text-sm">${loop.count}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.employee.name}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.leaveType.type}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.startDate}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.endDate}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.days}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.isHalfDay ? 'Yes' : 'No'}</p>
                                </td>
                                <td>
                                  <p class="text-sm">${leave.comment}</p>
                                </td>
                                <td>
                                  <span class="status-badge ${leave.status.toLowerCase()}">${leave.status}</span>
                                </td>
                                <td>
                                  <div class="action">
                                    <c:if test="${leave.status == 'Pending'}">
                                      <form action="${pageContext.request.contextPath}/admin/leaves/approve/${leave.id}" method="post" style="display:inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="text-success me-2" title="Approve">
                                          <i class="lni lni-checkmark-circle"></i>
                                        </button>
                                      </form>
                                      <form action="${pageContext.request.contextPath}/admin/leaves/reject/${leave.id}" method="post" style="display:inline;">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="text-danger" title="Reject">
                                          <i class="lni lni-cross-circle"></i>
                                        </button>
                                      </form>
                                    </c:if>
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

    <script>
    $(document).ready(function() {
        // Initialize DataTable
        $('#leaveApprovalsTable').DataTable({
            responsive: true,
            language: {
                search: "",
                searchPlaceholder: "Search leave applications...",
                lengthMenu: "Show _MENU_ entries",
                paginate: {
                    next: '<i class="lni lni-chevron-right"></i>',
                    previous: '<i class="lni lni-chevron-left"></i>'
                }
            }
        });
    });
    </script>
  </body>
</html>