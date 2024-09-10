
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
    <title>Offer List</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
       

        .swal2-popup {
            width: 300px;  /* Adjust the width */
            font-size: 14px; /* Adjust font size if needed */
        }
    </style>
<!-- Include SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Include SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <!-- Custom CSS to adjust the size of the SweetAlert2 pop-up -->
    
    
    <script>
        // JavaScript to check URL parameters and display success message using SweetAlert2
        $(document).ready(function () {
            const urlParams = new URLSearchParams(window.location.search);
          
            if (urlParams.has('update') && urlParams.get('update') === 'true') {
                // Show the SweetAlert2 success pop-up with custom size
                Swal.fire({
                    title: 'Success!',
                    text: 'Item Updated successfully!',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    customClass: {
                        popup: 'swal2-popup'
                    }
                });
            }
        
        });
    </script>
 
</head>
<body style="background-image: url('image/grid-back.jpg'); background-size: cover;   " >
    <div class="container">
    <br>
     <h1 class="text-center">Offer List</h1>
   <!--  <div class="table table-striped ">
     <a href="item?action=add" class="btn btn-danger" >Add New Item</a> </div> -->
       <br>
       
       <% if (items != null && !items.isEmpty()) { %> <!-- Check if users list is not null and not empty -->
 
        <table  style="background-color:white; " class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                 <th>Image</th>
                <th>Item Id</th>
                    <th>Name</th>
                    <th>Description </th>
                     <th>Price</th>
                     <th></th>
                     
                   
                </tr>
            </thead>
            <tbody >
<%--                 <c:forEach var="items" items="${items}"> --%>        



<% for (Item item : items) { %> <!-- Iterate over the users list using a for loop -->
                

            <tr >
                    <td>   
                    <% if (item.getImage() != null){
        String base64Image = Base64.getEncoder().encodeToString(item.getImage());
                %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Image" style="width:100px; height:auto;" />
                    <% } %>

                    </td>
                     <td><%= item.getId() %></td>
                    <td><%= item.getName() %></td> 
                        <td><%= item.getDescription() %></td> 
                       <td><%= item.getPrice() %></td>   
                        <td>
                    <a href="item?action=OfferE&id=<%= item.getId() %>">Edit</a>
           
                </td>
                    </tr>
                        <% } %>
              <%--   </c:forEach> --%>
            </tbody>
        </table>
                <% } else { %>
    <!-- Display message if no users are found -->
     <div class="text-center">
           <p style="color:white;">No offers found.</p>
        </div>
<% } %>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
