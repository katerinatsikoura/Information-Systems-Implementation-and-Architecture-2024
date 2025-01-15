<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*" %>
<%@ page import="java.util.*" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post New Expense</title>
    <link rel="icon" href="images/Xpenser_logo.png">
    <link rel="stylesheet" href="css/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
        rel="stylesheet">
    
</head>
<body>
    <header>
        <div class="header">
            <div class="head_left">
                <a href="index_Xpenser.jsp">
                    <ul class="head_left_l">
                        <li><img id="h_logo" src="images/Xpenser_logo.png" alt="Xpenser logo"></li>
                        <li id="h_name">XPENSER</li>
                    </ul>
                </a>
            </div>
        </div>
    </header>

<%
User user = (User)session.getAttribute("userObj");

if (user == null) {
    request.setAttribute("message", "You are not authorized to access this resource. Please login.");
    request.getRequestDispatcher("login.jsp").forward(request, response);
    return;
}

ExpenseActions ea = new ExpenseActions();

try {
    // Iterate over all parameters
    for (String paramName : request.getParameterMap().keySet()) {
        if (paramName.startsWith("options")) {
            // Extract expense ID from the parameter name
            int expenseId = Integer.parseInt(paramName.replace("options", ""));
            String action = request.getParameter(paramName); // "approve" or "reject"

            if ("approve".equalsIgnoreCase(action)) {
                // Approve the expense
                ea.updateExpenseStatus(expenseId, "approve", "", user.getRole());
            } else if ("reject".equalsIgnoreCase(action)) {
                // Reject the expense and check for a rejection reason
                String rejectionReason = request.getParameter("rejectionReason" + expenseId);
                if (rejectionReason != null && !rejectionReason.trim().isEmpty()) {
                    ea.updateExpenseStatus(expenseId, "reject", rejectionReason, user.getRole());
                } else {
                    ea.updateExpenseStatus(expenseId, "reject", "", user.getRole());
                }

            } else {
                throw new Exception("Invalid action" + action);
            }
            
            System.out.println("Expense status updated successfully.");
            ea.updateApprovalStatus(expenseId);
        }
    }

} catch (Exception e) {
    System.err.println("Error: " + e.getMessage());
%>
            <div class="alertbox alertbox-danger" role="alert">Error retrieving expensesheets: <%= e.getMessage() != null ? e.getMessage() : "Unknown error" %></div>
<%
}

response.sendRedirect("reviewXpnsheet.jsp");
%>

</body>
</html>