
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header3.jsp" />
     <%@ page import="com.model.Item" %>
     <%@ page import="java.util.List" %>
     <%@ page import="java.util.Base64" %>
    <%
    List<Item> items = (List<Item>) request.getAttribute("items");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Search</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin: auto; 
            width: 80%;
        }

table {
display: block;
  max-height: 450px;
  width:200%;
  overflow-y: scroll;
}

    </style>


</head>
<body style="background-image: url('image/grid-back.jpg'); background-size: cover;   " >
    <div class="container">
     <h1 class="text-center">Search Result</h1>
<!--     <div class="table table-striped ">
     <a href="item?action=add" class="btn btn-danger" >Add New Item</a> </div> -->
       <br>
       
       <% if (items != null && !items.isEmpty()) { %> <!-- Check if users list is not null and not empty -->
 
        <table  style="background-color:white; " class="table table-striped table-bordered">
         <!--    <thead class="thead-dark">
                <tr>
                 <th>Image</th>
                <th>Item Id</th>
                    <th>Name</th>
                    <th>Description </th>
                     <th>Price</th>
                     <th></th>
                     
                   
                </tr>
            </thead> -->
            <tbody >
<%--                 <c:forEach var="items" items="${items}"> --%>        



<% for (Item item : items) { %> <!-- Iterate over the users list using a for loop -->
                

            <tr >
                    <td style="width:100px" >   
                    <% if (item.getImage() != null){
        String base64Image = Base64.getEncoder().encodeToString(item.getImage());
                %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Image" style="width:50px; height:auto;" />
                    <% } %>

                    </td>
         
                    <td style="width:120px" ><%= item.getName() %></td> 
                        <td style="width:500px"><%= item.getDescription() %></td> 
                       <td style="width:100px" ><%= item.getPrice() %></td>   
                        <td style="width:100px;">
                    <a href="order?action=offer&id=<%= item.getId() %>">add to Cart</a> 
                   <%--  <a href="item?action=delete&id=<%= item.getId() %>" onclick="return confirm('Do you want to remove this Item ?')">Remove</a> --%>
                </td>
                    </tr>
                        <% } %>
              <%--   </c:forEach> --%>
            </tbody>
        </table>
                <% } else { %>
    <!-- Display message if no users are found -->
     <div class="text-center">
           <p style="color:white;">No items result found.</p>
        </div>
<% } %>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
