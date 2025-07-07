<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | Student Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
			background:url('/img/sm_background.jpg');
            /*background: linear-gradient(135deg, #2980b9, #6dd5fa);*/
            font-family: 'Roboto', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            width: 350px;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2c3e50;
        }

        .login-box input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .login-box button {
            width: 100%;
            padding: 12px;
            background-color: #2980b9;
            color: #fff;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-box button:hover {
            background-color: #1c5980;
        }

        .message {
            color: red;
            font-size: 14px;
            text-align: center;
        }

        .success {
            color: green;
        }
    </style>

    <script>
        function validateForm() {
            let username = document.forms["loginForm"]["username"].value;
            let password = document.forms["loginForm"]["password"].value;
            if (username === "" || password === "") {
                alert("Both fields are required.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

    <div class="login-box">
        <h2>Login</h2>
        <form name="loginForm" action="/students/doLogin" method="post" onsubmit="return validateForm()">
            <input type="text" name="username" placeholder="Username" />
            <input type="password" name="password" placeholder="Password" />
            <button type="submit">Login</button>

            <c:if test="${not empty error}">
                <p class="message">${error}</p>
            </c:if>
        </form>
    </div>

</body>
</html>
