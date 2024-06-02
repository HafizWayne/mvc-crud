<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body, input, button {
            font-family: 'Poppins', sans-serif;
        }
        label {
            font-weight: 400; /* Menghilangkan huruf tebal */
        }
        .form-container {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            max-width: 400px;
        }
        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 4px;
            background-color: #00aaff; /* Warna tombol */
            color: white; /* Warna teks tombol */
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px; /* Added margin to separate buttons */
        }

        button:hover {
            background-color: #0088cc; /* Warna tombol saat di-hover */
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function validateForm(event) {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;
            if (password !== confirmPassword) {
                event.preventDefault(); // Prevent the form from submitting
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Password and confirm password do not match!',
                });
                return false;
            }
            return true;
        }
    </script>
</head>
<body class="bg-gray-100">
<div class="form-container bg-white rounded-md shadow-md overflow-hidden">
    <div class="p-8">
        <h2 class="text-2xl font-bold mb-4 text-center">Customer Registration</h2>
        <script>
            window.onload = function() {
                <%-- Success Message --%>
                <% if (request.getAttribute("successMessage") != null) { %>
                Swal.fire({
                    icon: 'success',
                    title: '<%= request.getAttribute("successMessage") %>',
                    showConfirmButton: false,
                    timer: 1500
                }).then(function() {
                    window.location = '<%= request.getContextPath() %>/customer/register';
                });
                <% } %>
                <%-- Error Message --%>
                <% if (request.getAttribute("errorMessage") != null) { %>
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: '<%= request.getAttribute("errorMessage") %>',
                });
                <% } %>
            };
        </script>
        <form action="${pageContext.request.contextPath}/customer/register" method="post" onsubmit="return validateForm(event)">
            <div class="mb-4">
                <label for="name" class="block text-gray-700 text-sm mb-2">Name</label>
                <input type="text" id="name" name="name" value="${customer.name}"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="email" class="block text-gray-700 text-sm mb-2">Email</label>
                <input type="email" id="email" name="email" value="${customer.email}"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="password" class="block text-gray-700 text-sm mb-2">Password</label>
                <input type="password" id="password" name="password"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="confirm_password" class="block text-gray-700 text-sm mb-2">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <button type="submit">
                Register
            </button>
        </form>
    </div>
</div>
</body>
</html>
