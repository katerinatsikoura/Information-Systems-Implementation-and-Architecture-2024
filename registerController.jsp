<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="xpenser_classes.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

    <%
        String fullname = request.getParameter("full-name");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        int code = Integer.parseInt(request.getParameter("security"));


        String message = "";
        String messageClass = "error-message";
        String passkey ="";
        
    

        if ("Manager".equals(role.trim()) && code == 789456123 ||
           "Employee".equals(role.trim()) && code == 123456789 ) {

                  
            try {
                User user = new User();
                user.setFullname(fullname);
                user.setEmail(email);
                user.setRole(role);
                passkey = User.register(user);

                

                message = "Successfull Registration." ;
                messageClass = "success-message";

                
            } catch (Exception e) {
                if ("This email has already registered. Try again".equals(e.getMessage())) {
                    message = "Sorry, this email has already registered.";
                } else {
                    message = "An unexpected error occurred.";
                }
            }

          

        } else {
            message = "Registration declined. Wrong security code.";
        }
    %>
    <!DOCTYPE html>
    <html lang="el">
    
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
        <link rel="icon" href="images/Xpenser_logo.png">
        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
            rel="stylesheet">
        <style>
        
        .error-message {
        border: 2px solid #ff4d4d;
        background-color: #fff0f0;
        color: #ff3333;
        padding: 10px 20px;
        width: 700px;
        margin: 40px auto;
        border-radius: 12px;
        font-family: 'Open Sans', sans-serif;
        font-size: 22px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);
        animation: fadeIn 0.5s ease-out;
    }
    

    .success-message {
        background-color: #caf4c5;
        color: #26890d;
        box-shadow: 0 4px 8px rgba(1, 104, 20, 0.877);
        padding: 10px 20px;
        margin: 40px auto;
        width: 700px;
        border-radius: 12px;
        font-family: 'Open Sans', sans-serif;
        font-size: 22px;
        text-align: center;
        animation: fadeIn 0.5s ease-out;
    }

    .button-cont {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    }
    .button-cont button {
            background-color: #26890d;
            border: #26890dbc 2px solid;
            box-shadow: 1px 1px 5px rgb(92, 92, 92);
            color: white;
            border: none;
            padding: 25px 30px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.5rem;
            text-transform: uppercase;
            transition: transform 0.2s ease-in-out, background-color 0.2s ease-in-out;
    }

    .button-cont button:hover {
            background-color: #2fad0f;
            transform: scale(1.1);
    }


.button-cont button a {
    text-decoration: none; 
    color: white; 
    display: inline-block;
    width: 100%; 
    height: 100%; 
    text-align: center;
    line-height: 1.5; 
}
            
    </style>
    </head>
    
    <body>
    
        <header>
            <div class="header">
                <div class="head_left">
                    <a href="index.jsp">
                        <ul class="head_left_l">
                            <li><img id="h_logo" src="images/Xpenser_logo.png" alt="Xpenser logo"></li>
                            <li id="h_name">XPENSER</li>
                        </ul>
                    </a>
                </div>
            </div>
        </header>

        <div class="<%= messageClass %>" role="alert">
            <h4><%= message %></h4>
            <% if ("Successfull Registration.".equals(message)) { %>
                <div>
                    <h4>This is your passkey to login: <%= passkey %></h4>
                </div>
            <% } %>    
        </div>
    
        <div class="button-cont">
            <% if ("Successfull Registration.".equals(message)) { %>
               
                <button><a href="login.jsp" class="btn btn-info btn-lg">Sign In</a></button>
            <% } else { %>
                <button><a href="register.jsp" class="btn btn-info btn-lg">Try again</a></button>
            <% } %>
        </div>

    </body>
    </html>


