<!-- add_balance_form.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Balance</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

<div class="container mx-auto px-4 py-8">
    <div class="max-w-md mx-auto bg-white rounded-lg overflow-hidden shadow-md">
        <div class="text-center font-bold text-xl bg-blue-500 text-white py-2">Add Balance</div>
        <form action="${pageContext.request.contextPath}/customer/addbalance" method="post" class="p-6">
            <div class="mb-4">
                <label for="balance" class="block text-gray-700">Amount</label>
                <input type="number" id="balance" name="balance" class="w-full px-3 py-2 border rounded-lg" required>
            </div>
            <div class="flex justify-center">
                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600 mr-2">Add Balance</button>
                <a href="${pageContext.request.contextPath}/customer/home" class="bg-gray-300 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-400 ml-2">Back to Home</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
