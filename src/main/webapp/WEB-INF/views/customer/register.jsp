<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;
            if (password !== confirmPassword) {
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
<body class="bg-gray-100 flex justify-center items-center h-screen">
<div class="max-w-md w-full bg-white rounded-md shadow-md overflow-hidden">
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
        <form action="${pageContext.request.contextPath}/customer/register" method="post" onsubmit="return validateForm()">
            <div class="mb-4">
                <label for="name" class="block text-gray-700 text-sm font-bold mb-2">Name:</label>
                <input type="text" id="name" name="name" value="${customer.name}"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="email" class="block text-gray-700 text-sm font-bold mb-2">Email:</label>
                <input type="email" id="email" name="email" value="${customer.email}"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="password" class="block text-gray-700 text-sm font-bold mb-2">Password:</label>
                <input type="password" id="password" name="password"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <div class="mb-4">
                <label for="confirm_password" class="block text-gray-700 text-sm font-bold mb-2">Confirm Password:</label>
                <input type="password" id="confirm_password" name="confirm_password"
                       class="w-full px-3 py-2 border rounded-md focus:outline-none focus:border-blue-500">
            </div>

            <button type="submit"
                    class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600">
                Register
            </button>
        </form>
    </div>
</div>
</body>
</html>
