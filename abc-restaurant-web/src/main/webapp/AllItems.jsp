
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header.jsp" />
     <%@ page import="com.model.Item" %>
     <%@ page import="java.util.List" %>
    <%
    List<Item> items = (List<Item>) request.getAttribute("items");
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Items</title>
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
  width:10000%;
  overflow-y: scroll;
}
    </style>
</head>
<body style="background-image: url('image/grid-back.jpg'); background-size: cover;   " >
    <div class="container">
     <h1 class="text-center">All Items</h1>
    <div class="table table-striped ">
     <a href="item?action=add" class="btn btn-danger" >Add New Item</a> </div>
       <br>
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
                <c:forEach var="items" items="${items}">
                    <tr >
                      <td> <img src="data:image/jpeg;base64,${items.imageBase64}" width="50" height="50"></td>
                     <td>${items.id}</td>
                    <td>${items.name}</td> 
                        <td>${items.description}</td> 
                       <td>${items.price}</td>   
                        <td>
                    <a href="item?action=edit&id=${items.id}">Edit</a> |
                    <a href="item?action=delete&id=${items.id}" onclick="return confirm('Do you want to remove this Item ?')">Remove</a>
                </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
