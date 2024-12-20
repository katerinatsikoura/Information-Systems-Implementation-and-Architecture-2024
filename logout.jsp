<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log Out</title>
    <meta http-equiv="refresh" content="2;url=login.jsp" />
    <link rel="icon" href="images/Xpenser_logo.png">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
        <style>
             .message-container {
    width: 70%;
    max-width: 600px;
    margin-top: 180px;
    margin-right: auto;
    margin-bottom: 30px;
    margin-left: auto;
    padding: 30px;
    border-radius: 15px;
    font-family: 'Open Sans', sans-serif;
    color: white;
    font-size: 30px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
    animation: popIn 0.7s ease-in-out;
}
.success-message {

background-color: #caf4c5;
color: #26890d;
text-align: center;
box-shadow: 0 4px 8px rgba(134, 190, 144, 0.877);
}
@keyframes fadeIn {
    0% {
        opacity: 0;
        transform: translateY(-30px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}


@keyframes popIn {
    0% {
        opacity: 0;
        transform: scale(0.9);
    }
    100% {
        opacity: 1;
        transform: scale(1);
    }
}
        </style>
</head>
<body>
    <header>
        <div class="header">
            <div class="head_left">
                <a href="index_Xpenser.jsp">
                    <ul class="head_left_l">
                        <li><img id="h_logo" src="images/Xpenser_logo.png" alt="Xpenser logo"></li>
                        <li id="h_name">XPENSER</li>
                    </ul>
                </a>
            </div>
        </div>
    </header>
    <div class="message-container success-message">
        <p><b>Successful Logout.</b></p>
    </div>
</body>
</html>