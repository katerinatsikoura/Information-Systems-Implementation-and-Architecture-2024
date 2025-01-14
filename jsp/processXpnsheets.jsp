<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*" %>
<%@ page import="java.util.*" %> 


<%
Object userObj = session.getAttribute("userObj");
if (userObj == null) {
    request.setAttribute("message", "You are not authorized to access this resource. Please login.");
    request.getRequestDispatcher("login.jsp").forward(request, response);
    return;
}
User user = (User) userObj;
String passkey = user.getPasskey();
ExpenseActions ea = new ExpenseActions();
List<Expensesheet> expensesheets = ea.getProcessedExpensesheets(passkey);
boolean isEmpty = false;
if (expensesheets == null || expensesheets.isEmpty()) {
  isEmpty= true;
}
%>

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
    
    <jsp:include page="header.jsp" />

    <main>
      <div class="main_cont">
        <div class="f_cont">
          <div class="form">
            <ul class="box">
              <li>
                <div class="fh_cont">
                  <div class="f_head">Processed Expensesheets</div>
                </div>
                <% try {
                  if (isEmpty) {
                %>
                    <div class="alertbox alertbox-danger" role="alert">
                      No processed expensesheets found for this user.
                    </div>
                    <%
                  } else {
                  %>
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
                            <th></th>
                          </tr>
                        </thead>
                        <tbody>
                          <% 
                          for (Expensesheet sheet : expensesheets) { 
                          %>
                          <tr>
                            <td><%= sheet.getExpensesheetId() %></td>
                            <td><%= sheet.getDate() %></td>
                            <td><%= ea.getStatusIcon(sheet.getStatus().get(0), request.getContextPath()) %></td>
                            <td><%= ea.getStatusIcon(sheet.getStatus().get(1), request.getContextPath()) %></td>
                            <td><%= ea.getStatusIcon(sheet.getStatus().get(2), request.getContextPath()) %></td>
                            <td class="details">
                              <a href="approveXpns.jsp?es_id=<%= sheet.getExpensesheetId() %>">
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
                          %>
                        </tbody>
                      </table>
                    </div>
                  </div>
                    <% 
                          }
                      } catch (Exception e) {
                    %>
                        <div class="alert alert-danger text-center" role="alert">Error retrieving expensesheets: <%= e.getMessage() %></div>     
                    <%
                      }
                    %>
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