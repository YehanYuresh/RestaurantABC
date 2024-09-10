package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.service.ItemService;
import com.service.orderService;
import com.model.Item;




@WebServlet("/menu")
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	

    

	private ItemService itemService;
	//private orderService orderservice;

	public void init() throws ServletException {
		itemService = ItemService.getInstance();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");		
		if (action.equals("Add")) {			
			String id = request.getParameter("id");
			AddtoCart(request, response,id);			
			}
		if (action.equals("menu")) {			
	String type = request.getParameter("id");
			MenuList(request, response,type );			
			}
		if (action.equals("list")) {			
		//	String id = request.getParameter("id");
					MenuListall(request, response);			
					}

		
		}
	
	 protected void MenuListall(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        
	        Item menuItemDao = new Item();  
	        	List<Item> itemlist = new ArrayList<Item>();
	    			try {
						itemlist = itemService.getAllItems();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			request.setAttribute("items", itemlist);
	    			 request.getRequestDispatcher("menu.jsp").forward(request, response);
	        
	    }
	
	 protected void MenuList(HttpServletRequest request, HttpServletResponse response, String type) throws ServletException, IOException {
		 response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        
	        Item menuItemDao = new Item();  
	        	List<Item> itemlist = new ArrayList<Item>();
	    			try {
	    				if (type.equals("rice"))
	    				{
	    					itemlist = itemService.getAllRice();
	    				}
	    				if (type.equals("pizza"))
	    				{
	    					itemlist = itemService.getAllPizza();
	    				}
	    				if (type.equals("list"))
	    				{
	    					itemlist = itemService.getAllItems();
	    				}
	    				if (type.equals("bun"))
	    				{
	    					itemlist = itemService.getAllBun();
	    				}
	    				if (type.equals("dess"))
	    				{
	    					itemlist = itemService.getAllDess();
	    				}
	    				if (type.equals("bev"))
	    				{
	    					itemlist = itemService.getAllBave();
	    				}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	    			request.setAttribute("items", itemlist);
	    			 request.getRequestDispatcher("menu.jsp").forward(request, response);
	        
	    }

	 


	 private void AddtoCart(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
		 try {
			 HttpSession session = request.getSession(true);
			 if (session != null && session.getAttribute("loggedIn") != null)
				{
			 String ID = (String) session.getAttribute("username");
			 Integer item = Integer.valueOf(id);
			 itemService.addItemtoCart1(item, ID);

			request.getRequestDispatcher("menu?action=list").forward(request, response);
				}else
					
					request.getRequestDispatcher("user?action=regis").forward(request, response);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
		 

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			String action = request.getParameter("action");
			if (action.equals("search")) {
					try {
						search(request, response);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		}
		
	
	 

	 private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
	         String searchQuery = request.getParameter("search");
	         List<Item> results = itemService.searchInDatabase(searchQuery);
	         try {
	         request.setAttribute("items", results);
	         request.getRequestDispatcher("Search.jsp").forward(request, response);
	         } catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	     }
	 }

