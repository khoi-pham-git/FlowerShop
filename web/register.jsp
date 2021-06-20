s

<%@page import="khoipham.dto.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>
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
        <%
            UserError error = (UserError) request.getAttribute("ERROR");
            if (error == null) {
                error = new UserError("", "", "", "", "");
            }
        %>

        <section id="form">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <div class="login-form"><!--login form-->
                            <h2>REGISTER</h2>
                            <form action="MainController" method="POST">
                                <h3>User ID:</h3> <input type="text" name="txtUserID" required=""/>
                                <h3>Full Name:</h3><input type="text" name="txtFullName" required=""/>
                                <h3>Password:</h3><input type="password" name="txtPassword" required=""/>
                                <h3>Confirm:</h3><input type="password" name="txtConfirm" required=""/>
                                <input type="submit" class="btn btn-default" name="Action" value="Register">
                            </form>
                            <button class="btn btn-default"><a href="login.jsp">Login</a></button>
                        </div>
                    </div>
                    <%= error.getUserIDError()%></br>

                    <%= error.getFullNameError()%></br>

                    <%= error.getConfirmError()%></br>
                </div>
            </div>
        </section>

    </body>
</html>
