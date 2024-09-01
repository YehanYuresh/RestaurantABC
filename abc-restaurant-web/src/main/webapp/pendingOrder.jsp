
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>Pending Order List</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Pending Order List</h1>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <!-- <th>ID</th> -->
                    <th>Date & Time</th>
                     <th>Item</th>
                    <th>Quantity</th>
                  <!--     <th>Unit Price</th> -->
                        <th>Total Price</th>
                         <th> </th>
                   
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.date}</td>
                        <td>${order.item}</td>
                        <td>${order.qty}</td>
                      <%--   <td class="text-right"> ${order.price}</td> --%>
                        <td class="text-right"> ${order.total}</td>
                         <td>
                        <a href="order?action=done&id=${order.id}">Done</a> 
                        </td>
                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-center">
            <a href="order?action=all" class="btn btn-primary">All Order</a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
