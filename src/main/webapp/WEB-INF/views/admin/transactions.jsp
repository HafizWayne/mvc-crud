<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
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
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #e2e8f0;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #cbd5e0;
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
                <li id="link-transactions" class="p-4 hover:bg-gray-700 active">
                    <a href="${pageContext.request.contextPath}/admin/transactions">See Transactions</a>
                </li>
                <li id="link-products" class="p-4 hover:bg-gray-700 ">
                    <a href="${pageContext.request.contextPath}/admin/products">Manage Products</a>
                </li>
                <li id="link-customers" class="p-4 hover:bg-gray-700">
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
            <h2 class="text-2xl font-bold mb-4">All Transactions</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                        <th>Purchase Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr>
                            <td>${transaction.id}</td>
                            <td>${transaction.customerName}</td>
                            <td>${transaction.productName}</td>
                            <td>${transaction.quantity}</td>
                            <td><fmt:formatNumber value="${transaction.totalPrice}" type="currency" currencySymbol="Rp. "/></td>
                            <td>${transaction.purchaseDate}</td>
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
