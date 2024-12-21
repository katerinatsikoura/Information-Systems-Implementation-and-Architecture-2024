<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="icon" href="<%=request.getContextPath() %>/images/Xpenser_logo.png">
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" 
        rel="stylesheet">
    

<style>
    .container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 80vh;
        padding: 20px;
        margin-top: 45px;
    }

    .row {
        display: flex;
        width: 100%;
        justify-content: center;
        margin-bottom: 20px;
    }

    .row .button {
        margin: 20px;
    }

    .row a {
        text-decoration: none;
    }

    .button {
        display: flex;
        justify-content: center;
        align-items: center;
        flex: 1;
        max-width: 425px;
        max-height: 200px;
        border: none;
        color: white;
        padding: 80px 70px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
        border-radius: 60px;
        font-family: 'Open Sans', sans-serif;
        font-size: 1.5rem;
        font-weight: 700;
        letter-spacing: -.24px;
        transition: all .2s ease;

        background-color: #26890d;
        border: #26890dbc 2px solid;
        box-shadow: 1px 1px 5px rgb(71, 71, 71);
    }

    .button:hover {
        background-color: #2fad0f;
        border: #2fad0fbc 2px solid;
        color: black;
        transform: scale(1.125);
    }

    .gif-image {
        max-width: 70px;
        max-height: 70px;
        margin-right: 20px;
    }
    @media (max-width: 768px) {
    .button {
        max-width: 100%;
        min-height: 70px;
        font-size: 1rem;
        padding: 10px;
    }

    .gif-image {
        max-width: 30px;
        max-height: 30px;
        margin-right: 5px;
    }
    }

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

            background-color: rgb(190, 38, 38);
            color: red;
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

    <jsp:include page="header.jsp" />

    <main>
        <div class="container">
            <div class="row">
<%
try {
	User user = (User)session.getAttribute("userObj"); 
	if (user == null) {
%>
        <div class="alertbox alertbox-danger">You are not authorized to access this resource. Please login.</div>
        <meta http-equiv="refresh" content="2;url=login.jsp">
<%
    } else {
        if (user.getRole().equals("Employee")) { 
%>
                <a href="postXpns.jsp"><button class="button">
                        <img src="images/Money.gif" alt="GIF Image" class="gif-image">
                        Post New Expense</button></a>
                <a href="viewCurrentXpnsheet.jsp"><button class="button">
                        <img src="images/Sheet.gif" alt="GIF Image" class="gif-image">
                        View Current Expensesheet</button></a>
            </div>
            <div class="row">
                
                <a href="processXpnsheets.jsp">
                    <button class="button">
                    <img src="images/Folder.gif" alt="GIF Image" class="gif-image">
                    View Processed Expensesheets</button></a>
<%      
        } else {
%>
                    <a href="reviewXpnsheet.jsp">
                    <button class="button">
                        <img src="images/Check.gif" alt="GIF Image" class="gif-image">
                        Review Expensesheets</button></a>
<%      }
    }
%>
            </div>
        </div>
    </main>
</body>

<%
} catch (Exception e) {
    System.err.println("Error: " + e.getMessage());
    e.printStackTrace();
%>
            <div class="alertbox alertbox-danger" role="alert">Error retrieving expensesheets: <%= e.getMessage() != null ? e.getMessage() : "Unknown error" %></div>
<%
}
%>

</html>