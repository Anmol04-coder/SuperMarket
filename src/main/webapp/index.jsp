 <%-- 
    Document   : index
    Created on : 02-Apr-2022, 4:28:14 pm
    Author     : HP
--%>




<%@page import="com.mycompany.ecommerse.entities.Category"%>
<%@page import="com.mycompany.ecommerse.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.ecommerse.entities.Product"%>
<%@page import="com.mycompany.ecommerse.dao.ProductDao"%>
<%@page import="com.mycompany.ecommerse.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="components_css_js/common_css.jsp" %>
        <link rel="stylesheet" href="CSS/style.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <%@include file= "components_css_js/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">

                <%                
                    
                    String cat = request.getParameter("Category");
                    //out.println(cat);
                    
                    
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if(cat == null){
                        
                        list = dao.getAllProducts();
                        
                    }
                    else if(cat.trim().equals("all")){
                          list = dao.getAllProducts();
                    }else{
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }
                    
                   
                    CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> cList = cDao.getCategories();
                %>

                <!-- show Categories -->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?Category=all" class="list-group-item list-group-item-secondary" aria-current="true">
                            All Products
                        </a>

                        <%
                            for (Category c : cList) {

                        %>
                        <a href="index.jsp?Category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

                        <%                      }

                        %>
                    </div>
                </div>
                
                    
                    <!-- Show product -->
               <div class="col-md-10">


                    <!--row-->
                    <div class="row mt-4">

                        <!--col:12-->
                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing products-->

                                <%
                                    for (Product p : list) {

                                %>


                                <!--product card-->
                                <div class="card product-card">

                                    <div class="container text-center">
                                        <img src="icon/<%= p.getpPhoto()%>" style="max-height: 200px;max-width: 100%;width: auto; " class="card-img-top m-2" alt="...">

                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-title"><%= p.getpName()%></h5>

                                        <p class="card-text fs-6 fw-lighter lh-1" style="font-size: 5px">
                                            
                                            <%=p.getPDesc()%>
                                        </p>

                                    </div>
                                        <!-- button -->
                                    <div class="card-footer text-center">
                                        
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getPid()%>, '<%= p.getpName()%>',<%= p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                        <button class="btn  btn-outline-success btn-sm">  <%= p.getPriceAfterApplyingDiscount()%>&#8377;  <span class="text-secondary discount-label">  , <%= p.getpDiscount()%>% off </span>  </button>

                                    </div>



                                </div>






                                <%}

                                    if (list.size() == 0) {
                                        out.println("<h3>No item in this category</h3>");
                                    }


                                %>


                            </div>                     



                        </div>                   

                    </div>



                </div>


            </div>
        </div>
        <%@include file="components_css_js/common_js.jsp" %>
        <%@include file="components_css_js/common_modal_cart.jsp" %>
    </body>
</html>
