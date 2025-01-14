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
            <div class="cont f_cont">
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
                    		<p><strong>Sheet ID:</strong> <%= sheet.getExpensesheetId() %></p>
                    		<p><strong>Date Submitted:</strong> <%= sheet.getDate() %></p>
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
                                            		<input type="radio" id="approve<%= expense.getExpenseId() %>" name="options<%= expense.getExpenseId() %>">
                                            		<input type="radio" id="reject<%= expense.getExpenseId() %>" name="options<%= expense.getExpenseId() %>">

                                            		<label for="approve<%= expense.getExpenseId() %>">Approve</label>
                                            		<label for="reject<%= expense.getExpenseId() %>">Reject</label>

                                            		<div class="reason_cont">
                                                	   <input type="text" class="reason_input"
                                                    		placeholder="Rejection Reason..." required>
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
            </div>
        </div>
    </main>
</body>

</html>
