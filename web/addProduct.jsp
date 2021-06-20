

<%@page import="khoipham.dto.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Add new product</title>
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
            ProductError error = (ProductError) request.getAttribute("ERROR");
            if (error == null) {
                error = new ProductError("", "", "", "");
            }
        %>
        <c:redirect url="login.jsp" />
    </c:if>
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><div>WELCOME <b>${sessionScope.username}</b></div></li>
                            <li><a href="MainController?Action=Admin" >Home</a></li>
                            <li class="pull-right"><a href="MainController?Action=Logout"  >Log Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <c:if test="${sessionScope.username == null}">
        <c:redirect url="login.jsp" />
    </c:if>
    <section id="form">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        <h2>Add New Product</h2>
                        <form action="MainController" enctype="multipart/form-data" method="get">
                            <input type="text" name="name" placeholder="Name" required=""/>
                            <input type="number" name="price" placeholder="Price" required=""/>
                            <input type="number" name="quantity" placeholder="Quantity"required=""/>
                            <input type="file" name="img" placeholder="Image"/><br/>
                            <input type="submit" class="btn btn-efault" name="Action" value="Upload">
                        </form>
                    </div>
                </div>
                <%=error.getNameError()%>
                <%=error.getPriceError()%>
                <%=error.getQuantityError()%> 
            </div>
        </div>
    </section>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/price-range.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>