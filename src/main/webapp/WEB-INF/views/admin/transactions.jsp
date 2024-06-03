<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transactions</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <nav class="bg-gray-800 text-white p-4">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-xl font-bold">Admin Panel</h1>
            <ul class="flex space-x-4">
                <li><a href="${pageContext.request.contextPath}/admin/products">Manage Products</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/customers">Manage Customers</a></li>
            </ul>
        </div>
    </nav>
    <div class="container mx-auto mt-8">
        <h1 class="text-3xl font-bold mb-4">Transactions</h1>
        <!-- Your content goes here -->
    </div>
</body>
</html>
