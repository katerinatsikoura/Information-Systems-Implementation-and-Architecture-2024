<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.ExpenseActions" %>
<%@ page import="xpenser_classes.Expensesheet" %>
<%@ page import="xpenser_classes.User" %>

<% 
User signed = (User) session.getAttribute("userObj");
if (signed == null) {
    request.setAttribute("message", "You are not authorized to access this resource. Please login.");
    %> <jsp:forward page="login.jsp" /> <% 
    return; }
%>

<!DOCTYPE html>
<html lang="el">

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
        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 60%;
            height: 100%;
            margin: 80px 0;
        }

        .title {
            padding: 20px 0 40px 0;
            text-align: center;
            border-bottom: 2px solid rgba(211, 211, 211);
        }

        .form {
            width: 100%;
            padding: 50px 0;
            display: flex;
        }

        .cont,
        .form-group {
            display: flex;
            flex-direction: column;
        }

        .cont {
            width: 50%;
        }

        .form-group {
            width: 100%;
            align-items: center;
            margin-bottom: 30px;
        }

        .form-group label {
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-size: 1.2rem;
            margin-bottom: 5px;
        }

        .form-group .inputtext{
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-size: 1.2rem;
            margin-bottom: 5px;
            line-height: 29px;
            padding: 10px;
            border: 1px solid #000000;
            border-radius: 5px;
            box-sizing: border-box;
            width: 80%;
        }

        .button-cont {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .form-group button,
        .button-cont button {
            background-color: #26890d;
            border: #26890dbc 2px solid;
            box-shadow: 1px 1px 5px rgb(92, 92, 92);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2rem;
        }

        .form-group button:hover,
        .button-cont button:hover {
            background-color: #2fad0f;
            transform: scale(1.025);
        }

        .right-cont {
            grid-column: span 1;
        }

        .right-cont input,
        .right-cont button,
        .right-conta textarea {
            margin-bottom: 20px;
            width: 150%;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 40px;
            }

            .form-group {
                margin-bottom: 10px;
            }

            .form-group label {
                font-size: 0.8rem;
            }

            input,
            select,
            textarea {
                font-size: 0.8rem;
                padding: 6px;
            }

            button {
                font-size: 0.8rem;
                padding: 6px 10px;
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
                
                <div class="nav_bar">
                    <ul class="nav_l">
                        <a href="index_Xpenser.jsp"><li>Home</li></a>
                        <a href="postXpns.jsp" id="current"><li>Post Expense</li></a>
                        <a href="viewCurrentXpnsheet.jsp"><li>View Current Expensesheet</li></a>
                        <a href="processXpnsheets.jsp"><li>View Processed Expensheets</li></a>
                    </ul>
                </div>
            </div>

            <div class="head_right">

                <div class="user">
                    <button id="us_menu">
                        <img id="us_icon" src="images/User_Icon.png" alt="User">
                    </button>
                    <div class="us_opt">
                        <a href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </div>

    </header>
    <main>

        <div class="main_cont">

            <div class="form-container">

                <h2 class="title">Expense Form</h2>

                <form class="form" action="postXpnsController.jsp" method="get" enctype="multipart/form-data">
                    <div class="cont">

                        <div class="form-group">
                            <label for="date">Date:</label>
                            <input type="date" class="inputtext" id="date" name="xpnsdate" value="2024-01-01" min="2024-01-01">
                        </div>

                        <div class="form-group">
                            <label for="expense-type">Choose Expense Type:</label>
                            <select class="inputtext" id="expense-type" name="expense-type" required>
                                <option value="">--Choose--</option>
                                <option value="fuel">Fuel</option>
                                <option value="parking">Parking</option>
                                <option value="travel">Travel</option>
                                <option value="meal">Meal</option>
                                <option value="fare">Toll</option>
                                <option value="transportation">Taxi/Public Transport</option>
                                <option value="other">Other</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="amount">Amount (&euro;):</label>
                            <input type="number" class="inputtext" id="amount" name="amount" min="0" step="0.1" required>
                        </div>

                        <div class="form-group">
                            <label for="receipt">Post Expense Receipt (pdf,word,jpeg...):</label>
                            <input type="file" class="inputtext" id="receipt" name="receipt" required>
                        </div>
                    </div>
                    <div class="cont">
                        <div class="form-group">
                            <label for="wbs">Corresponding WBS:</label>
                            <input type="text" class="inputtext" id="wbs-search" name="wbs-search" placeholder="Search WBS..."
                                required>
                        </div>

                        <div class="form-group">
                            <label for="comments">Comments:</label>
                            <textarea class="inputtext" id="comments" name="comments" rows="4"
                                placeholder="Addiotional Comments..."></textarea>
                        </div>

                        <div class="button-cont">
                            <button type="submit">Continue</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</body>

</html>




