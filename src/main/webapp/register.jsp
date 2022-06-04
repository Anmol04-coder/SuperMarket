
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components_css_js/common_css.jsp" %>
        <link rel="stylesheet" href="CSS/style.css"/>
    </head>
    <body>
        <%@include file= "components_css_js/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-3">
            <div class="col-md-6 offset-md-3">
                <div class="card border-warning mb-3 shadow p-3 mb-5 bg-body rounded" style="max-width: 46rem;">
                    <%@include file="components_css_js/message.jsp"%>
                    <div class="card-body px-5 text-danger">
                        <h3 class="text-center my-3">Sign up here !!</h3>
                        <form action="RegisterServlet" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">User Name</label>
                        <input name="user_name"type="text" class="form-control" id="name" placeholder="Full Name" aria-describedby="emailHelp" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input name="user_email" type="email" class="form-control" id="email" placeholder="Email" aria-describedby="emailHelp" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input name="user_password" type="password" class="form-control" id="password" placeholder="Password" aria-describedby="emailHelp" required>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone No.</label>
                        <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Phone No." aria-describedby="emailHelp" required>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">User Address</label>
                        <textarea name="user_address" id="address" style="height:100px;" class="form-control" placeholder="Enter your address" required></textarea>
                    </div>
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button>
                        <button class="btn btn-outline-warning">Reset</button>
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
