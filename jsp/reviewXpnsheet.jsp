<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*" %>

<!DOCTYPE html>
<html lang="el">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Expensesheets</title>
    <link rel="icon" href="../images/Xpenser_logo.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        .b_el {
            width: 100%;
        }

        .box {
            margin: 80px 0 50px 0;
        }

        /* Εγκρίηθηκε */
        .approved img {
            display: none;
        }

        .approved img.active {
            display: block;
        }

        /* Review */
        .check {
            width: 15%;
        }

        .check .c_but {
            background-color: white;
            border: #26890dbd 2px solid;
            border-radius: 25px;
            box-shadow: 1px 1px 5px rgb(92, 92, 92);
            width: 180px;
            cursor: pointer;
        }

        .b_el {
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .b_el #text {
            color: #26890d;
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-size: 16px;
            padding-right: 5px;
            padding-left: 2px;
        }

        .c_but:hover {
            scale: 1.1 1.1;
            box-shadow: 0px 0px 5px #26890d;
        }

        .c_but {
            transition: all 0.2s ease;
        }

        .table td img {
            height: 37px;
        }
    </style>
</head>

<body>

    <header>

        <div class="header">

            <div class="head_left">
                <a href="index_Xpenser.html">
                    <ul class="head_left_l">
                    <li><img id="h_logo" src="../images/Xpenser_logo.png" alt="Xpenser logo"></li>
                    <li id="h_name">XPENSER</li>
                    </ul>
                </a>

                <div class="nav_bar">
                    <ul class="nav_l">
                        <a href="index_Xpenser.html"><li>Home</li></a>
                        <a href="postXpns.html"><li>Post Expense</li></a>
                        <a href="viewCurrentXpnsheet.html"><li>View Current Expensesheet</li></a>
                        <a href="reviewXpnsheet.html" id="current"><li>Review Expensesheets</li></a>
                        <a href="processXpnsheets.html"><li>View Processed Expensheets</li></a>
                    </ul>
                </div>
            </div>

            <div class="head_right">

                <div class="user">
                    <button id="us_menu">
                        <img id="us_icon" src="../images/User_Icon.png" alt="User">
                    </button>
                    <div class="us_opt">
                        <a href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

    </header>

    <main>

<%
try {
	User user = (User)session.getAttribute("userObj2024");
	if (user == null) {
%>

<div class="alert alert-danger text-center" role="alert">You are not authorized to access this resource. Please login.</div>

<%
    } else {
        if (user.getRole().equals("user")) {
%>

<div class="alert alert-danger text-center" role="alert">You are not authorized to access this resource.</div>

<%
        } else {
            ExpenseActions ea = new ExpenseActions();
            List<Expensesheet> expensesheets = ea.getExpensesheetsToReview();
%>
        <div class="main_cont">

            <div class="f_cont">
                <div class="form">
                    <ul class="box">
                        <li>
                            <div class="fh_cont">
                                <div class="f_head">Expensesheets to Review</div>
                            </div>
                            <div class="f_body">
                                <div class="table_cont">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Expensesheet ID</th>
                                                <th>User</th>
                                                <th>WBS</th>
                                                <th>Date</th>
                                                <th>Manager Approval</th>
                                                <th>Accounting Approval</th>
                                                <th>Final Approval</th>
                                            </tr>
                                        </thead>
                                        <tbody>
<%
            for (Expensesheet sheet: expensesheets) {
                User u = act.getUserFromExpensesheet(sheet);
                List<String> wbs = act.getWBSFromExpensesheet(sheet);
%>
                                            <tr>
                                                <td><%= sheet.getExpensesheetId() %></td>
                                                <td><%= u.getName() %></td>
                                                <td><%= String.join(", ", wbs) %></td>
                                                <td><%= sheet.getDate() %></td>
                                                <td><%= sheet.getStatus().get(0) %></td>
                                                <td><%= sheet.getStatus().get(1) %></td>
                                                <td><%= sheet.getStatus().get(2) %></td>
                                            </tr>
<%
            }
        }
    }
} catch (Exception e) {
    <div class="alert alert-danger text-center" role="alert">Error retrieving expensesheets: <%= e.getMessage() %></div>
}

%>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </main>

</body>

</html>



                                                


