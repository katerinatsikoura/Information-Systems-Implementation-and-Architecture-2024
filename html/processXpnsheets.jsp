<%@ page import="java.util.*" %> <%@ page
language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.ExpenseActions" %>
<%@ page import="xpenser_classes.Expensesheet" %>


<!DOCTYPE html>
<html lang="el">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>View Processed Expensesheets</title>
    <link rel="icon" href="../images/Xpenser_logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <style>
      .b_el {
        width: 100%;
      }

      .box {
        margin: 80px 0 50px 0;
      }

      .approved img {
        display: none;
      }

      .approved img.active {
        display: block;
      }

      .table td img {
        height: 37px;
      }

      .details {
        width: 15%;
      }

      .details .c_but {
        background-color: white;
        border: #26890dbd 2px solid;
        border-radius: 25px;
        box-shadow: 1px 1px 5px rgb(92, 92, 92);
        width: 130px;
        height: 40px;
        cursor: pointer;
      }

      .b_el {
        display: inline-flex;
        align-items: center;
        justify-content: center;
      }

      .b_el #text {
        color: #26890d;
        font-family: "Open Sans", Verdana, Helvetica, sans-serif;
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
    </style>
  </head>

  <body>
    <header>
      <div class="header">
        <div class="head_left">
          <a href="index_Xpenser.html">
            <ul class="head_left_l">
              <li>
                <img
                  id="h_logo"
                  src="../images/Xpenser_logo.png"
                  alt="Xpenser logo"
                />
              </li>
              <li id="h_name">XPENSER</li>
            </ul>
          </a>

          <div class="nav_bar">
            <ul class="nav_l">
              <a href="index_Xpenser.html"><li>Home</li></a>
              <a href="postXpns.html"><li>Post Expense</li></a>
              <a href="viewCurrentXpnsheet.html"
                ><li>View Current Expensesheet</li></a
              >
              <a href="reviewXpnsheet.html"><li>Review Expensesheets</li></a>
              <a href="processXpnsheets.html" id="current"
                ><li>View Processed Expensheets</li></a
              >
            </ul>
          </div>
        </div>

        <div class="head_right">
          <div class="user">
            <button id="us_menu">
              <img id="us_icon" src="../images/User_Icon.png" alt="User" />
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
                  <div class="f_head">Processed Expensesheets</div>
                </div>
                <div class="f_body">
                  <div class="table_cont">
                    <table class="table">
                      <thead>
                        <tr>
                          <th>Expensesheet ID</th>
                          <th>Date</th>
                          <th>Manager Approval</th>
                          <th>Accounting Approval</th>
                          <th>Final Approval</th>
                        </tr>
                      </thead>
                      <tbody>
                        <% 
                            int user_id = session.getAttribute("user_id"); 
                            if (user_id == null) { 
                        %>
                          <tr>
                            <td colspan="6">User ID not found. Please log in.</td>
                          </tr>
                        <% 
                          } else {
                              try {
                                ExpenseActions expenseActions = new ExpenseActions();
                                List<ExpenseSheet> expensesheets = expenseActions.getProcessedExpensesheets(user_id);
                                if (expensesheets.isEmpty()) {
                        %>
                          <tr>
                            <td colspan="6">No processed expensesheets found for this user.</td>
                          </tr>
                        <%
                                } else { 
                                  for (ExpenseSheet sheet : expensesheets) {
                        %>
                        <tr>
                          <td><%= sheet.getExpensesheetId() %></td>
                          <td><%= sheet.getDate() %></td>
                          <td><%= sheet.getStatus().get(0) %></td>
                          <td><%= sheet.getStatus().get(1) %></td>
                          <td><%= sheet.getStatus().get(2) %></td>
                          <td class="details">
                            <a href="approveXpns.html">
                              <button class="c_but">
                                <div class="b_el">
                                  <span id="text">Details</span>
                                </div>
                              </button>
                            </a>
                          </td>
                        </tr>
                        <% 
                                  }
                                }
                              } catch (Exception e) {
                        %>
                        <tr>
                          <td colspan="6">Error retrieving expensesheets: <%= e.getMessage() %></td>
                        </tr>
                        <%
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
      </div>
    </main>
  </body>
</html>

