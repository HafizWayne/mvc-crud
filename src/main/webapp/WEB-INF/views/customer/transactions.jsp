<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Transactions</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto mt-8">
        <h1 class="text-3xl font-bold mb-6 text-center">Your Transactions</h1>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-200">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="py-3 px-6 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th class="py-3 px-6 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Product Name</th>
                        <th class="py-3 px-6 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                        <th class="py-3 px-6 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Total Price</th>
                        <th class="py-3 px-6 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Purchase Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="transaction" items="${transactions}">
                        <tr class="bg-white border-b">
                            <td class="py-4 px-6 text-sm text-gray-900">${transaction.id}</td>
                            <td class="py-4 px-6 text-sm text-gray-900">${transaction.productName}</td>
                            <td class="py-4 px-6 text-sm text-gray-900">${transaction.quantity}</td>
                            <td class="py-4 px-6 text-sm text-gray-900"><fmt:formatNumber value="${transaction.totalPrice}" type="currency" currencySymbol="Rp. "/></td>
                            <td class="py-4 px-6 text-sm text-gray-900">${transaction.purchaseDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="mt-6 text-center">
            <a href="${pageContext.request.contextPath}/customer/home" class="text-blue-500 hover:underline">Back to Home</a>
        </div>
    </div>
</body>
</html>
