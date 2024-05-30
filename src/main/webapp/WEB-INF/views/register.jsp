<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Register Customer</title>
</head>
<body>
    <h2>Register Customer</h2>
    <form th:action="@{/admin/customers/register}" th:object="${customer}" method="post">
        <div>
            <label>Name:</label>
            <input type="text" th:field="*{name}" />
        </div>
        <div>
            <label>Email:</label>
            <input type="email" th:field="*{email}" />
        </div>
        <div>
            <label>Balance:</label>
            <input type="number" th:field="*{balance}" />
        </div>
        <div>
            <button type="submit">Register</button>
        </div>
        <div th:if="${errorMessage}">
            <p th:text="${errorMessage}"></p>
        </div>
    </form>
</body>
</html>
