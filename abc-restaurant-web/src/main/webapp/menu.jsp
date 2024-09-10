<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header3.jsp" />
<%@ page import="com.model.Item" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>

<%
    List<Item> items = (List<Item>) request.getAttribute("items");
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Items</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
          <%
if (session != null && session.getAttribute("loggedIn") != null) {
    String usertype = (String) session.getAttribute("usertype");
    
      if (usertype.equals("Admin") || usertype.equals("Staff"))
    { %>
      
      <style>
        .overlay {
     
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0); /* Transparent overlay */
            z-index: 9999; /* On top of all content */
            pointer-events: none; /* Block mouse interactions */
        }
    </style>
<%}} %>

    <style>
        .container {
            margin-top: 10px;
        }
     


        .food-item {
            margin-bottom: 15px;
        }
          .food-item {
      
        background-color: white; /* White background */
        border-radius: 8px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for card effect */
        padding: 20px; /* Padding inside the box */
        margin-bottom: 20px;
        margin-right: 20px; /* Space between items */
        text-align: center; /* Center content */
        transition: transform 0.2s ease-in-out; /* Smooth transition on hover */
        background-color: white; /* White background */
        border-radius: 8px; /* Rounded corners */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for card effect */
        padding: 20px; /* Padding inside the box */
        margin-bottom: 20px; /* Space between items */
        text-align: center; /* Center content */
        transition: transform 0.2s ease-in-out; /* Smooth transition on hover */

        /* Set the desired width and height */
        max-width: 250px; /* Change this value to set the width */
        height: 500px; 
    }

    .food-item:hover {
        transform: translateY(-5px); /* Lift the box slightly on hover */
    }

    .food-item img {
        width: auto;
        height: 200px;
        margin-bottom: 15px; /* Space below the image */
    }

    .food-item h5 {
        margin-top: 10px;
        font-size: 18px;
        font-weight: bold;
    }

    .food-item p {
        color: #666; /* Gray color for description */
        margin-bottom: 15px;
        height: 10px; 
    }

    .food-item span {
        font-size: 16px;
        font-weight: bold;
        color: #333; /* Darker text for the price */
        margin-top: 10px;
          position: absolute;
            bottom: 60px;  /* 20px from the bottom of the box */
            left: 50%;
            transform: translateX(-50%); /* Center the button horizontally */
            padding: 10px 20px;
    }

    .food-item .btn {
        margin-top: 10px;
          position: absolute;
            bottom: 20px;  /* 20px from the bottom of the box */
            left: 50%;
            transform: translateX(-50%); /* Center the button horizontally */
            padding: 10px 20px;
    }
       .popup {
            display: none; /* Initially hidden */
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color:rgba(255, 99, 71, 0.5) ;
            color: #fff;
            padding: 20px;
            border-radius: 5px;
            font-size: 18px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            z-index: 9999;
        }

        .popup.show {
            display: block; /* Show the popup */
        }
    </style>
</head>
<body style="background-image: url('image/back.jpg'); background-size: cover;">
<br>
<ul style ="background-color:white; align:center;" class="nav justify-content-center">
  <li class="nav-item">
    <a class="nav-link" href="menu?action=menu&id=list">All</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="menu?action=menu&id=rice">Rice & Biriyani</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="menu?action=menu&id=pizza">Pizza</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="menu?action=menu&id=bun">Bun</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="menu?action=menu&id=dess">Desserts</a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="menu?action=menu&id=bev">Beverages</a>
  </li>
  
 
</ul>

  <div class="overlay">
<div id="popup" class="popup">
       Added to Cart
    </div>
    <div class="container">
 
        <!-- <h2 class="text-center text-white">Food Items</h2> -->
        
        <!-- Initial list of items -->
        <div id="initialItemList" class="row">
            <% if (items != null && !items.isEmpty()) { %> <!-- Check if items list is not null and not empty -->
                <% for (Item item : items) { %> <!-- Iterate over the items list using a for loop -->
              <div class="col-md-4 food-item">
    <% if (item.getImage() != null) {
        String base64Image = Base64.getEncoder().encodeToString(item.getImage());
    %>
        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Image" class="food-image" />
    <% } %>
    <h5><%= item.getName() %></h5>
    <div style ="max-height: 10px;">
    <p style ="max-width: 75ch;"><%= item.getDescription() %></p>
    </div>
    <span>Rs.<%= item.getPrice() %>0</span><br>
    <a href="menu?action=Add&id=<%= item.getId() %>" onclick="showPopup()" class="btn btn btn-danger">Add to cart</a> 
     
</div>
                 
                <% } %>
            <% } else { %>
                <!-- Display message if no items are found -->
                <div class="text-center">
                    <p style="color:white;">No items found.</p>
                </div>
            <% } %>
        </div>

        <!-- Button to load more items dynamically -->
      

        <!-- Dynamic section where new items will be appended -->
        <div id="dynamicItemList" class="row mt-4"></div>

    </div>

    <script>
    function showPopup() {
        var popup = document.getElementById("popup");
        popup.classList.add("show");  // Show the popup

        // Automatically hide the popup after 3 seconds (3000 milliseconds)
        setTimeout(function() {
            popup.classList.remove("show"); // Hide the popup
        }, 500);
    }
    
        // This function dynamically loads more food items using fetch/AJAX
        document.getElementById('loadMoreBtn').addEventListener('click', function() {
            // Fetch more items from the backend (assuming you have a URL to handle this)
            fetch('/getMoreItems')
                .then(response => response.json())
                .then(data => {
                    if (data && data.length > 0) {
                        const dynamicItemList = document.getElementById('dynamicItemList');

                        data.forEach(item => {
                            const foodDiv = document.createElement('div');
                            foodDiv.className = 'col-md-4 food-item';

                            let imageHTML = '';
                            if (item.image) {
                                imageHTML = `<img src="data:image/jpeg;base64,${item.image}" alt="Image" style="width:100px; height:auto;" />`;
                            }

                            foodDiv.innerHTML = `
                                ${imageHTML}
                                <h5>${item.name}</h5>
                                <p>${item.description}</p>
                                <span>${item.price}</span>
                            `;

                            dynamicItemList.appendChild(foodDiv);
                        });
                    } else {
                        alert('No more items to load.');
                    }
                })
                .catch(error => console.error('Error fetching more items:', error));
        });
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </div>
</body>
</html>
