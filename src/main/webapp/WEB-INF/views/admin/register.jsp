<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>

<body>
    <div class="container">
        <h2 class="mt-5">Register</h2>
        <form:form action="/register" method="post" modelAttribute="user" class="mt-3">
            <div class="form-group">
                <label>Email:</label>
                <form:input type="email" path="email" required="true" class="form-control"/>
            </div>
            <div class="form-group">
                <label>Password:</label>
                <form:input type="password" path="password" required="true" class="form-control"/>
            </div>
            <div class="form-group">
                <label>Confirm Password:</label>
                <form:input type="password" path="confirmPassword" required="true" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form:form>
    </div>
</body>
