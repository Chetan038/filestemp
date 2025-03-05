<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Login</title>
    <link rel="stylesheet" href="/css/style.css">
    
    <!-- Prevent browser from caching the login page -->
 
</head>
<body>
    <h2>Login</h2>
    <form action="/login" method="post">
        <div>
            <label>Email:</label>
            <input type="email" name="email" required>
        </div>
        <div>
            <label>Password:</label>
            <input type="password" name="password" required>
        </div>
        <button type="submit">Login</button>
        <p th:if="${error}" th:text="${error}" style="color: red;"></p>
    </form>
    
</body>
</html>
make cool colour full css with rounded border and animation for this make css in this one file only 
