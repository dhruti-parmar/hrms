<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<!--
<head>
    <title>Register</title>
</head>
<body>
    <h2>Register</h2>
    <form action="/register" method="post">
        <div>
            <label for="username">Username:</label>
            <input type="text" name="username" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" required>
        </div>
        <div>
            <button type="submit">Register</button>
        </div>
    </form>
    <a href="/login">Login</a>
</body>
</html>

-->

<head>
    <meta charset="UTF-8">
    <title>Registration and Login System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Registration and Login System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>
<br />
<br />
<br />
<div class="container">
    <div class="row col-md-8 offset-md-2">
        <div class="card">
            <c:if test="${param.success}">
                <div class="alert alert-info">You've successfully registered
                    to our app!</div>
            </c:if>
            <div class="card-header">
                <h2 class="text-center">Registration</h2>
            </div>
            <div class="card-body">
                <form method="post" role="form" action="/register/save">

                    <div class="form-group mb-3">
                        <label class="form-label">First Name</label>
                        <input class="form-control"
                               id="firstName"
                               name="firstName"
                               placeholder="Enter first name"
                               type="text"
                        />
                        
                    </div>

                    <div class="form-group mb-3">
                        <label class="form-label">Last Name</label>
                        <input class="form-control"
                               id="lastName"
                               name="lastName"
                               placeholder="Enter last name"
                               type="text"
                        />
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Email</label>
                        <input class="form-control"
                               id="email"
                               name="email"
                               placeholder="Enter email address"
                               type="email"
                        />
                    </div>
                    <div class="form-group mb-3">
                        <label class="form-label">Password</label>
                        <input class="form-control"
                               id="password"
                               name="password"
                               placeholder="Enter password"
                               type="password"
                        />
                    </div>

                    <div class="form-group mb-3">
                        <button class="btn btn-primary" type="submit">Register</button>
                        <span>Already registered? <a href="login">Login
                             here</a></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>