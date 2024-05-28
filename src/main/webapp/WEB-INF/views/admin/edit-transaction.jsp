<!DOCTYPE html>
<html>
<head>
    <title>Edit Transaction</title>
</head>
<body>
    <h1>Edit Transaction</h1>
    <form action="${pageContext.request.contextPath}/transactions/update/${transaction.id}" method="post">
        Buyer: <input type="text" name="buyer" value="${transaction.buyer}"><br>
        Item: <input type="text" name="item" value="${transaction.item}"><br>
        Amount: <input type="text" name="amount" value="${transaction.amount}"><br>
        <input type="submit" value="Update">
    </form>
</body>
</html>
