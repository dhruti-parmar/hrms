<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration and Login System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Registration and Login System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
	<h3> Welcome ${userdetail.username} <br/> <sec:authentication property="principal.authorities"/> <br/> <sec:authentication property="name"/></h3>
    <div class="row">
        <h1> Registered Users </h1>
    </div>
    <sec:authorize access="hasRole('ADMIN')">
	    <table class="table table-striped table-bordered table-hover">
	        <thead class="table-dark">
	            <tr>
	                <th>Name</th>
	                <th>Email</th>
	            </tr>
	        </thead>
	        <tbody>
	        	 <c:forEach var="user" items="${users}">
			        <tr>
		                <td>${user.name}</td>
		                <td>${user.email}</td>
		            </tr>
			    </c:forEach>
	        </tbody>
	    </table>
    </sec:authorize>
</div>
</body>
</html>