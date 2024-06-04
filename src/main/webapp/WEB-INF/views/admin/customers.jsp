<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
        .sidebar {
            width: 250px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .main-content {
            margin-left: 250px;
        }
        .active {
            background-color: #4A5568; /* Tailwind color for bg-gray-700 */
        }
    </style>
</head>
<body class="bg-gray-100 flex">
    <!-- Sidebar -->
    <div class="sidebar bg-gray-800 text-white h-screen fixed">
        <div>
            <div class="p-4">
                <h1 class="text-xl font-bold">Admin Panel</h1>
            </div>
            <ul class="mt-6">
                <li id="link-transactions" class="p-4 hover:bg-gray-700">
                    <a href="${pageContext.request.contextPath}/admin/transactions">See Transactions</a>
                </li>
                <li id="link-products" class="p-4 hover:bg-gray-700">
                    <a href="${pageContext.request.contextPath}/admin/products">Manage Products</a>
                </li>
                <li id="link-customers" class="p-4 hover:bg-gray-700 active">
                    <a href="${pageContext.request.contextPath}/admin/customers">Manage Customers</a>
                </li>
            </ul>
        </div>
        <div>
            <ul>
                <li class="p-4 hover:bg-gray-700">
                    <a href="${pageContext.request.contextPath}/admin/products/logout" class="flex items-center">
                        <i class="fas fa-sign-out-alt mr-2"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content flex-1 p-8">
        <div class="container">
            <h2 class="text-2xl font-bold mb-4">Customers</h2>
            <table class="min-w-full bg-white shadow-md rounded overflow-hidden">
                <thead class="bg-gray-800 text-white">
                    <tr>
                        <th class="py-2 px-4">ID</th>
                        <th class="py-2 px-4">Name</th>
                        <th class="py-2 px-4">Balance</th>
                        <th class="py-2 px-4">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customers}">
                        <tr class="border-b">
                            <td class="py-2 px-4">${customer.id}</td>
                            <td class="py-2 px-4">${customer.name}</td>
                            <td class="py-2 px-4"><fmt:formatNumber value="${customer.balance}" type="currency" currencySymbol="Rp. " /></td>
                            <td class="py-2 px-4">
                                <a href="${pageContext.request.contextPath}/admin/customers/edit/${customer.id}" class="bg-yellow-500 text-white px-3 py-1 rounded inline-block">Edit</a>
                                <a href="${pageContext.request.contextPath}/admin/customers/delete/${customer.id}" class="bg-red-500 text-white px-3 py-1 rounded inline-block" onclick="return confirm('Are you sure you want to delete this customer?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- JavaScript to Set Active Link -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const path = window.location.pathname;
            if (path.includes('/admin/products')) {
                document.getElementById('link-products').classList.add('active');
            } else if (path.includes('/admin/customers')) {
                document.getElementById('link-customers').classList.add('active');
            } else if (path.includes('/admin/transactions')) {
                document.getElementById('link-transactions').classList.add('active');
            }
        });
    </script>
</body>
</html>
