<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Customer</title>
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
            height: 100vh;
            background: #f3f4f6;
            font-family: 'Poppins', sans-serif; /* Use Poppins font */
            margin: 0;
        }

        .register-container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 40px;
            max-width: 400px;
            width: 100%;
        }

        .register-form h2 {
            margin-bottom: 20px;
            color: #333333;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
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
            font-family: 'Poppins', sans-serif; /* Use Poppins font */
        }

        .form-group .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-family: 'Poppins', sans-serif; /* Use Poppins font */
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
    <!-- Include Sweet Alert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <div class="register-container">
        <form class="register-form" id="registerForm" th:action="@{/register}" th:object="${customer}" method="post">
            <h2>Register Customer</h2>
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" th:field="*{name}" required />
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" th:field="*{email}" required />
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" th:field="*{password}" required minlength="8" maxlength="12" />
                <div class="error-message" id="passwordError"></div>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" th:field="*{confirmPassword}" required minlength="8" maxlength="12" />
                <div class="error-message" id="confirmPasswordError"></div>
            </div>
            <button type="submit">Register</button>
            <div th:if="${errorMessage}" class="error-message">
                <p th:text="${errorMessage}"></p>
            </div>
            <div th:if="${successMessage}" class="success-message">
                <p th:text="${successMessage}"></p>
            </div>
        </form>
    </div>
    <script>
        // Function to show Sweet Alert
        function showSuccessAlert() {
            Swal.fire({
                icon: 'success',
                title: 'Registration Successful!',
                text: 'Thank you for registering.',
                showConfirmButton: false,
                timer: 2000 // Close the alert after 2 seconds
            });
        }

        // Add event listener to form submission
        document.getElementById('registerForm').addEventListener('submit', function(event) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const passwordError = document.getElementById('passwordError');
            const confirmPasswordError = document.getElementById('confirmPasswordError');

            // Reset error messages
            passwordError.textContent = '';
            confirmPasswordError.textContent = '';

            if (password.length < 8 || password.length > 12) {
                passwordError.textContent = 'Password must be between 8 and 12 characters.';
                event.preventDefault(); // Prevent form submission
            } else if (password !== confirmPassword) {
                confirmPasswordError.textContent = 'Passwords do not match.';
                event.preventDefault(); // Prevent form submission
            } else {
                // Show success alert if validation passes
                showSuccessAlert();
            }
        });
    </script>
</body>
</html>
