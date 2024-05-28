<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Customer Details</h2>
        <p><strong>ID:</strong> ${customer.id}</p>
        <p><strong>Name:</strong> ${customer.name}</p>
        <p><strong>Balance:</strong> ${customer.balance}</p>

        <h3>Buy Product</h3>
        <form:form method="post" action="${pageContext.request.contextPath}/customers/buy">
            <div class="form-group">
                <label for="productId">Product:</label>
                <form:select path="productId" id="productId" cssClass="form-control">
                    <form:options items="${products}" itemValue="id" itemLabel="name"/>
                </form:select>
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <form:input path="quantity" id="quantity" cssClass="form-control"/>
            </div>
            <input type="hidden" name="customerId" value="${customer.id}" />
            <button type="submit" class="btn btn-primary">Buy</button>
        </form:form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
