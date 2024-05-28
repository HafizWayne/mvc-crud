<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transactions</title>
</head>
<body>
    <h1>Transactions</h1>
    <a href="transactions/new">Add New Transaction</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Buyer</th>
            <th>Item</th>
            <th>Amount</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="transaction" items="${transactions}">
            <tr>
                <td>${transaction.id}</td>
                <td>${transaction.buyer}</td>
                <td>${transaction.item}</td>
                <td>${transaction.amount}</td>
                <td>
                    <a href="transactions/edit/${transaction.id}">Edit</a>
                    <a href="transactions/delete/${transaction.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="${pageContext.request.contextPath}/admin/products">Manage Products</a>
    <a href="${pageContext.request.contextPath}/admin/customers">Manage Customers</a>
</body>
</html>
