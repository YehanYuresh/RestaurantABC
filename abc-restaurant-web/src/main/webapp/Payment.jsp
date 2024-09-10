<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header3.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment</title>
    
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
    <h3>Payment Details</h1>
<br>
               <div class="panel panel-default">     
 <div class="col col-lg-4"> 
    <form action="order?action=addpay" method="post">
  
        <input type="hidden" name="action" value="add"/>
        
    <%
                    // Initialize the variables
                    String username = "";
                    String amount = "";

                    // Retrieve the session object
                    if (session != null && session.getAttribute("loggedIn") != null) {
                        username = (String) session.getAttribute("username");
                        
                        // Correctly handle amount as a Double, convert it to String
                         amount = (String) session.getAttribute("amount");
                        //amount = amountDouble != null ? String.valueOf(amountDouble) : "";
                    }
                %>
               
        
           <div  class="form-group">
        <label class="form-label" for="username">Name:</label>
        <input  class="form-control type="text" id="username" name="username" value = "<%= username %>"disabled >
</div>
<!--   <div class="form-group">
        <label class="form-label" for="password">Password:</label>
        <input  class="form-control type="password" id="password" name="password" required>   
        </div>-->
        
         <div class="form-group">
        <label class="form-label" for="amount">Full Amount</label>
        <input class="form-control  type="text" id="amount" name="amount" value ="<%= amount %>"  disabled >
        </div> 
        
         <div class="form-group">
        <label class="form-label" for="outlet">Outlet</label>
            <select class="form-control" id="outlet" name="outlet" required>
                <option value="Kandy">Kandy</option>
                <option value="Colombo - Rajagiriya">Colombo - Rajagiriya </option>
                <option value="Kurungala">Kurungala</option>
                <option value="Galle">Galle</option>           
            </select>
                 </div>
                 
                         
                           <div class="form-group">
        <label class="form-label" for="takeordertypeaway"> Order Type</label>
            <select class="form-control" id="ordertype" name="ordertype" required>
                <option value="Takeaway">Takeaway</option>
                <option value="Dine-in">Dine-in</option>  
                <option value="Cash on Delivery">Cash on Delivery</option>         
            </select>
                 </div>
                 
                  <div class="form-group">
        <label class="form-label" for="payment">Payment Method</label>
            <select class="form-control" id="payment" name="payment" required>
             <!--    <option value="1">Online</option> -->
                <option value="Cash">Cash</option>
                <option value="Card">Card</option>          
            </select>
                 </div>
         
        
        
        <div class="container text-center">
        <input  class="btn btn-danger btn-lg" type="submit" value="Pay Now">
        </div>
    </form>
    </div>
    </div>
    </div>
</body>
</html>