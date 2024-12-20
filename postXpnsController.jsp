<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.Expense" %>
<%@ page import="xpenser_classes.ExpenseActionstest" %>
<%@ page import="xpenser_classes.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post New Expense</title>
    <link rel="icon" href="images/Xpenser_logo.png">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <style>
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 30px;
            height: 100vh;
            margin: 0;
            flex-direction: column;
            text-align: center;
        }

        .message-container {
    width: 70%;
    max-width: 600px;
    margin-top: 20px;
    margin-bottom: 30px;
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
    box-shadow: 0 4px 8px rgba(134, 190, 144, 0.877);
}

.error-message {
        border: 2px solid #ff4d4d;
        background-color: #fff0f0;
        color: #ff3333;
        box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);
        
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




        a {
            text-decoration: none;
            color: #ffffff;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .button-container a {
            padding: 15px 30px;
            font-size: 1.1rem;
            font-weight: bold;
            border-radius: 25px;
            color: #fff;
            background-color: #26890d;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
        }

        .button-container a:hover {
            background-color: #2fad0f;
            transform: translateY(-5px);
        }

        .button-container a.go-home {
            background-color:#26890d;
        }

        .button-container a.view {
            background-color: #26890d;
        }


        .button-container a.go-home:hover {
            background-color:#26890d;
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

<%
    User signed = (User) session.getAttribute("userObj");
    if (signed == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        %>
        <jsp:forward page="login.jsp" />
        <%
        return;
    }

    String message = null;
    String messageType = null;

    try {
        String date = request.getParameter("xpnsdate");
        String type = request.getParameter("expense-type");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String receipt = request.getParameter("receipt");
        String wbs_search = request.getParameter("wbs-search");
        String comments = request.getParameter("comments");

        String passkey = signed.getPasskey();
        Expense expense = new Expense(date, amount, type, wbs_search, receipt, comments);

        ExpenseActionstest act = new ExpenseActionstest();
        act.saveExpense(expense, date, passkey);

        message = "Expense saved successfully!";
        messageType = "success";
    } catch (Exception e) {
        message = "An unexpected error occurred: " + e.getMessage();
        messageType = "error";
    }
%>

<div class="message-container <%= messageType.equals("success") ? "success-message" : "error-message" %>">
    <p><b><%= message %></b></p>
</div>

<div class="button-container">
    <a href="postXpns.jsp">Add New Expense</a>
    <a href="viewCurrentXpnsheet.jsp" class="view">View My Expensesheet</a>
    <a href="index_Xpenser.jsp" class="go-home">Go to Homepage</a>
</div>    

</body>
</html>
