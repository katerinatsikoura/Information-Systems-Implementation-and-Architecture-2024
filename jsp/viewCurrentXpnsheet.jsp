<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="el">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Current Expensesheet</title>
    <link rel="icon" href="../images/Xpenser_logo.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <style>
        .f_cont {
            width: 60%;
        }

        .cont {
            margin: 25px;
        }

        .form {
            width: 100%;
        }

        .box {
            margin: 55px 0 50px 0;
        }

        /* Edit */
        .edit {
            width: 15%;
        }

        .edit .e_but {
            background-color: #26890d;
            border: #26890dbc 2px solid;
            border-radius: 25px;
            box-shadow: 1px 1px 5px rgb(92, 92, 92);
            width: 140px;
            cursor: pointer;
        }

        .b_el {
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .b_el #text {

            color: white;
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-size: 16px;
            padding-right: 5px;
            padding-left: 2px;
        }

        .b_el #icon {
            height: 37px;
        }

        .e_but:hover {
            scale: 1.1 1.1;
            background-color: #2da70f;
            border-color: #2da70fab;
            box-shadow: 2px 2px 5px #1f710a;
        }

        /* Ενέργειες */
        .act_cont {
            width: 18%;
            position: relative;
        }

        .actions {
            width: 18%;
            position: fixed;
            top: calc(50% + 35px);
            transform: translateY(-50%);
        }

        .acts {
            flex-direction: column;
        }

        /* align items center */
        .acts,
        .act_but {
            align-items: center;
        }

        .act {
            width: 100%;
            padding-bottom: 20px;
        }

        .act_but {
            background-color: #26890d;
            border: #26890dbc 2px solid;
            border-radius: 25px;
            box-shadow: 1px 1px 5px rgb(71, 71, 71);
            width: 100%;
            height: 70px;
            cursor: pointer;
        }

        .act_but#submit {
            opacity: 0.6;
            cursor: not-allowed;
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

        .act_but:not(#submit):hover {
            scale: 1.1 1.1;
            background-color: #2da70f;
            border-color: #2da70fab;
            box-shadow: 2px 2px 5px #1f710a;
        }

        .act_but,
        .e_but {
            transition: all 0.2s ease;
        }
        @media (max-width: 480px) {
    .f_cont, .act_cont {
        width: 100%;
    }

    .form {
        width: calc(100% - 20px);
        padding: 0 10px;
    }

    .table_cont {
        width: 100%;
        overflow-x: auto;
    }

    .table {
        width: 100%;
        font-size: 0.8rem;
    }

    .table th, .table td {
        padding: 8px 5px;
    }

    .edit {
        width: 100%;
        text-align: center;
    }

    .edit .e_but {
        width: 100px;
        font-size: 0.8rem;
        padding: 5px 10px;
    }

    .actions {
        width: 100%;
        margin-top: 20px;
    }

    .act_but {
        width: calc(100% - 20px);
        padding: 10px;
        font-size: 1rem;
    }
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
                        <a href="viewCurrentXpnsheet.html" id="current"><li>View Current Expensesheet</li></a>
                        <a href="reviewXpnsheet.html"><li>Review Expensesheets</li></a>
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
        <div class="main_cont">

            <div class="cont f_cont">
                <div class="form">
                    <ul class="box">
                        <li>
                            <div class="fh_cont">
                                <div class="f_head">Expensheet</div>
                            </div>
                            <div class="f_body">
                                <div class="table_cont">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Expense</th>
                                                <th>Amount(&euro;)</th>
                                                <th>Date</th>
                                                <th>WBS</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                        for (Expense expense : expenses) {
                                        %>
                                            <tr>
                                                <td><%=expenseType%></td>
                                                <td><%=amount%>&euro;</td>
                                                <td><%=date%></td>
                                                <td><%=wbs%></td>
                                                <td class="edit">
                                                    <a href="postXpns.html">
                                                        <button class="e_but">
                                                            <div class="b_el">
                                                                <span id="text">Edit</span>
                                                                <img id="icon" src="../images/Edit_Icon.png"
                                                                    alt="Edit">
                                                            </div>
                                                        </button>
                                                    </a>
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

            <div class="cont act_cont">
                <div class="actions">
                    <div class="acts">
                        <div class="act" id="submit">
                            <button class="act_but" id="submit">
                                <div class="b_el">
                                    <span class="but_text" id="text2">Final Submit</span>
                                    <img class="but_icon" id="icon2" src="../images/Submit_Icon.png"
                                        alt="Final Submit">
                                </div>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>

</html>