<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Receipt</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto mt-10">
        <div class="bg-white p-10 shadow-md">
            <h1 class="text-2xl font-semibold mb-5">Receipt</h1>
            <div>
                <p>Customer: ${receipt.customer.name}</p>
                <p>Total Cost: <fmt:formatNumber value="${receipt.totalCost}" type="currency" currencySymbol="Rp. " /></p>
            </div>
            <div class="mt-5">
                <h2 class="text-xl font-semibold mb-2">Items</h2>
                <c:forEach items="${receipt.cartItems}" var="item">
                    <div class="flex justify-between border-b py-2">
                        <span>${item.productName}</span>
                        <span>${item.quantity} x <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="Rp. " /></span>
                    </div>
                </c:forEach>
            </div>
            <button onclick="window.print()" class="bg-indigo-500 text-white px-4 py-2 mt-5">Print Receipt</button>
            <a href="${pageContext.request.contextPath}/customer/home" class="bg-gray-500 text-white px-4 py-2 mt-5">Continue Shopping</a>
        </div>
    </div>
</body>
</html>
