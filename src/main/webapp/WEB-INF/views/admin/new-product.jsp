<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function formatPrice(input) {
            let value = input.value.replace(/\./g, '');
            value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            input.value = value;
        }

        function validateForm() {
            let priceInput = document.getElementById("price");
            priceInput.value = priceInput.value.replace(/\./g, '');
            return true;
        }

        window.onload = function() {
            let priceInput = document.getElementById("price");
            if (priceInput) {
                formatPrice(priceInput);
            }
        }
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2>New Product</h2>
        <form:form method="post" action="${pageContext.request.contextPath}/admin/products" modelAttribute="product" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="name">Product Name:</label>
                <form:input path="name" id="name" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" class="form-control" value="${product.price}" oninput="formatPrice(this)" />
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <form:input path="quantity" id="quantity" cssClass="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
