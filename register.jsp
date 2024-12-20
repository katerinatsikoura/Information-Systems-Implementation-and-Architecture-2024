<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        
        .form-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 50%;
            margin: 80px auto;
            padding: 20px;
        }
        @media (max-width: 768px) {
            .form-container {
                width: 80%;
                padding: 20px;
            }
        }

        .title {
            padding: 20px 0 40px 0;
            text-align: center;
            border-bottom: 2px solid rgba(211, 211, 211);
        }

        .form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            width: 80%;
            margin-bottom: 20px;
        }

        .form-group label {
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-size: 1.2rem;
            margin-bottom: 5px;
        }

        .form-group .inputtext {
            font-family: 'Open Sans', Verdana, Helvetica, sans-serif;
            font-size: 1rem;
            margin-bottom: 5px;
            line-height: 29px;
            padding: 10px;
            border: 1px solid #000000;
            border-radius: 5px;
            box-sizing: border-box;
            width: 100%;
        }

        .button-cont {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .button-cont button {
            background-color: #26890d;
            border: #26890dbc 2px solid;
            box-shadow: 1px 1px 5px rgb(92, 92, 92);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2rem;
        }

        .button-cont button:hover {
            background-color: #2fad0f;
            transform: scale(1.025);
        }

        @media (max-width: 768px) {
            .form-container {
                width: 90%;
                padding: 20px;
            }

            .form-group {
                margin-bottom: 10px;
            }

            .form-group label {
                font-size: 0.9rem;
            }

            .inputtext {
                font-size: 0.9rem;
                padding: 6px;
            }

            .button-cont button {
                font-size: 1rem;
                padding: 10px 20px;
            }
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

    <main>
        <div class="main_cont">
            <div class="form-container">
                <h1 class="title">Register</h1>
                <form class="form" action="registerController.jsp" method="post">
                    <div class="form-group">
                        <label for="first-name">Full Name</label>
                        <input type="text" class="inputtext" id="full-name" name="full-name" placeholder="your full name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="inputtext" id="email" name="email" placeholder="your email" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <select class="inputtext" id="role" name="role" required>
                            <option value="">--</option>
                            <option value="Manager">Manager</option>
                            <option value="Employee">Employee</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="security">Security Code</label>
                        <input type="text" class="inputtext" id="security" name="security" placeholder="enter security code" required>
                    </div>
                    <div class="button-cont">
                        <button type="submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </main>
</body>

</html>
