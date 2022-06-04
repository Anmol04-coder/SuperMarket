
<%@page import="java.util.Map"%>

<%@page import="com.mycompany.ecommerse.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerse.entities.Category"%>
<%@page import="com.mycompany.ecommerse.dao.CategoryDao"%>
<%@page import="com.mycompany.ecommerse.helper.FactoryProvider"%>
<%@page import="com.mycompany.ecommerse.entities.User"%>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in!! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
  <%  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategories();
                                   //geting count
                                   
Map<String,Long>m = Helper.getCounts(FactoryProvider.getFactory());
                            %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components_css_js/common_css.jsp" %>
        <style>
            .admin .card{
                cursor: pointer;
                transition: transform .2s;
            }
            .admin .card:hover{
                background-color: gray;
                transform: scale(1.1);
            }
        </style>

    </head>
    <body>
        <%@include file= "components_css_js/navbar.jsp"%>
        <div class="container admin">
            <div class="conainer-fluidy mt-3">
                <%@include file="components_css_js/message.jsp" %>
            </div>
            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card border-warning mb-3 shadow p-3 mb-5 bg-body rounded">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="icon/user.png" alt="user_icon">

                            </div> 
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>

                    </div>



                </div>

                <!--second col-->

                <div class="col-md-4">


                    <div class="card border-warning mb-3 shadow p-3 mb-5 bg-body rounded ">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="icon/categories.png" alt="user_icon">

                            </div> 

                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>

                        </div>

                    </div>


                </div>


                <!--third col-->
                <div class="col-md-4">


                    <div class="card border-warning mb-3 shadow p-3 mb-5 bg-body rounded">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="icon/products.png" alt="user_icon">

                            </div> 

                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>

                    </div>


                </div>





            </div>

            <!--second row-->

            <div class="row mt-3">

                <!--second :row first col-->
                <div class="col-md-6">


                    <div class="card border-warning mb-3 shadow p-3 mb-5 bg-body rounded" data-bs-toggle="modal" data-bs-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="icon/Addlist.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>

                    </div>
                </div>

                <!--second row : second col-->

                <div class="col-md-6">

                    <div class="card border-warning mb-3 shadow p-3 mb-5 bg-body rounded" data-bs-toggle="modal" data-bs-target="#add-product-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid rounded-circle" src="icon/add-to-cart.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>

                        </div>

                    </div>

                </div>




            </div>



        </div>
    </div>

    <!-- add category modal -->




    <!-- Modal -->
    <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog ">
            <div class="modal-content">
                <div class="modal-header custom-bg text-black">
                    <h5 class="modal-title" id="exampleModalLabel">Fill Categories Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <form action="ProductOperationServlet" method="post">
                        <input type="hidden" name="operation" value="addcategory"/>

                        <div class="form-group">
                            <input type="text" class="form-control mt-3" name="catTitle" placeholder="Enter category type" requried/>

                            <div class="form-group">
                                <textarea style="height:150px" class="form-control mt-3" placeholder="Enter category Description" name="catDescription" required></textarea>
                            </div>
                            <div class="container text-center mt-3">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>

                        </div>

                    </form>


                </div>

            </div>
        </div>
    </div>
    <!-- END add category modal -->


    <!-- Add Products modal -->

    <!-- Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header custom-bg">
                    <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>

                            <!--product title-->

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
                            </div>

                            <!--product description-->

                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>

                            </div>

                            <!--product price-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />
                            </div>

                            <!--product discount-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />
                            </div>


                            <!--product quantity-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required />
                            </div>


                            <!--product category-->

                          


                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>
                                    <%}%>
                                </select>

                            </div>



                            <!--product file-->

                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>  
                                <br>
                                <input type="file" id="pPic" name="pPic" required />

                            </div>


                            <!--submit button-->
                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add product</button>

                            </div>



                        </form>
                        <!--end form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    <!-- End Add Products modal -->


    <%@include file="components_css_js/common_js.jsp" %>
</body>
</html>
