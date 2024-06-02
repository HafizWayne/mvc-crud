<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.css">
    <style>
        /* Reset some basic styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #f3f4f6;
            font-family: 'Poppins', sans-serif;
            margin: 0;
        }

        .login-container {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            padding: 50px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header h2 {
            margin: 0;
            color: #333333;
        }

        .admin-button {
            background-color: transparent;
            border: none;
            color: #00aaff;
            cursor: pointer;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        .admin-button:hover {
            color: #0088cc;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #dddddd;
            border-radius: 4px;
            font-size: 16px;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #00aaff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px; /* Added margin to separate buttons */
        }

        button:hover {
            background-color: #0088cc;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
        }

        .signup-link a {
            color: #00aaff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .signup-link a:hover {
            color: #0088cc;
        }

        .login-container .google-login {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            cursor: pointer;
        }

        .login-container .google-login img {
            margin-right: 10px;
        }

        .login-container .google-login span {
            color: #555555;
            font-size: 16px;
        }

        .additional-links {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .additional-links a {
            color: #00aaff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="header">
            <h2>Masuk</h2>
           <a href="/springmvc-crud/admin/transactions" class="admin-button">Admin</a>
        </div>
        <form class="login-form" action="/springmvc-crud/customer/login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Masuk</button>
            <div class="additional-links">
                <a href="#">Lupa Kata Sandi?</a>
            </div>
        </form>
        <div class="google-login">
            <img src="https://developers.google.com/identity/images/g-logo.png" alt="Google Logo" width="20">
            <span>Google</span>
        </div>
        <div class="signup-link">
            Belum punya akun ? <a href="/springmvc-crud/customer/register">Daftar</a>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const errorMessage = '<%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>';
            if (errorMessage) {
                swal("Login Failed", errorMessage, "error");
            }
        });
    </script>
</body>
</html>
