<%
     User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut</title>
        <%@include file="components_css_js/common_css.jsp" %>
        <link rel="stylesheet" href="CSS/style.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <%@include file= "components_css_js/navbar.jsp"%>


        <div class="container">
            <div class="row">

                <div class="col-md-6">

                    <div class = "card">
                        <div class =" card-body">
                            <h3 class="text-center">Your selected items</h3>
                            <div class="cart-body">

                            </div>
                        </div>

                    </div>

                </div>
                <!--form detail-->
                <div class =" col-md-6">

                    <div class = "card">
                        <div class =" card-body">
                            <h3 class="text-center">Your details for order</h3>
                            <form action="action">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input value = "<%=user.getUserEmail()%>"type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Your Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">

                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">Your shipping Address</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success text-center">Order Now</button>
                                    <button class="btn btn-outline-primary text-center">Continue Shopping</button>
                                </div>
                            </form>
                        </div>

                    </div>


                </div> 

            </div>

        </div>


        <%@include file="components_css_js/common_js.jsp" %>
        <%@include file="components_css_js/common_modal_cart.jsp" %>
    </body>
</html>
