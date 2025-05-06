<%@include file="../common/init.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>Manage Awards | TalentWave</title>
    
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
                                <h2>Manage Awards</h2>
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
                                            Awards
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

                <!-- Add Award Form -->
                <div class="row mb-30">
                    <div class="col-lg-12">
                        <div class="card-style mb-30">
                            <h6 class="mb-25">Add New Award</h6>
                            <form:form action="/admin/awards/create" method="POST" modelAttribute="newAward">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-style-1">
                                            <label>Employee</label>
                                            <select name="employeeId" class="form-select" required>
                                                <option value="">Select Employee</option>
                                                <c:forEach items="${employees}" var="employee">
                                                    <option value="${employee.id}">${employee.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-style-1">
                                            <label>Award Name</label>
                                            <form:input path="name" required="required" />
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="input-style-1">
                                            <label>Description</label>
                                            <form:textarea path="description" rows="3" required="required" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-style-1">
                                            <label>Date</label>
                                            <form:input path="date" type="date" required="required" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-style-1">
                                            <label>Status</label>
                                            <form:select path="status" required="required">
                                                <form:option value="ACTIVE">Active</form:option>
                                                <form:option value="INACTIVE">Inactive</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="main-btn primary-btn btn-hover">
                                            Add Award
                                        </button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>

                <!-- Awards List -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-style mb-30">
                            <h6 class="mb-25">All Awards</h6>
                            <div class="table-wrapper table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Employee</th>
                                            <th>Award Name</th>
                                            <th>Description</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${awards}" var="award">
                                            <tr>
                                                <td>${award.employee.name}</td>
                                                <td>${award.name}</td>
                                                <td>${award.description}</td>
                                                <td><fmt:formatDate value="${award.date}" pattern="dd/MM/yyyy"/></td>
                                                <td>${award.status}</td>
                                                <td>
                                                    <a href="/admin/awards/delete/${award.id}" class="text-danger" 
                                                       onclick="return confirm('Are you sure you want to delete this award?')">
                                                        <i class="lni lni-trash-can"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
</body>
</html>