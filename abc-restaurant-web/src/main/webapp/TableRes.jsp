
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header3.jsp" />
         <%@ page import="com.model.Table" %>
     <%@ page import="java.util.List" %>
     <%@ page import="java.util.Base64" %>
    <%
    List<Table> items = (List<Table>) request.getAttribute("items");
%>
    

<!DOCTYPE html>
<html>
<head>
    <title>Table Reservation</title>
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
           .swal2-popup {
            width: 300px;  /* Adjust the width */
            font-size: 14px; /* Adjust font size if needed */
        }
        table {
display: block;
  max-height: 450px;
  width:200%;
  overflow-y: scroll;
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
            if (urlParams.has('add') && urlParams.get('add') === 'true') {
                // Show the SweetAlert2 success pop-up with custom size
                Swal.fire({
                    title: 'Success!',
                    text: 'Table Reservation done successfully!',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    customClass: {
                        popup: 'swal2-popup'
                    }
                });
            }
          
            if (urlParams.has('remove') && urlParams.get('remove') === 'true') {
                // Show the SweetAlert2 success pop-up with custom size
                Swal.fire({
                    title: 'Success!',
                    text: 'Table Reservation Canceled successfully!',
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
        <h1 class="text-center">Table Reservation List</h1> <br>
        
         <% if (items != null && !items.isEmpty()) { %> 
        <table class="table table-striped table-bordered" style="background-color:white; " >
            <thead class="thead-dark">
                <tr>
                    <th style="width:110px">Customer Name</th>
                     <th style="width:110px">Person Count</th>
                    <th style="width:150px" >Mobile</th>
                        <th style="width:110px" >Outlet</th>
                          <th style="width:150px" >Date</th>
                            <th style="width:110px" >Time</th>
                             <th style="width:110px"></th>
                   
                </tr>
            </thead>
            <tbody>
              <%--   <c:forEach var="list" items="${list}"> --%>
              <% for (Table item : items) { %>
                    <tr>
                        <td style="width:110px"><%= item.getName() %>}</td>
                       <td style="width:110px" ><%= item.getPerson() %></td>
                         <td style="width:150px" ><%= item.getMobile() %></td>
                           <td style="width:110px" ><%= item.getOutlet() %></td>
                            <td style="width:150px"><%= item.getDate() %></td>
                             <td style="width:110px" ><%= item.getTime() %></td>
                                    <td style="width:110px" >
                    <a href="order?action=tbedit&id=<%= item.getId() %>">Done</a> 
                    <a href="order?action=tbdelete&id=<%= item.getId() %>" onclick="return confirm('Do you want to remove this Item ?')">Cancel</a>
                </td>
                    </tr>
                     <% } %>
                <%-- </c:forEach> --%>
            </tbody>
        </table>
         <% } else { %>
           <!-- Display message if no users are found -->
     <div class="text-center">
           <p style="color:white;">No Table Reservations.</p>
        </div>
<% } %>
       <br>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
