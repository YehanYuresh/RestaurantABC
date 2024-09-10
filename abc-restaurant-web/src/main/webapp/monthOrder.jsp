
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:import url="header3.jsp" />
    <%@ page import="com.model.Order" %>
     <%@ page import="java.util.List" %>
    <%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Monthly Sales</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .table {
            margin: auto;
            width: 100%;
        }
table {
display: block;
  max-height: 450px;

  overflow-y: scroll;
}
.table-responsive {
    width: 100%; /* Adjust this width as needed */
}

.table-scrollable {
    display: block;
    max-height: 450px; /* Adjust the max-height as needed */
    overflow-y: scroll; /* Enable vertical scrolling */
    width: 100%; /* Full width */
}

.table-scrollable table {
    width: 200%; /* Adjust width for table */
}

thead, tfoot {
    display: table; /* Keep the header and footer as table */
    width: 100%; /* Full width */
    table-layout: fixed; /* Fix table layout */
}

tbody {
    display: table; /* Keep tbody display as table */
    width: 100%; /* Full width */
    table-layout: fixed; /* Fix table layout */
}



    </style>
</head>
<body style="background-image: url('image/grid-back.jpg'); background-size: cover;   " >
    <div class="container">
        <h1 class="text-center">Monthly Sales Report</h1>
        
          <div class="table table-striped export-xls">
    <button class="btn btn-success" onclick="exportTableToExcel('exported-menu')"> Excel Export</button>
   </div>
   <br>
    <% if (orders != null && !orders.isEmpty()) { 
    	double grandTotal = 0.0;
    %> <!-- Check if users list is not null and not empty -->
 
        <table class="table table-striped table-bordered" style="background-color:white; "  id ="OrderTable"> 
            <thead class="thead-dark">
                <tr>
                    <!-- <th>ID</th> -->
                    <th style="width:110px">Date</th>
                      <th style="width:150px">Invoice No</th>
                        <th style="width:150px" >Order No</th>
                          <th style="width:120px">Customer</th>
                          <th style="width:120px">Outlet</th>
                            <th style="width:100px">Order Type</th>	
                              <th style="width:80px">Payment Type</th>
                                <th style="width:120px">Item</th>
                    <th style="width:50px" >Qty</th>
                    <th style="width:80px" >Unit Price</th>
                        <th style="width:80px" >Total Price</th>
                   
                </tr>
            </thead>
            <tbody>
                <%-- <c:forEach var="order" items="${orders}"> --%>
                <% for (Order item : orders) { %> <!-- Iterate over the users list using a for loop -->

                    <tr>
                     <td style="width:110px" ><%= item.getDate() %></td>
                      <td style="width:150px"><%= item.getInvoiceNo() %></td>
                       <td style="width:150px" ><%= item.getId() %></td>
                        <td style="width:120px"><%= item.getOrderBy() %></td>
                         <td style="width:120px"><%= item.getOutlet() %></td>
                          <td style="width:100px"><%= item.getOrderType() %></td>                          
                           <td style="width:80px"><%= item.getPayment() %></td>
                            <td style="width:120px" ><%= item.getItem() %></td>                            
                             <td style="width:50px"><%= item.getQty() %></td>
                             <td style="width:80px"><%= item.getUnitPrice() %></td>
                             <td style="width:80px" ><%= item.getTotal() %></td>
                     
                                 <%
                            // Add the item's total price to the grand total
                            grandTotal += item.getTotal();
                        %>            
                    </tr>
                    
           <%--  </c:forEach> --%>
            <% } %>
            </tbody>
       <tfoot>
            <tr>
                 <tr>
                    <td style="width:100px" colspan="10" class="text-right"><strong>Grand Total:</strong></td>
                    <!-- Display grand total formatted using Java -->
                    <td style="width:100px" class="text-right"><strong><%= String.format("%.2f", grandTotal) %></strong></td>
                </tr>
            </tr>
        </tfoot>
               
            
        </table>
     
                        <% } else { %>
    <!-- Display message if no users are found -->
     <div class="text-center">
           <p style="color:white;">No Sales Records.</p>
        </div>
<% } %>
        <br>
        <script>
    function exportTableToExcel(filename = 'Monthly Sales Report') {
        var downloadLink;
        var dataType = 'application/vnd.ms-excel';
        var tableSelect = document.querySelectorAll("#OrderTable");
        var tableHTML = '<table>'; // Initialize the table HTML string
        
        // Add a title row with a specific title "Sales Report" to the Excel sheet
        tableHTML += '<tr><th colspan="5" style="text-align:center; font-size:16px;">Sales Report</th></tr>';

        // Append table content
        for (let i = 0; i < tableSelect.length; i++) {
            tableHTML += tableSelect[i].outerHTML.replace(/ /g, '%20');
        }
        
        tableHTML += '</table>'; // End the HTML for the table

        // Specify file name
        filename = filename ? filename + '.xls' : 'excel_data.xls';

        // Create download link element
        downloadLink = document.createElement("a");

        document.body.appendChild(downloadLink);

        if (navigator.msSaveOrOpenBlob) {
            var blob = new Blob(['\ufeff', tableHTML], {
                type: dataType
            });
            navigator.msSaveOrOpenBlob(blob, filename);
        } else {
            // Create a link to the file
            downloadLink.href = 'data:' + dataType + ', ' + tableHTML;

            // Setting the file name
            downloadLink.download = filename;

            // Triggering the function
            downloadLink.click();
        }

        // Remove the download link after triggering the download
        document.body.removeChild(downloadLink);
    }
</script>


 

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
