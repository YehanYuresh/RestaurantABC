package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Order;
import com.service.orderService;


@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private orderService orderservice;
     
	public void init() throws ServletException {
		orderservice = orderService.getInstance();
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            pendingOrder(request, response);
        }
        else  if (action.equals("all")) {
            allOrder(request, response);
        }
         else if (action.equals("done")) {
           	   String ID = request.getParameter("id");
           	   Integer id = Integer.valueOf(ID);
           	 orderComplete(request,response,id);
           }
	}
	
	 private void pendingOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
	    	List<Order> pendingList = new ArrayList<Order>();
			try {
				pendingList = orderservice.getPendingOrder();
				request.setAttribute("orders", pendingList);
			} catch ( SQLException e) {
				request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	            return;
			}	    	
	        request.getRequestDispatcher("pendingOrder.jsp").forward(request, response);
	    }
	 
	 private void allOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
	    	List<Order> pendingList = new ArrayList<Order>();
			try {
				pendingList = orderservice.getallOrder();
				request.setAttribute("orders", pendingList);
			} catch ( SQLException e) {
				request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	            return;
			}	    	
	        request.getRequestDispatcher("allOrder.jsp").forward(request, response);
	    }
	 
	  private void orderComplete(HttpServletRequest request, HttpServletResponse response , int Id ) throws ServletException, IOException {		
		  		orderservice.orderComplete(Id);
		        response.sendRedirect("order?action=list");
			  }

}
