

<%@page import="java.util.List"%>
<%@page import="khoipham.dto.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Bill</title>
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
    <c:if test="${sessionScope.username == null}">
        <c:redirect url="login.jsp" />
    </c:if>
    <p>${mess}</p>
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><div>WELCOME <b>${sessionScope.username}</b></div></li>
                            <li><a href="MainController?Action=Home" >Home</a></li>
                            <li><a href="cart.jsp" >Cart</a></li>
                            <li class="pull-right"><a href="MainController?Action=Logout"  >Log Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--    test-->

    <section id="cart_items">
        <div class="container">

            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <thead>
                        <tr class="cart_menu">
                            <td class="image">Item</td>
                            <td class="description"></td>
                            <td class="price">Price</td>
                            <td class="quantity">Quantity</td>                          
                            <td class="total">Total</td>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% List<Product> bill = (List<Product>) request.getAttribute("bill");
                            for (Product x : bill) {
                        %>
                        <tr>
                            <td class="cart_product">
                                <img src="images/home/<%= x.getImg()%>" width="100" height="100">
                            </td>
                            <td class="cart_description">
                                <h4><%= x.getName()%></h4>
                            </td>
                            <td class="cart_price">
                                <p><%= x.getPrice()%></p>
                            </td>
                            <td class="cart_quantity">
                                <div ><%= x.getQuantity()%></div>
                            </td>
                            <td class="cart_total">
                                <p class="cart_total_price"><%= x.getQuantity() * x.getPrice()%></p>
                            </td>
                                                      
                        </tr>
                        <%
                            }
                        %>

                    </tbody>
                    <tfoot>
                        <tr>
                            <td>
                                <h1>Total:${total}</h1>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </section> 

    <!--    test-->
</body>
</html>
