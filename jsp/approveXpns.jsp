<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*" %>
<%@ page import="java.util.*" %> 

<%
User user = (User)session.getAttribute("userObj");

if (user == null) {
    request.setAttribute("message", "You are not authorized to access this resource. Please login.");
    request.getRequestDispatcher("login.jsp").forward(request, response);
    return;
}

    // Fetch the uid parameter from the request
String es_id = request.getParameter("es_id");
Expensesheet sheet = null;
int expensesheetId = -1;
List<Expense> expenses = new ArrayList<Expense>();
ExpenseActions expenseActions = new ExpenseActions();

    // Validate and fetch the Expensesheet and associated expenses
if (es_id != null && !es_id.isEmpty()) {
    try {
        expensesheetId = Integer.parseInt(es_id);
        sheet = expenseActions.getExpensesheetFromExpensesheetID(expensesheetId);
        if (sheet != null) {
            expenses = sheet.getExpenseList();
        }
    } catch (NumberFormatException e) {
        out.println("<p>Invalid Expensesheet ID provided.</p>");
    }
} else {
    out.println("<p>No Expensesheet ID provided.</p>");
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

        .exp_form{
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }

      .box {
        margin: 30px 0 50px 0;
      }
    
        .f_header{
            display: flex;
            justify-content: center;
        }

        .f_header p{
            margin: 15px;
            font-size: 17px;
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
        width: 100%;
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

        .submit_cont{
          display: flex;
          justify-content: center;
          margin-top: 50px;
        }

        .submit_button {
            background-color: #26890d;
            border: #26890dbc 2px solid;
            border-radius: 25px;
            box-shadow: 1px 1px 5px rgb(71, 71, 71);
            height: 70px;
            width: 175px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .but_text {
            font-size: 24px;
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-weight: bold;
            color: white;
            text-shadow: 1px 1px 5px rgb(71, 71, 71);
        }

        .submit_button:hover {
            scale: 1.1;
            background-color: #2da70f;
            border-color: #2da70fab;
            box-shadow: 2px 2px 5px #1f710a;
        }

    </style>
  </head>

  <body>
    
    <jsp:include page="header.jsp" />

    <main>
        <div class="main_cont">

            <div class="cont f_cont">
            <form class="exp_form" action="approveXpnsController.jsp" method="post" enctype="multipart/form-data">
<%
            if (!user.getRole().equals("Employee")) {
%>
            <!-- Container for the submit button -->
            <div class="submit_cont">
                <button type="submit" class="submit_button">
                <span class="but_text">Submit</span>
                </button>
            </div>
<%
            }
%>
                <div class="form">
                    <ul class="box">
                        <li>
                            <div class="fh_cont">
                                <div class="f_head">Expensesheet Details</div>
                            </div>
                            <div class="f_body">
				<%
                       		   if (sheet != null) {
                    		%>
                            <div class="f_header">
                    		    <p><strong>Sheet ID:</strong> <%= sheet.getExpensesheetId() %></p>
                    		    <p><strong>Date Submitted:</strong> <%= sheet.getDate() %></p>
                            </div>
                                <div class="table_cont">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Expense</th>
                                                <th>Amount(&euro;)</th>
                                                <th>Date</th>
                                                <th>WBS</th>
<%
                                            if (user.getRole().equals("Employee")) {
%>
                                            <th>Manager Approval</th>
                                            <th>Accounting Approval</th>
                                            <th>Final Approval</th>
<%
                                            }
%>                                           
                                            </tr>
                                        </thead>
					<tbody>
					<%
                                    	   if (expenses != null && !expenses.isEmpty()) {
                                        	for (Expense expense : expenses) {
                                	%>
                                	    <tr>
                                    		<td><%= expense.getType() %></td>
                                    		<td><%= expense.getAmount() %>€</td>
                                    		<td><%= expense.getDate() %></td>
                                    		<td><%= expense.getWbs() %></td>
                                    		
<%
                                            if (user.getRole().equals("Employee")) {
%>
                                              <td><%= expenseActions.getStatusIcon(expense.getStatus().get(0), request.getContextPath()) %></td>
                                              <td><%= expenseActions.getStatusIcon(expense.getStatus().get(1), request.getContextPath()) %></td>
                                              <td><%= expenseActions.getStatusIcon(expense.getStatus().get(2), request.getContextPath()) %></td>
                            
<% 
                                            } else {
%>
                                              <td class="options">
                                                <div class="opt">
                                            		<input type="radio" id="approve<%= expense.getExpenseId() %>" name="options<%= expense.getExpenseId() %>" value="approve">
                                            		<label for="approve<%= expense.getExpenseId() %>">Approve</label>

                                                <input type="radio" id="reject<%= expense.getExpenseId() %>" name="options<%= expense.getExpenseId() %>" value="reject">
                                            		<label for="reject<%= expense.getExpenseId() %>">Reject</label>

                                            		<div class="reason_cont" id="reason_cont_<%= expense.getExpenseId() %>">
                                                	   <input type="text" name="rejectionReason<%= expense.getExpenseId() %>" 
                                                     class="reason_input" placeholder="Rejection Reason...">
                                            		</div>
                                        	      </div>
                                          
<%
                                            }
%>
                                   	 	        </td>
                                	        </tr>
                                        <%
                                               }
                                    	    } else {
                                        %>
                                	     <tr>
                                    		<td colspan="5">No expenses found for this expensesheet.</td>
                                	     </tr>
                                        <%
                                    	    }
                                        %>
                            		</tbody>
                                    </table>
                                </div>
				<%
                        	   } else {
                    		%>
                    		    <div class="alertbox alertbox-danger" role="alert">
                      			No expenses found for this expensesheet.
                    		    </div>
                    		<%
                        	   }
                    		%>

                            </div>
                        </li>
                    </ul>
                </div>
            
          </form>
          </div>
        </div>
    </main>
</body>

</html>
