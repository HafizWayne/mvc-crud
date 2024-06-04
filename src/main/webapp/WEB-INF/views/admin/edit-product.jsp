<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Product</h2>
        <form:form method="post" action="${pageContext.request.contextPath}/admin/products/update/${product.id}" modelAttribute="product" onsubmit="return validateForm();">
            <div class="form-group">
                <label for="name">Product Name:</label>
                <form:input path="name" id="name" cssClass="form-control"/>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" class="form-control" value="${product.price}" />
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <form:input path="quantity" id="quantity" cssClass="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form:form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        function validateForm() {
            var productName = document.getElementById('name').value.trim();
            if (productName === '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Product Name cannot be empty!',
                    confirmButtonText: 'Ok'
                });
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
