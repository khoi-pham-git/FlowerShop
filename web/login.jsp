

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">      
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head>

    <body>
        <section id="form">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <div class="login-form"><!--login form-->
                            <h2>LOGIN</h2>
                            <form action ="MainController" method="POST">
                                <h3>User ID:</h3><input name="userId" type = "text" required="">
                                <h3>Password:</h3><input name="password" type = "password" required="">
                                <input type="submit" class="btn btn-default" name="Action" value="login">
                            </form>
                            <button class="btn btn-default"><a href="register.jsp">Register</a></button>
                             <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/FlowerShop/login-google&response_type=code&client_id=362719152206-799vmbiuik7u9brh2fm0mkugenpoat7e.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <% if (request.getAttribute("ERROR_MESSAGE") != null) {
        %>

        <p><%=request.getAttribute("ERROR_MESSAGE")%></p>

        <%
            }
        %>

        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
