<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
.navbar-default .navbar-fnt .nav-item {
    color: #FFFFFF;
}

.navbar .nav-link, 
.navbar .navbar-toggler-icon {
    color: #FFFFFF !important; /* Make sure all text in the navbar is white */
}

.navbar .nav-link:hover, 
.navbar :hover {
    color: #CCCCCC !important; /* Lighter color on hover for better UX */
}

.dropdown-menu .dropdown-item {
    color: black; /* Keep dropdown items readable */
}

.dropdown-menu .dropdown-item:hover {
    background-color:GREE; /* Match hover color with navbar */
    color: #FFFFFF;
}
 .custom-search-input {
            border: none;
            border-bottom: 1px solid #FFFFFF; /* Line color */
            padding: 5px 0;
            outline: none;
            color: #FFFFFF;
            background: transparent;
            font-size: 16px;
            text-align: right; 
            
        }
        
        .custom-search-input::placeholder {
            color: #FFFFFF; /* Placeholder color */
        }
        
   .navbar {
            padding: 0.5rem 1rem; /* Adjust navbar padding */
            height: 60px; /* Set fixed height */
        }

        .nav-item {
            display: flex; /* Flexbox for alignment */
            align-items: center; /* Center align items vertically */
        }

        .dropdown-menu {
            margin: 0; /* Remove margin */
            padding: 0; /* Remove padding */
            min-width: 160px; /* Set minimum width */
        }

        .dropdown-item {
            padding: 0.5rem 1rem; /* Adjust padding for dropdown items */
        }

        /* Optional: Fix height issues caused by specific Bootstrap classes */
        .dropdown-toggle::after {
            display: none; /* Hide default dropdown arrow */
        }
</style>
<body >

<nav class="navbar navbar-expand-lg bg-body-tertiary"  style="background-color:#15660f ;">
<%
if (session != null && session.getAttribute("loggedIn") != null) {
    String usertype = (String) session.getAttribute("usertype");
    
    if  (usertype.equals("Customer"))
    { %>
    <div class="container-fluid">
   <a class="navbar-brand" href="item?action=offermenu"  style="color: black;" >
      <img src="image/logo.png" alt="ABC Restaurant" width="30" height="30">  ABC Restaurant
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">   
      

       
       <li class="nav-item" >
       <a class="nav-link" href="menu?action=list" >Menu</a>
       </li>
       
       <li class="nav-item">
      		 <a class="nav-link" href="order?action=allcart"> My Cart
       		<img  src="image/cart-48.png" width="25" height="25"></a>
        </li>
                </ul>
         </div>
  </div>
        
         <ul class="navbar-nav me-auto mb-2 mb-lg-0">
     	<form action="menu?action=search" method="post"  class="d-flex">
            <input class="custom-search-input" name="search" type="search" placeholder="Search" aria-label="Search">
           
          <!--   <a class="nav-link" href="order?action=allcart">
                    <img  src="image/search.png" width="25" height="25"></a> -->
           <button class="btn btn-outline-success" type="submit">Search</button> 
        </form> 
        </ul>

    	
   <% } else if  (usertype.equals("Staff"))
   {%>
   
    <div class="container-fluid">
   <a class="navbar-brand"  href="item?action=offermenu"  style="color: black;" >
      <img src="image/logo.png" alt="ABC Restaurant" width="30" height="30">  ABC Restaurant
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">   

<li class="nav-item" >
       <a class="nav-link" href="menu?action=list" >Menu</a>
       </li>
       
            <li class="nav-item">
           <a class="nav-link" href="order?action=list">Pending Order</a>
       </li>
            <li class="nav-item">
           <a class="nav-link" href="order?action=table">Table Reservation</a>
       </li>       
              <li class="nav-item">
           <a class="nav-link" href="order?action=all">Daily Sales Report</a>
       </li>
      </ul>
    </div>
  </div>
  
   
	   
  <% }  else if  (usertype.equals("Admin"))
  {  %>
  
  <div class="container-fluid">
   <a class="navbar-brand" href="item?action=offermenu"  style="color: black;" >
      <img src="image/logo.png" alt="ABC Restaurant" width="30" height="30">  ABC Restaurant
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">   
      

       
       <li class="nav-item" >
       <a class="nav-link" href="menu?action=list" >Menu</a>
       </li>
       
        <li class="nav-item">
           <a class="nav-link" style ="width:110px;" href="user?action=list">System Users</a>
       </li>
           <li class="nav-item">
           <a class="nav-link" href="item?action=list">Items</a>
       </li>
       </li>
           <li class="nav-item">
           <a class="nav-link" href="item?action=offer">Offers</a>
       </li>
            <li class="nav-item">
           <a class="nav-link" style ="width:120px;" href="order?action=list">Pending Order</a>
       </li>
            <li class="nav-item">
           <a class="nav-link" style ="width:140px;" href="order?action=table">Table Reservation</a>
       </li>
       
           <li style ="width:120px;" class="nav-item dropdown">
                        <a  class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Reports
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="order?action=all">Daily Sales Report</a>
                            <a class="dropdown-item" href="order?action=month">Monthly Sales Report</a>
                        </div>
                    </li>
 
 <!--   <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Reports
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a class="dropdown-item" href="order?action=all">Daily Sales Report</a>
                      <a class="dropdown-item" href="order?action=month">Monthly Sales Report</a>
                    </div>
                </li>  -->               
      </ul>
    </div>
  </div>
 <% }
    
}else
{
	%>
	<div class="container-fluid">
	   <a class="navbar-brand" href="item?action=offermenu"  style="color: black;" >
	      <img src="image/logo.png" alt="ABC Restaurant" width="30" height="30">  ABC Restaurant
	    </a>

	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
	    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
   <li class="nav-item" >
       <a class="nav-link" href="menu?action=list" >Menu</a>
       </li>

<% }
%>
       <ul class="navbar-nav me-auto mb-2 mb-lg-0">
     <%
        // Retrieve the session object
       

        if (session != null && session.getAttribute("loggedIn") != null) {
            String username = (String) session.getAttribute("username");
    %>
             <li class="nav-item">
          <span style ="width:200px; text-align: right; " class="navbar-text"> Welcome <%= username %> </span>

        </li>

         <li class="nav-item">
 <a class="nav-link active" aria-current="page" href="login?action=out">LogOut</a>
        </li> 

    <%  } else {  %>
           <li class="nav-item">
 <a class="nav-link active" aria-current="page" href="login?action=out">Login</a>
          </li> 

      <% }  %>
    

        
        </ul>
  </div>
</nav>

    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
</body>
</html>
