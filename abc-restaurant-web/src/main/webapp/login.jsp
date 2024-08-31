<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login Page</title>
  <link rel="stylesheet" href="./css/style.css">
</head>
<style>
#bg {
  background-image: url('image/log-back1.jpg');
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  filter: blur(5px);
}
form .form-field:nth-child(1)::before {
  background-image: url('image/user-icon.png');
  width: 20px;
  height: 20px;
  top: 15px;
}
form .form-field:nth-child(2)::before {
  background-image: url('image/lock-icon.png');
  width: 16px;
  height: 16px;
}
</style>

<body>
<div id="bg"></div>


<form action="login" method="post">
  <div class="form-field">
    <input type="text" id="username" name="username" placeholder="Username" required/>
  </div>
  
  <div class="form-field">
    <input type="password" id="password" name="password" placeholder="Password" required/>                         
    </div>
  
  <div class="form-field">
    <button class="btn" type="submit">Login</button>
  </div>
  <div class="form-field">
  <a href="user?action=regis" class="btn">Register</a>
  </div>
  <div class="msg">

     <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
        <p  ><%= errorMessage %></p>
    <%
        }
    %>
  </div>
</form>
 
</body>
</html>


