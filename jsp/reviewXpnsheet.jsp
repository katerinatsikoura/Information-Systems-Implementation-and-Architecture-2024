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
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="id">1</td>
                                                <td>Aleksandros Tsompanhs</td>
                                                <td>389, 454</td>
                                                <td>2024-05-01</td>
                                                <td class="approved">
                                                    <img id="yes" class="active" src="../images/Approved_Icon.png"
                                                        alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">2</td>
                                                <td>Giannhs Petrakhs</td>
                                                <td>568, 461</td>
                                                <td>2024-05-02</td>
                                                <td class="approved">
                                                    <img id="yes" src="../images/Approved_Icon.png" alt="Approved">
                                                    <img id="no" class="active" src="../images/Declined_Icon.png"
                                                        alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">3</td>
                                                <td>Katerina Tsikoura</td>
                                                <td>911, 568, 461</td>
                                                <td>2024-05-03</td>
                                                <td class="approved">
                                                    <img id="yes" class="active" src="../images/Approved_Icon.png"
                                                        alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">4</td>
                                                <td>Aggelos Nikolaidis</td>
                                                <td>518</td>
                                                <td>2024-05-04</td>
                                                <td class="approved">
                                                    <img id="yes" src="../images/Approved_Icon.png" alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">5</td>
                                                <td>Vassilis Mylonas</td>
                                                <td>853</td>
                                                <td>2024-05-05</td>
                                                <td class="approved">
                                                    <img id="yes" src="../images/Approved_Icon.png" alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">6</td>
                                                <td>Vasilis Rokatos</td>
                                                <td>829</td>
                                                <td>2024-05-01</td>
                                                <td class="approved">
                                                    <img id="yes" class="active" src="../images/Approved_Icon.png"
                                                        alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">7</td>
                                                <td>Panayiotis Metriadis</td>
                                                <td>478</td>
                                                <td>2024-05-15</td>
                                                <td class="approved">
                                                    <img id="yes" src="../images/Approved_Icon.png" alt="Approved">
                                                    <img id="no" class="active" src="../images/Declined_Icon.png"
                                                        alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">8</td>
                                                <td>Emmanouella Melalli</td>
                                                <td>012, 013</td>
                                                <td>2024-05-20</td>
                                                <td class="approved">
                                                    <img id="yes" class="active" src="../images/Approved_Icon.png"
                                                        alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">9</td>
                                                <td>Artemis Zervelli</td>
                                                <td>941, 933</td>
                                                <td>2024-05-03</td>
                                                <td class="approved">
                                                    <img id="yes" class="active" src="../images/Approved_Icon.png"
                                                        alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">10</td>
                                                <td>Giorgos Morides</td>
                                                <td>652</td>
                                                <td>2024-05-13</td>
                                                <td class="approved">
                                                    <img id="yes" src="../images/Approved_Icon.png" alt="Approved">
                                                    <img id="no" class="active" src="../images/Declined_Icon.png"
                                                        alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">11</td>
                                                <td>Pantelina Procopiili</td>
                                                <td>753, 754, 760, 800</td>
                                                <td>2024-05-05</td>
                                                <td class="approved">
                                                    <img id="yes" src="../images/Approved_Icon.png" alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="id">12</td>
                                                <td>Elena Scafidakou</td>
                                                <td>333</td>
                                                <td>2024-05-28</td>
                                                <td class="approved">
                                                    <img id="yes" class="active" src="../images/Approved_Icon.png"
                                                        alt="Approved">
                                                    <img id="no" src="../images/Declined_Icon.png" alt="Rejected">
                                                </td>
                                                <td class="check">
                                                    <a href="approveXpns.html">
                                                        <button class="c_but">
                                                            <div class="b_el">
                                                                <span id="text">Review</span>
                                                                <img id="icon" src="../images/Check_Icon.png"
                                                                    alt="Review">
                                                            </div>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
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