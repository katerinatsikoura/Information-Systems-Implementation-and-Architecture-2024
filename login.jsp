<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="icon" href="images/Xpenser_logo.png">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <style>
        
        .login-container,
        .login-header {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .login-container{
            justify-content: flex-start;
            height: 100vh;
            background-color: #f5f5f5;
        }

        .login-header {
            margin-bottom: 20px;
            margin-top: 20px;
        }

        #logo {
            height: 150px;
        }

        #name {
            padding: 0;
            font-family: 'Open Sans', sans-serif;
            font-weight: 700;
            font-size: 4rem;
            color: #26890d;
            text-shadow: 1px 1px 2px #185705;
        }

        .authorize {
            margin-bottom: 10px;
            margin-top: 20px;
        }

        .login-box {
            background-color: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 1px 1px 15px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-box .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .login-box .form-group label {
            padding: 4px;
            display: block;
            font-size: 0.9rem;
        }

        .login-box .form-group input {
            width: 92.5%;
            padding: 10px;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .login-box .button-cont {
            margin-top: 20px;
        }

        .login-box button {
            width: 100%;
            padding: 10px;
            background-color: #26890d;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-box button:hover {
            background-color: #2fad0f;
        }
        .login-box #new_user{
            margin-top: 20px;    
        }
        .login-box #register{
            color: #26890d;
        }
        .error-message {
        border: 2px solid #ff4d4d;
        background-color: #fff0f0;
        color: #ff3333;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 12px;
        font-family: 'Open Sans', sans-serif;
        font-size: 1rem;
        text-align: center;
        box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);
        animation: fadeIn 0.5s ease-out;
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    </style>
</head>
<body>

    <div class="login-container">
        <div class="authorize">
            <% if(request.getAttribute("message") != null && request.getAttribute("message").equals("You are not authorized to access this resource. Please login.")) { %>		
                <div class="error-message text-center"><%= (String) request.getAttribute("message") %></div>
            <% } %>
        </div>
       
        <div class="login-header">
            <img id="logo" src="images/Xpenser_logo.png" alt="Xpenser logo">
            <span id="name">XPENSER</span>
        </div>
        
        <div class="login-box" role="main">
            
            <form class="form-signin" method="post" action="loginController.jsp">
                <% if(request.getAttribute("message") != null && !request.getAttribute("message").equals("You are not authorized to access this resource. Please login.")) { %>		
                    <div class="error-message text-center"><%= (String) request.getAttribute("message") %></div>
                <% } %>
                <div class="form-group" style="text-align: center;">
                    <label for="passkey" style="color: green; font-size: 30px;">
                        <b>User's Passkey</b>
                    </label>
                    <input type="text" id="passkey" name="passkey" placeholder="enter your passkey" required>
                </div>
                
                
                <div class="button-cont">
                    <button>Sign In</button>
                </div>
                <div id="new_user"> New user? <a href="register.jsp" id="register">Register now</a></div>
            </form>
        </div>
    </div>

</body>
</html>
