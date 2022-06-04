

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components_css_js/common_css.jsp" %>
        <link rel="stylesheet" href="CSS/style.css"/>
    </head>
    <body>
        <%@include file= "components_css_js/navbar.jsp"%>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-3 border-warning mb-3 shadow p-3 mb-5 bg-body rounded text-danger">
                        <div class="card-header bg-light">
                            <h3>Login here</h3>
                        </div>
                        <div class="card-body text-danger">
                            <%@include file="components_css_js/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <a href="register.jsp">If not registered click here</a>
                                <div class="container text-center">
                                     <button type="submit" class="btn btn-secondary border-0" style="color:white">Submit</button>
                                     
                                     
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components_css_js/common_js.jsp" %>
    </body>
</html>
