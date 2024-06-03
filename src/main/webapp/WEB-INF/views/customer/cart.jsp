<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <div class="container mx-auto mt-10">
        <div class="flex shadow-md my-10">
            <div class="w-3/4 bg-white px-10 py-10">
                <c:if test="${not empty success}">
                    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
                        <strong class="font-bold">Success!</strong>
                        <span class="block sm:inline">${success}</span>
                    </div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                        <strong class="font-bold">Error!</strong>
                        <span class="block sm:inline">${error}</span>
                    </div>
                </c:if>
                <div class="flex justify-between border-b pb-8">
                    <h1 class="font-semibold text-2xl">Shopping Cart</h1>
                </div>
                <div class="flex mt-10 mb-5">
                    <h3 class="font-semibold text-gray-600 text-xs uppercase w-2/5">Product Details</h3>
                    <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Quantity</h3>
                    <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Price</h3>
                    <h3 class="font-semibold text-center text-gray-600 text-xs uppercase w-1/5 text-center">Total</h3>
                </div>
                <div id="cart-items">
                    <c:forEach items="${cart}" var="item">
                        <div class="flex items-center hover:bg-gray-100 -mx-8 px-6 py-5">
                            <div class="flex w-2/5">
                                <div class="w-20"></div>
                                <div class="flex flex-col justify-between ml-4 flex-grow">
                                    <span class="font-bold text-sm">${item.productName}</span>
                                    <span class="text-red-500 text-xs">ID: ${item.productId}</span>
                                    <form action="${pageContext.request.contextPath}/customer/cart/delete" method="post">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <button type="submit" class="font-semibold hover:text-red-500 text-gray-500 text-xs">Remove</button>
                                    </form>
                                </div>
                            </div>
                            <div class="flex justify-center w-1/5">
                                <form action="${pageContext.request.contextPath}/customer/cart/update" method="post" class="flex">
                                    <input type="hidden" name="productId" value="${item.productId}">
                                    <input class="mx-2 border text-center w-8" type="number" name="quantity" value="${item.quantity}">
                                    <button type="submit" class="px-4 py-2 border rounded bg-gray-200">Update</button>
                                </form>
                            </div>
                            <span class="text-center w-1/5 font-semibold text-sm"><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="Rp. " /></span>
                            <span class="text-center w-1/5 font-semibold text-sm"><fmt:formatNumber value="${item.price * item.quantity}" type="currency" currencySymbol="Rp. " /></span>
                        </div>
                    </c:forEach>
                </div>
                <a href="${pageContext.request.contextPath}/customer/home" class="flex font-semibold text-indigo-600 text-sm mt-10">
                    <svg class="fill-current mr-2 text-indigo-600 w-4" viewBox="0 0 448 512"><path d="M134.059 296H336c13.255 0 24-10.745 24-24s-10.745-24-24-24H134.059l51.842-51.841c9.373-9.373 9.373-24.569 0-33.941-9.373-9.372-24.569-9.372-33.941 0l-96 96c-9.372 9.373-9.372 24.569 0 33.941l96 96c9.372 9.372 24.568 9.372 33.941 0 9.373-9.372 9.373-24.568 0-33.941L134.059 296z"/></svg>
                    Continue Shopping
                </a>
            </div>
            <div id="summary" class="w-1/4 px-8 py-10">
                <h1 class="font-semibold text-2xl border-b pb-8">Order Summary</h1>
                <div class="flex justify-between mt-10 mb-5">
                    <span class="font-semibold text-sm">Total</span>
                    <span class="font-semibold text-sm"><fmt:formatNumber value="${totalCost}" type="currency" currencySymbol="Rp. " /></span>
                </div>
                <form action="${pageContext.request.contextPath}/customer/cart/buy" method="post">
                    <button class="bg-indigo-500 font-semibold hover:bg-indigo-600 py-3 text-sm text-white uppercase w-full" type="submit">Checkout</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
