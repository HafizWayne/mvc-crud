<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
            margin-top: 10px;
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

        .error-message {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="header">
            <h2>Admin Login</h2>
        </div>
        <form class="login-form" action="/springmvc-crud/admin/transactions" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit">Masuk</button>
            <!-- Menampilkan pesan error jika ada -->
            <div class="error-message">
                <span th:if="${error}" th:text="${error}"></span>
            </div>
        </form>
        <div class="signup-link">
            Kembali Ke Login User? <a href="/springmvc-crud">Login</a>
        </div>
    </div>

    <script>
        function validateForm() {
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            if (username === 'admin' && password === 'admin') {
                return true;
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Username atau password salah!'
                });
                return false;
            }
        }
    </script>
</body>
</html>
