<!DOCTYPE html>
<html>
<head>
    <title>New Transaction</title>
</head>
<body>
    <h1>New Transaction</h1>
    <form action="${pageContext.request.contextPath}/transactions" method="post">
        Buyer: <input type="text" name="buyer"><br>
        Item: <input type="text" name="item"><br>
        Amount: <input type="text" name="amount"><br>
        <input type="submit" value="Save">
    </form>
</body>
</html>
