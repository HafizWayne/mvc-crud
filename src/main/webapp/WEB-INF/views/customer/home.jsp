<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- Include SweetAlert script -->
    <style>
        /* Styling for search input and buttons */
        .search-container {
            display: flex;
            align-items: center;
            border: 2px solid #E5E7EB;
            border-radius: 8px; /* Increased border-radius for better visibility */
            overflow: hidden;
            background-color: white;
            width: 100%;
            max-width: 700px; /* Slightly increased max-width */
            margin: 0 auto 2rem; /* Added margin-bottom */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.3); /* Added box-shadow for better visibility */
        }
        .search-input {
            border: none;
            padding: 12px; /* Increased padding */
            font-size: 16px;
            flex-grow: 1;
            outline: none;
            font-family: 'Poppins', sans-serif; /* Set font family to Poppins */
        }
        .search-button, .cart-button, .bell-button, .message-button {
            background-color: transparent; /* Removed black background */
            color: #4F4F4F; /* Set color to dark gray */
            padding: 12px; /* Increased padding */
            border: none;
            cursor: pointer;
        }
        .search-button svg, .cart-button svg, .bell-button svg, .message-button svg {
            width: 24px;
            height: 30px;
            stroke: #4F4F4F; /* Set stroke color to dark gray */
        }

        /* Font style */
        body {
            font-family: 'Poppins', sans-serif;
        }

        /* Alert style */
        .alert {
            position: fixed;
            top: 1rem;
            right: 1rem;
            z-index: 1000;
            padding: 1rem;
            background-color: #48BB78;
            color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: none;
        }
    </style>
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

    function showAlert(productName) {
        Swal.fire({
            icon: 'success',
            title: `${productName} added to cart!`,
            showConfirmButton: false,
            timer: 1500
        });
    }

    function addToCart(productName, productQuantity, productId) {
        const formData = new URLSearchParams();
        formData.append('productId', productId);

        fetch('${pageContext.request.contextPath}/customer/addtocart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: formData.toString()
        })
        .then(response => {
            if (response.ok) {
                showAlert(productName);
            } else {
                throw new Error('Failed to add product to cart');
            }
        })
        .catch(error => {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: error.message,
            });
        });

        return false; // Prevent default form submission
    }
</script>

<!-- Alert container -->
<div id="alert"></div>

<!-- Product card with onclick event -->

<div class="container mx-auto px-4 py-8">
    <!-- Alert -->
    <div id="alert" class="alert"></div>
    <!-- Kolom pencarian -->
    <form action="${pageContext.request.contextPath}/customer/home" method="GET" class="mb-4 flex justify-center">
        <div class="search-container">
            <input type="text" name="search" placeholder="Search For Products" class="search-input">
            <button type="submit" class="search-button">
                <!-- Icon menggunakan kaca pembesar -->
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
            </button>
            <a href="${pageContext.request.contextPath}/customer/cart" class="cart-button">
                <!-- Icon menggunakan keranjang belanja -->
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M6 6h15l-1.68 7.39a2 2 0 0 1-2 1.61H8.25a2 2 0 0 1-2-1.72L4 4H2"></path>
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                </svg>
            </a>
        </div>
    </form>

    <!-- Kategori Pilihan -->
    <h2 class="text-2xl font-bold mb-4">Kategori Pilihan</h2>

    <!-- Daftar Produk -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Product Cards -->
        <c:forEach items="${products}" var="product">
            <div class="bg-white p-4 rounded-lg shadow-md">
                <h2 class="text-xl font-bold mb-2"><c:out value="${product.name}" /></h2>
                <p class="text-gray-700 mb-2"><fmt:formatNumber value="${product.price}" type="currency" currencySymbol="Rp. " /></p>
                <p class="text-gray-500 mb-4">Quantity: <c:out value="${product.quantity}" /></p>

                <c:choose>
                    <c:when test="${product.quantity > 0}">
                        <button type="button" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600" onclick="addToCart('${product.name}', ${product.quantity}, ${product.id})">Add to Cart</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="w-full bg-gray-300 text-gray-600 py-2 rounded-lg cursor-not-allowed" disabled>Add to Cart</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
