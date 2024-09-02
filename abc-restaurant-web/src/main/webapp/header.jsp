<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">



</head>
<body  >

<nav class="navbar navbar-expand-lg bg-body-tertiary"  style="background-color: #557A46;">
<!-- <div class="container">   
  </div> -->
  <div class="container-fluid">
   <a class="navbar-brand" href="main.jsp"  style="color: black;" >
      <img src="image/logo.png" alt="ABC Restaurant" width="30" height="30"> ABC Restaurant
    </a>
   <!--  <a class="navbar-brand" href="main.jsp">ABC Restaurant</a> -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       <!--  <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li> -->
       <li class="nav-item" >
                    <a class="nav-link" href="order?action=list">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product?action=list">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user?action=list">System Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="item?action=list">Items</a>
                </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Orders
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="order?action=list">Pending Order</a></li>
            <li><a class="dropdown-item" href="#">All Order</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
       <!--  <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li> -->
      </ul>
      
      <!-- <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form> -->
    </div>
  </div>
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <a class="navbar-brand"></a>
    <a class="navbar-brand"></a>
    <a class="navbar-brand"></a>
    <a class="navbar-brand"></a>
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success" type="submit" >Search</button>
    </form>
   
    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
    
          <li class="nav-item">
          <span class="navbar-text"> Welcome User </span>

        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="login.jsp">LogOut</a>
        </li>
        
        </ul>
  </div>
</nav>




<!--     <nav class="navbar navbar-expand-lg navbar-light bg-light"  >
        <a class="navbar-brand" href="main.jsp">ABC Restaurant</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
             <li class="nav-item">
                    <a class="nav-link" href="order?action=list">Order</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="product?action=list">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user?action=list">System Users</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </nav> -->
    <hr>
</body>
</html>
