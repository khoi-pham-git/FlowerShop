<%@page import="khoipham.dto.ProductError"%>

<!DOCTYPE html>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin </title>
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
        <style>
            .center {
                text-align: center;
                margin-left: 300px;
            }
        </style>
    </head>
    <!--/head-->

    <body>
            <c:if test="${sessionScope.username == null}">
                <c:redirect url="login.jsp"/>
            </c:if>
        
        <p>${mess}</p>
        <div class="header-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="mainmenu pull-left">
                            <ul class="nav navbar-nav collapse navbar-collapse">
                                <li><div>WELCOME <b>${sessionScope.username}</b></div></li>
                                <li><a href="MainController?Action=Admin" >Home</a></li>
                                <li><a href="addProduct.jsp" >Add New Product</a></li>
                                <li class="pull-right"><a href="MainController?Action=Logout"  >Log Out</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <form action ="MainController" method="GET" class="center">
            <li><div class="col-sm-3">
                    <input type="text" name ="key" placeholder="Search" />
                    <input type="submit" name ="Action" value="Search" class="btn btn-default" />
                </div>
            </li>
        </form>
        <br>

        <div class="container">
            <div class="row">
                <div class="col-sm-9 padding-right">
                    <div class="features_items">
                        <!--features_items-->
                        <c:forEach var="product" items="${listProduct}">
                            <div class="col-sm-4">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <form action="MainController">
                                                <img src="images/home/${product.getImg()}"  width="100" height="200"/>
                                                <p>ID:${product.getId()}</p>
                                                <p>Name:<input type="text" name ="name" value="${product.getName()}" required="" ></p>
                                                <p>Price:<input type="text" name ="price" value="${product.getPrice()}" required="" min="1"></p>
                                                <p>Quantity:<input type="text" name = "quantity" value="${product.getQuantity()}"required="" min="1"></p>
                                                <input type="submit" name="Action" value="Update">
                                            </form>
                                            <a href="MainController?Action=Delete&id=${product.getId()}">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>