<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Item</title>
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
    <h1>Add New Item</h1>
    </div> 
    
    <form action="item?action=add" method="post" enctype="multipart/form-data" >
    
 <input type="hidden" name="action" value="add"/>
         <div class="form-group">
        <label class="form-label" for="name">Name</label>
        <input class="form-control" type="text" id="name" name="name" required>
</div>
 <div class="form-group">
        <label class="form-label" for="descrip">Description</label>
        <input class="form-control" type="text" id="descrip" name="descrip" required>
        </div>
         <div class="form-group">
        <label class="form-label" for="price">Price</label>
        <input class="form-control" type="text" id="price" name="price" required>
        </div>
        <br>
        <div class="custom-file">

    <input type="file" class="custom-file-input" id="image" name="image" >
    <label class="custom-file-label" for="customFile">Upload Image</label>
  </div>
  
  <script>
// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

 <div class="container text-center">
        <input Class="btn btn-danger" type="submit" value="Add New Item">
    </div>
    </form>
    </div>
    </div>
    </div>
</body>
</html>