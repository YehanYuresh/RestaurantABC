<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header2.jsp" />

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
    <h1>Register New Customer</h1>
<br>
               <div class="panel panel-default">     
 <div class="col col-lg-4"> 
    <form action="user?action=add" method="post">
  
        <input type="hidden" name="action" value="add"/>
           <div  class="form-group">
        <label class="form-label" for="username">User name:</label>
        <input  class="form-control type="text" id="username" name="username" required>
</div>
 <div class="form-group">
        <label class="form-label" for="password">Password:</label>
        <input  class="form-control type="password" id="password" name="password" required>   
        </div>
        
         <div class="form-group">
        <label class="form-label" for="mobile">Mobile No</label>
        <input class="form-control type="text" id="mobile" name="mobile" required>
        </div>
        
        <input type="hidden" id="usertype" name="usertype" value ='Customer' >
        
        <div class="container text-center">
        <input Class="btn btn-danger" type="submit" value="Register">
        </div>
    </form>
    </div>
    </div>
    </div>
</body>
</html>