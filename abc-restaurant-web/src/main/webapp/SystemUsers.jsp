
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header.jsp" />
     <%@ page import="com.model.UserModel" %>
     <%@ page import="java.util.List" %>
    <%
    List<UserModel> users = (List<UserModel>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
    <title>System Users</title>
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
        <h1 class="text-center">System Users</h1>
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                <th>Id</th>
                    <th>User Name</th>
                    <th>Password </th>
                     <th>User Type</th>
                   
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                     <td>${user.id}</td>
                   <%--  <td>${user.username}</td> --%>
                        <td>${user.password}</td>
                      <%--  <td>${user.UserType}</td>   --%>
                        <td>
                    <a href="user?action=edit&id=${user.id}">Edit</a> |
                    <a href="user?action=delete&id=${user.id}" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-center">
            <a href="user?action=add" class="btn btn-primary">Add New User</a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
