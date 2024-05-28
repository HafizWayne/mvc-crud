<!-- src/main/resources/templates/login.html -->
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>CRUD Operations - Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('your-background-image.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            padding: 20px;
        }
        .login-box {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-header {
            margin-bottom: 20px;
            font-size: 2em;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h1 class="login-header text-center">CRUD OPERATIONS</h1>
            <form id="loginForm">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">SIGN IN</button>
            </form>
            <div class="text-center mt-3">
                <a href="#" class="reset">Forgot your password? Reset Password</a>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;
            if (email === 'test@gmail.com' && password === '12345678') {
                window.location.href = '/transactions';
            } else {
                alert('Invalid email or password');
            }
        });
    </script>
</body>
</html>
