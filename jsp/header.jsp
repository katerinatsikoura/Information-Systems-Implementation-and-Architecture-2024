<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.*" %>

<!DOCTYPE html>
<html lang="el">

    <header>
        <div class="header">
            <div class="head_left">
                <a href="index_Xpenser.html">
                    <ul class="head_left_l">
                    <li><img id="h_logo" src="<%=request.getContextPath() %>/images/Xpenser_logo.png" alt="Xpenser logo"></li>
                    <li id="h_name">XPENSER</li>
                    </ul>
                </a>
<%
try {
	User user = (User)session.getAttribute("userObj"); 
	if (user == null) {
%>
            </div>
        </div>
    </header>
    <main>
        <div class="alertbox alertbox-danger" role="alert">You are not authorized to access this resource. Please login.</div>
    </main>
<%
    } else {
%>

                <div class="nav_bar">
                    <button class="nav-toggle" aria-label="Toggle navigation">
                        <span class="hamburger-icon">&#9776;</span> <!-- Font Awesome icon or similar -->
                    </button>
                    <ul class="nav_l">
                        <a href="index_Xpenser.jsp" class="<%= request.getRequestURI().contains("index_Xpenser.jsp") ? "current" : "" %>"><li>Home</li></a>
<%
        if (user.getRole().equals("Employee")) {
%>
                        <a href="postXpns.jsp" class="<%= request.getRequestURI().contains("postXpns.jsp") ? "current" : "" %>"><li>Post Expense</li></a>
                        <a href="viewCurrentXpnsheet.jsp" class="<%= request.getRequestURI().contains("viewCurrentXpnsheet.jsp") ? "current" : "" %>"><li>View Current Expensesheet</li></a>
                        <a href="processXpnsheets.jsp" class="<%= request.getRequestURI().contains("processXpnsheets.jsp") ? "current" : "" %>"><li>View Processed Expensheets</li></a>
<%
        } else {
%>
                        <a href="reviewXpnsheet.jsp" class="<%= request.getRequestURI().contains("reviewXpnsheet.jsp") ? "current" : "" %>"><li>Review Expensesheets</li></a>
<%
        }
    }
%>                                     
                    </ul>
                </div>
            </div>

            <div class="head_right">

                <div class="user">
                    <button id="us_menu">
                        <img id="us_icon" src="<%=request.getContextPath() %>/images/User_Icon.png" alt="User">
                    </button>
                    <div class="us_opt">
                        <ul>
                            <li id="passkey"><%= user.getPasskey()%></li>
                            <li><a href="login.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </header>
<%
} catch (Exception e) {
    System.err.println("Error: " + e.getMessage());
    e.printStackTrace();
%>
            <div class="alertbox alertbox-danger" role="alert">Error retrieving expensesheets: <%= e.getMessage() != null ? e.getMessage() : "Unknown error" %></div>
<%
}
%>
</html>

<script>
    document.querySelector('.nav-toggle').addEventListener('click', function() {
        this.classList.toggle('active');
        document.querySelector('.nav_l').classList.toggle('active');
    });
</script>