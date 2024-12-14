<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

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

                <div class="nav_bar">
                    <button class="nav-toggle" aria-label="Toggle navigation">
                        <span class="hamburger-icon">&#9776;</span> <!-- Font Awesome icon or similar -->
                    </button>
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
                        <img id="us_icon" src="<%=request.getContextPath() %>/images/User_Icon.png" alt="User">
                    </button>
                    <div class="us_opt">
                        <a href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

    </header>

</html>

<script>
    document.querySelector('.nav-toggle').addEventListener('click', function() {
        this.classList.toggle('active');
        document.querySelector('.nav_l').classList.toggle('active');
    });
</script>