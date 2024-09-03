<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header.jsp" />
    <%@ page import="com.model.UserModel" %>
<%
UserModel user = (UserModel) request.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <h2>Update User</h2>
 
    <form action="user?action=edit" method="post">
       <input type="hidden" name="action" value="update">
         <input type="hidden" name="Id" value="<%= user.getId() %>">
        
        <label for="username">Username:</label>
        <input type="text" name="username" value="<%= user.getUserName() %>" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" name="password" value="<%= user.getPassword() %>" required><br><br>
        
       
        <label for="usertype">User Type:</label>
<select id="usertype" name="usertype">
    <option value="Admin" <%= "Admin".equals(user.getUserType()) ? "selected" : "" %>>Admin</option>
    <option value="Staff" <%= "Staff".equals(user.getUserType()) ? "selected" : "" %>>Staff</option>
    <option value="Customer" <%= "Customer".equals(user.getUserType()) ? "selected" : "" %>>Customer</option>
</select> <br><br>
        
        <input type="submit" value="Update User">
    </form>

</body>
</html>
