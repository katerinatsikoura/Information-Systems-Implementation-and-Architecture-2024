<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Review Expenses</title>
    <link rel="icon" href="<%=request.getContextPath() %>/images/Xpenser_logo.png">
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&display=swap" 
        rel="stylesheet">
    
    <style>
        .main_cont {
            flex-direction: column;
        } 

        .box {
            margin: 25px 0 50px 0;
        }

        /* Επιλογές */
        .options {
            width: 20%;
        }

        .opt {
            display: flex;
            align-items: center;
            justify-content: flex-end;
        }

        .opt input[type="radio"] {
            display: none;
        }

        .opt label {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            background-color: white;
            border-radius: 25px;
            box-shadow: 1px 1px 5px rgb(103, 103, 103);
            width: 100px;
            height: 35px;
            cursor: pointer;
            margin-right: 10px;
            transition: all 0.2s ease;
        }

        .opt label:hover {
            scale: 1.1;
        }

        .opt label[for^="reject"]:hover {
            box-shadow: 0 0 5px #e11919;
        }

        .opt label[for^="approve"]:hover {
            box-shadow: 0 0 5px #299a0d;
        }

        .opt label[for^="reject"] {
            color: #e11919;
            border: #e11919bc 2px solid;
        }

        .opt label[for^="approve"] {
            color: #299a0d;
            border: #2da70fbc 2px solid;
        }

        .opt input[id^="approve"]:checked~label[for^="approve"] {
            background-color: #2da70f;
            color: white;
        }

        .opt input[id^="reject"]:checked~label[for^="reject"] {
            background-color: #e61212;
            color: white;
        }

        .opt input[id^="reject"]:checked~.reason_cont .reason_input {
            cursor: pointer;
            pointer-events: auto;
            opacity: 1;
        }

        .reason_input {
            height: 35px;
            width: 150px;
            padding: 0 8px;
            font-family: inherit;
            border: #ce1414bc 2px solid;
            border-radius: 12px;
            box-shadow: 1px 1px 5px rgb(103, 103, 103);
            opacity: 0.6;
            pointer-events: none;
        }

        .reason_input:hover {
            scale: 1.05;
            box-shadow: 0 0 5px #e11919;
        }

        .reason_input:focus-visible {
            border: #e30a0a 2.5px solid;
            outline: none;
            box-shadow: 0 0 5px #e11919;
        }

        .reason_input::placeholder {
            color: #e11919;
        }

        /* Ενέργειες */
        .act_cont {
            height: 130px;
            flex-wrap: wrap;
            align-content: flex-end;
        }

        .actions {
            width: 70%;
        }

        /* align items center */
        .acts,
        .act_but,
        .b_el {
            align-items: center;
        }

        .acts {
            width: 100%;
            justify-items: center;
        }

        .act {
            width: 30%;
            padding-left: 30px;
        }

        .act_but {
            background-color: #26890d;
            border: #26890dbc 2px solid;
            border-radius: 25px;
            box-shadow: 1px 1px 5px rgb(71, 71, 71);
            height: 70px;
            width: 100%;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .but_text {
            font-size: 20px;
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-weight: bold;
            color: white;
            text-shadow: 1px 1px 5px rgb(71, 71, 71);
            padding-right: 10px;
        }

        .but_text#text2 {
            padding-right: 7px;
        }

        .but_icon {
            height: 35px;
        }

        .but_icon#icon2 {
            height: 42px;
        }

        .act_but:hover {
            scale: 1.1;
            background-color: #2da70f;
            border-color: #2da70fab;
            box-shadow: 2px 2px 5px #1f710a;
        }

        @media (max-width: 768px) {
            .f_cont {
                overflow-x: auto;
            }

            .table_cont {
                width: 100%;
                overflow-x: auto;
            }

            .table {
                font-size: 0.9rem;
            }

            .opt {
                justify-content: center;
            }   

            .reason_cont {
                margin-top: 10px;
            }

            .act_but {
                height: 50px;
                font-size: 16px;
            }

            .but_text {
                font-size: 16px;
            }

            .b_el {
                align-items: center;
            }
        }

    </style>
</head>

<body>

    <jsp:include page="header.jsp" />

    <main>

<%
try {
	User user = (User)session.getAttribute("userObj"); 
    
    if (user == null) {
%>

    <div class="alertbox alertbox-danger" role="alert">You are not authorized to access this resource. Please login.</div>
    <meta http-equiv="refresh" content="2;url=login.jsp">
<%
    } else {
%>

        <div class="main_cont">

            <div class="cont act_cont">
                <div class="actions">
                    <div class="acts">
                        <div class="act" id="save">
                            <a href="reviewXpnsheet.jsp">
                                <button class="act_but" id="save">
                                    <div class="b_el">
                                        <span class="but_text" id="text1">Save Draft</span>
                                        <img class="but_icon" src="images/Save_Icon.png" alt="Save Draft">
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="act" id="submit">
                            <a href="reviewXpnsheet.jsp">
                                <button class="act_but" id="submit">
                                    <div class="b_el">
                                        <span class="but_text" id="text2">Submit Expensheet</span>
                                        <img class="but_icon" id="icon2" src="images/Submit_Icon.png"
                                            alt="Submit Expensheet">
                                    </div>
                                </button>
                            </a>
                        </div>
                        <div class="act" id="print">
                            <a href="">
                                <button class="act_but" id="print">
                                    <div class="b_el">
                                        <span class="but_text">Print</span>
                                        <img class="but_icon" src="images/Print_Icon.png" alt="Print">
                                    </div>
                                </button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="cont f_cont">

                <div class="form">
                    <ul class="box">
                        <li>
                            <div class="fh_cont">
                                <div class="f_head">Expensesheet</div>
                            </div>
                            <div class="f_body">
                                <div class="table_cont">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Expense</th>
                                                <th>Amount (&euro;)</th>
                                                <th>Date</th>
                                                <th>WBS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Fuel</td>
                                                <td>40&euro;</td>
                                                <td>2024-05-01</td>
                                                <td>389</td>
                                                <td class="options">
                                                    <div class="opt">
                                                        <input type="radio" id="approve1" name="options1">
                                                        <input type="radio" id="reject1" name="options1">

                                                        <label for="approve1">Approve</label>
                                                        <label for="reject1">Reject</label>

                                                        <div class="reason_cont">
                                                            <input type="text" class="reason_input"
                                                                placeholder="Rejection Reason..." required>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
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