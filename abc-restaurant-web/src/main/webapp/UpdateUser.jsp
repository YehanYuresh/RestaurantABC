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

 <h1 >Update User Details</h1>

  <div class="panel panel-default">     
 <div class="col col-lg-4"> 

     <form action="user?action=edit" method="post" >
  <div class="form-group">
   <input type="hidden" name="Id" value="<%= user.getId() %>">
   
    <label class="form-label" for="exampleInputEmail1">Username</label>
    <input  type="text" class="form-control" value="<%= user.getUserName() %>"  id="username" name="username"  required >
  </div>
  
  <div class="form-group">
    <label class="form-label" for="password ">Password</label>
    <input type="password"  required class="form-control" value="<%= user.getPassword() %>"  id="password" name="password">
  </div>
  
 <div class="form-group">
    <label class="form-label" for="mobile">Mobile No</label>
    <input type="text" required  class="form-control" value="<%= user.getMobile() %>"  name="mobile" id="mobile">
  </div> 
  
  <div class="form-group" >
    <label class="form-label" for="usertype">User Type</label>
    
  <select class="form-control"  id="usertype" name="usertype" >
    <option value="Admin" <%= "Admin".equals(user.getUserType()) ? "selected" : "" %>>Admin</option>
    <option value="Staff" <%= "Staff".equals(user.getUserType()) ? "selected" : "" %>>Staff</option>
    <option value="Customer" <%= "Customer".equals(user.getUserType()) ? "selected" : "" %>>Customer</option>
</select>
  </div>
  <div class="container text-center">
  <input type="submit" class="btn btn-danger" value ="Update User">
  </div>  
</form>


</div>
 </div>
</div> 






</body>
</html>
