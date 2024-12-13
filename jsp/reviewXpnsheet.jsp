<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*, java.util.*" %>

<!DOCTYPE html>
<html lang="el">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Review Expensesheets</title>
    <link rel="icon" href="<%=request.getContextPath() %>/images/Xpenser_logo.png">
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
    <!-- Bootstrap core CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">	
	<!-- Bootstrap Optional theme -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    
    <style>
    /* Header Customization */
#h_logo {
    height: 50px;
}

#h_name {
    font-family: 'Open Sans', sans-serif;
    font-weight: 700;
    font-size: 2.5rem;
    color: #26890d;
    text-shadow: 2px 1px 2px #185705;
}

/* Active Link */
.navbar-nav .nav-link.active {
    color: #2cb709 !important;
}

.navbar-nav .nav-link:hover {
    color: #2cb709 !important;
    border-bottom: 3px solid #2cb709;
    transition: 0.3s;
}

/* User Icon */
#us_menu img {
    height: 30px;
    border-radius: 50%;
}

/* Dropdown Menu */
.dropdown-menu {
    background-color: grey;
}

.dropdown-item:hover {
    background-color: rgb(167, 165, 165);
    color: white;
}

        #h_logo{
            padding: 10px;
        }

        .b_el {
            width: 100%;
        }

        .box {
            margin: 80px 0 50px 0;
        }

        /* Review */
        #row .check {
            width: 12%;
            padding-right: 16px;
        }

        .check .c_but {
            line-height: 100%;
            width: 100%;
            background-color: white;
            border: #26890dbd 2px solid;
            border-radius: 25px;
            box-shadow: 1px 1px 5px rgb(92, 92, 92);
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
            height: 35px;
        }

        #head th, #row td{
            text-align: center; 
            vertical-align: middle;
            line-height: 50px;
        }

    </style>
</head>

<body>
    <!--
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span> <span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
                <!-- Brand ->
                <a class="navbar-brand d-flex align-items-center" href="index_Xpenser.html">
                    <img src="<%=request.getContextPath() %>/images/Xpenser_logo.png" alt="Xpenser logo" id="h_logo" class="me-2" style="height: 40px;">
                    <span id="h_name" class="fw-bold">XPENSER</span>
                </a>
            </div>
            
            <!-- Navigation Links ->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="nav navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="index_Xpenser.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="postXpns.html">Post Expense</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewCurrentXpnsheet.html">View Current Expensesheet</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="reviewXpnsheet.html" aria-current="page">Review Expensesheets</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="processXpnsheets.html">View Processed Expensheets</a>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                <!-- User Section ->
                <div class="dropdown">
                    <button class="btn btn-light dropdown-toggle" type="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="<%=request.getContextPath() %>/images/User_Icon.png" alt="User" id="us_icon" style="height: 30px;">
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userMenu">
                        <li><a class="dropdown-item" href="login.html">Logout</a></li>
                    </ul>
                </ul>
                </div>
            </div>
        </div>
    </nav>
    
    <header>

        <div class="header">

            <div class="head_left">
                <a href="index_Xpenser.html">
                    <ul class="head_left_l">
                    <li><img id="h_logo" src="<%=request.getContextPath() %>/images/Xpenser_logo.png" alt="Xpenser logo"></li>
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
                        <img id="us_icon" src="<%=request.getContextPath() %>/images/User_Icon.png" alt="User">
                    </button>
                    <div class="us_opt">
                        <a href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

    </header>
-->
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-black fixed-top">
        <div class="container-fluid">
            <!-- Left Section: Logo and Name -->
            <a href="index_Xpenser.html" class="navbar-brand d-flex align-items-center">
                <img id="h_logo" src="<%=request.getContextPath() %>/images/Xpenser_logo.png" alt="Xpenser logo" class="me-2">
                <span id="h_name">XPENSER</span>
            </a>

            <!-- Navigation Bar -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a href="index_Xpenser.html" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="postXpns.html" class="nav-link">Post Expense</a>
                    </li>
                    <li class="nav-item">
                        <a href="viewCurrentXpnsheet.html" class="nav-link">View Current Expensesheet</a>
                    </li>
                    <li class="nav-item">
                        <a href="reviewXpnsheet.html" class="nav-link active" aria-current="page">Review Expensesheets</a>
                    </li>
                    <li class="nav-item">
                        <a href="processXpnsheets.html" class="nav-link">View Processed Expensheets</a>
                    </li>
                </ul>
            </div>

            <!-- Right Section: User Menu -->
            <div class="dropdown">
                <button id="us_menu" class="btn btn-dark dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <img id="us_icon" src="<%=request.getContextPath() %>/images/User_Icon.png" alt="User">
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a href="login.html" class="dropdown-item">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

    <main>
    
<%
try {
	//User user = (User)session.getAttribute("userObj2024"); 
    User user = new User(0, "katerina", "kater", 123456, "manager");
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
            if (expensesheets == null || expensesheets.isEmpty()) {
                System.out.println("No expensesheets to review.");
            } else {
                System.out.println("Expensesheets retrieved: " + expensesheets.size());
            }
            
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
                                            <tr id="head">
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
                User u = ea.getUserFromExpensesheet(sheet);
                List<Integer> wbs = ea.getWBSFromExpensesheet(sheet);
%>
                                            <tr id="row">
                                                <td><%= sheet.getExpensesheetId() %></td>
                                                <td><%= u.getName() %></td>
                                                <td><%= wbs.toString().replaceAll("[\\[\\]]", "") %></td>
                                                <td><%= sheet.getDate() %></td>
                                                <td><%= ea.getStatusIcon(sheet.getStatus().get(0), request.getContextPath()) %></td>
                                                <td><%= ea.getStatusIcon(sheet.getStatus().get(1), request.getContextPath()) %></td>
                                                <td><%= ea.getStatusIcon(sheet.getStatus().get(2), request.getContextPath())%></td>                                                                 
                                                <td class="check">
<%
                if (sheet.getStatus().get(2)!= 0 && sheet.getStatus().get(2)!= 1) {
%>
                                                    <a href="approveXpns.html">
                                                    <button class="c_but">
                                                        <div class="b_el">
                                                            <span id="text">Review</span>
                                                            <img id="icon" src="<%=request.getContextPath() %>/images/Check_Icon.png" alt="Review">
                                                        </div>
                                                    </button>
                                                    </a>
                                                </td>
                                            </tr>
<%
                }
            }
        }
    }
} catch (Exception e) {
    System.err.println("Error: " + e.getMessage());
    e.printStackTrace();
%>
    <div class="alert alert-danger text-center" role="alert">Error retrieving expensesheets: <%= e.getMessage() != null ? e.getMessage() : "Unknown error" %></div>
<%
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



                                                


