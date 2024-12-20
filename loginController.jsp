<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="xpenser_classes.User" %>

<%

    try {
        String passkey = request.getParameter("passkey");
        
        String message = null;

        User user = User.authenticate(passkey);

        if (user != null) {

            String role = user.getRole();
            
            request.getSession().setAttribute("userObj", user);
            if ("Manager".equalsIgnoreCase(role)) {
                response.sendRedirect("approveXpns.jsp");
            } else {
                response.sendRedirect("index_Xpenser.jsp");
            } 
            
            
        } else {
            request.setAttribute("message", "Invalid Passkey. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    } catch (SQLException e) {
        log("SQL Error: " + e.getMessage());
        request.setAttribute("message", "Database error. Please try again later.");
        request.getRequestDispatcher("login.jsp").forward(request, response); 
    } catch (Exception e) {
        log("Unexpected Error: " + e.getMessage());
        request.setAttribute("message", "Something went wrong, try again.");
        request.getRequestDispatcher("login.jsp").forward(request, response); 
    }
%>
