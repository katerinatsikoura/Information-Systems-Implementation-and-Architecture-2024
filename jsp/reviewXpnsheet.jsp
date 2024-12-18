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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    
    <style>

        .f_cont{
            margin-top: 50px;
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
            vertical-align: middle; /* Vertical center image */
        }

        #head th, #row td{
            text-align: center; 
            vertical-align: middle;
            width: 14%; /* Set the width for each column */
            padding: 8px;
            box-sizing: border-box;
            white-space: nowrap; /* Prevent text from wrapping */
            overflow: hidden;
            text-overflow: ellipsis;
            line-height: 30px;
            max-height: 50px;
        }

        #row td{
            line-height: 58px;
        }

        /* Alert Container */
        .alertbox {
            padding: 15px 20px;
            margin: 10px 0;
            border: 1px solid transparent;
            border-radius: 4px;
            font-size: 16px;
            font-family: Arial, sans-serif;
            line-height: 1.5;
        }

        /* Danger (Error) Alert */
        .alertbox-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
            text-align: center;
        }  

    </style>
</head>

<body>
   
<jsp:include page="header.jsp" />

    <main>
    
<%
try {
	User user = (User)session.getAttribute("userObj"); 
    //User user = new User("Katerina Tsikoura", "kat@gmail.com", "Manager", "m000001");
	if (user == null) {
%>

    <div class="alertbox alertbox-danger" role="alert">You are not authorized to access this resource. Please login.</div>

<%
    } else {
        if (user.getRole().equals("Employee")) {
%>

    <div class="alertbox alertbox-danger" role="alert">You are not authorized to access this resource.</div>

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
                                                <th>ID</th>
                                                <th>User</th>
                                                <th>WBS</th>
                                                <th>Date</th>
                                                <th>Manager
                                                    <br>Approval</th>
                                                <th>Accounting
                                                    <br>Approval</th>
                                                <th>Final
                                                    <br>Approval</th>
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
                                                <td><%= u.getFullname() %></td>
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
%>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

<%
} catch (Exception e) {
    System.err.println("Error: " + e.getMessage());
    e.printStackTrace();
%>
            <div class="alertbox alertbox-danger" role="alert">Error retrieving expensesheets: <%= e.getMessage() != null ? e.getMessage() : "Unknown error" %></div>
<%
}
%>
        </div>

    </main>

</body>

</html>



                                                


