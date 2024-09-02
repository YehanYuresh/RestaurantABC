<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
  
  .form-label {
  color: white;
}

 .container {
            margin-top: 50px;
        }
</style>

<body style="background-image: url('image/form-back.jpg'); background-size: cover;   " >
   <div  class="container" > 
         <div class="panel panel-default">     
 <div class="col col-lg-4"> 
   <div class="container text-center">
    <h1>Add User</h1>
    </div>

 
    <form action="user?action=add" method="post">
    
 <input type="hidden" name="action" value="add"/>
         <div class="form-group">
        <label class="form-label" for="username">User name</label>
        <input class="form-control type="text" id="username" name="username" required>
</div>
 <div class="form-group">
        <label class="form-label" for="password">Password</label>
        <input class="form-control type="password" id="password" name="password" required>
        </div>
         <div class="form-group">
        <label class="form-label" for="mobile">Mobile No</label>
        <input class="form-control type="text" id="mobile" name="mobile" required>
        </div>
        
         <div class="form-group">
         <label class="form-label" for="usertype">User Type:</label>
        <select class="form-control id="usertype" name="usertype" >
          <option value="Admin">Admin</option>
          <option value="Staff">Staff</option>
          <option value="Customer">Customer</option>  
        </select> 
        </div>
 <div class="container text-center">
        <input Class="btn btn-danger" type="submit" value="Add User">
    </div>
    </form>
    </div>
    </div>
    </div>
</body>
</html>