<%@page import="com.mycompany.ecommerse.entities.User"%>
<%

User user = (User)session.getAttribute("current-user");
if(user==null){
    
    session.setAttribute("message","You are not logged in!! Login first");
    response.sendRedirect("login.jsp");
    return;
}else{
    if(user.getUserType().equals("admin")){
        session.setAttribute("message", "You are not normal user");
        response.sendRedirect("login.jsp");
        return;
    }
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components_css_js/common_css.jsp" %>
        <link rel="stylesheet" href="CSS/style.css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>for normal user</h1>
    </body>
</html>
