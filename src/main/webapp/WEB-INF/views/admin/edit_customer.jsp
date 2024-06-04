<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body>
    <div class="container mx-auto mt-10">
        <h1 class="text-2xl font-bold mb-5">Edit Customer</h1>
        <form:form method="post" action="${pageContext.request.contextPath}/admin/customers/update/${customer.id}" modelAttribute="customer" class="w-full max-w-lg" onsubmit="return validateForm();">
            <div class="mb-4">
                <label for="name" class="block text-gray-700 text-sm font-bold mb-2">Name:</label>
                <form:input path="name" id="name" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
            </div>
            <div class="mb-4">
                <label for="balance" class="block text-gray-700 text-sm font-bold mb-2">Balance:</label>
                <form:input path="balance" id="balance" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" />
            </div>
            <div class="flex items-center justify-between mt-4">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Save</button>
                <a href="${pageContext.request.contextPath}/admin/customers" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800 ml-2">Cancel</a>
            </div>
        </form:form>
    </div>

    <script>
        function validateForm() {
            var customerName = document.getElementById('name').value.trim();
            if (customerName === '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Customer Name cannot be empty!',
                    confirmButtonText: 'Ok'
                });
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
