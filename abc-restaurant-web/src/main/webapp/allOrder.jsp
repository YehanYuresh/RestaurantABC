
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header.jsp" />

<!DOCTYPE html>
<html>
<head>
    <title>All Orders</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin: auto;
            width: 80%;
        }
    </style>
</head>
<body style="background-image: url('image/grid-back.jpg'); background-size: cover;   " >
    
    <div class="container">
        <h1 class="text-center">All Orders</h1>
        <div class="table table-striped ">
        <div class="export-xls" >
    <button class="btn btn-success" onclick="exportTableToExcel('exported-menu')"> Excel Export</button>
   </div>
   </div>
      <!--    <a href="user?action=add" class="btn btn-danger" >Add New User</a> </div> -->
       <br>
        <table  style="background-color:white;" class="table table-striped table-bordered"  id ="OrderTable">
            <thead class="thead-dark">
                <tr>
                    <!-- <th>ID</th> -->
                    <th>Date & Time</th>
                     <th>Item</th>
                    <th>Quantity</th>
                  <!--     <th>Unit Price</th> -->
                        <th>Total Price</th>
                   
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.date}</td>
                        <td>${order.item}</td>
                        <td>${order.qty}</td>
                        <%-- <td class="text-right"> ${order.price}</td> --%>
                        <td class="text-right"> ${order.total}</td>

                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script>
        function exportTableToExcel(filename = 'All Orders') {
            var downloadLink;
            var dataType = 'application/vnd.ms-excel';
            var tableSelect = document.querySelectorAll("#OrderTable");
            var tableHTML = '';  // Initialize tableHTML as an empty string

            // Add a title to the Excel sheet (this will appear as the first row in Excel)
            tableHTML += '<tr><th colspan="5" style="font-size:24px; text-align:center;">All Orders</th></tr>';  // Adjust colspan as needed

            // Loop through selected tables and add their HTML to tableHTML
            for (let i = 0; i < tableSelect.length; i++) {
                tableHTML += tableSelect[i].outerHTML.replace(/ /g, '%20');
            }

            // Specify the file name
            filename = filename ? filename + '.xls' : 'excel_data.xls';

            // Create download link element
            downloadLink = document.createElement("a");

            document.body.appendChild(downloadLink);

            if (navigator.msSaveOrOpenBlob) {
                // IE10+ browsers: create a Blob and use msSaveOrOpenBlob
                var blob = new Blob(['\ufeff', tableHTML], {
                    type: dataType
                });
                navigator.msSaveOrOpenBlob(blob, filename);
            } else {
                // Other browsers: create a link to the file
                downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

                // Set the file name
                downloadLink.download = filename;

                // Trigger the download
                downloadLink.click();
            }

            // Remove the download link element from the DOM
            document.body.removeChild(downloadLink);
        }

</script>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
