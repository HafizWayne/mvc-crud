<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script>
        function showNotification(message) {
            alert(message);
        }

        function addToCart(productName, quantity) {
            if (quantity <= 0) {
                showNotification("Product " + productName + " is out of stock.");
                return false; // Prevent form submission
            } else {
                showNotification("Product " + productName + " added to cart successfully.");
                return true; // Allow form submission
            }
        }

    </script>

       <!-- Display success message -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">
                ${message}
            </div>
        </c:if>

        <!-- Display error message -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
        </c:if>
</head>
<body class="bg-gray-100">
 <nav class="bg-white shadow-md">
     <div class="container mx-auto px-4 py-2 flex justify-between items-center">
         <a href="#" class="text-xl font-bold text-blue-500">Mobile Shop</a>
         <span class="text-gray-700 px-3">Welcome, <c:out value="${customer.name}" /></span>
         <span class="text-gray-700 px-3">Balance: Rp. <c:out value="${customer.balance}" /></span>
         <a href="${pageContext.request.contextPath}/customer/addbalance" class="text-gray-700 hover:text-blue-500 px-3">Add Balance</a>
         <a href="#" class="text-gray-700 hover:text-blue-500 px-3">Home</a>
         <a href="#" class="text-gray-700 hover:text-blue-500 px-3">Products</a>
         <a href="${pageContext.request.contextPath}/customer/cart" class="text-gray-700 hover:text-blue-500 px-3">Cart</a>
         <div class="relative inline-block text-left">
             <a href="#" class="text-gray-700 hover:text-blue-500 px-3" onclick="toggleDropdown()">Profile</a>
             <!-- Dropdown Menu -->
             <div id="dropdownMenu" class="hidden origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 focus:outline-none" role="menu" aria-orientation="vertical" aria-labelledby="options-menu">
                 <div class="py-1" role="none">
                     <!-- Add logout link -->
                     <a href="${pageContext.request.contextPath}/customer/home/logout" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100" role="menuitem">Logout</a>
                 </div>
             </div>
             <!-- End Dropdown Menu -->
         </div>
     </div>
 </nav>

<script>
    function toggleDropdown() {
        const dropdownMenu = document.getElementById('dropdownMenu');
        dropdownMenu.classList.toggle('hidden');
    }
</script>


    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold mb-6">Available Products</h1>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <!-- Product Cards -->
            <c:forEach items="${products}" var="product">
                <div class="bg-white p-4 rounded-lg shadow-md">
                    <h2 class="text-xl font-bold mb-2"><c:out value="${product.name}" /></h2>
                    <p class="text-gray-700 mb-2"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="Rp. " /></p>
                    <p class="text-gray-500 mb-4">Quantity: <c:out value="${product.quantity}" /></p>
                    <form action="${pageContext.request.contextPath}/customer/addtocart" method="post" onsubmit="return addToCart('${product.name}', ${product.quantity})">
                        <!-- Add product ID as hidden input -->
                        <input type="hidden" name="productId" value="${product.id}" />
                        <button type="submit" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600">Add to Cart</button>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
