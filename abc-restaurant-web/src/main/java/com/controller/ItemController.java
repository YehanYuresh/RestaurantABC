package com.controller;

import java.awt.Image;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.model.Item;
import com.service.ItemService;

@WebServlet("/item")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB threshold after which files will be written to disk
        maxFileSize = 1024 * 1024 * 10,       // 10 MB maximum file size
        maxRequestSize = 1024 * 1024 * 50     // 50 MB maximum request size
)
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ItemService itemService;

	public void init() throws ServletException {
		itemService = ItemService.getInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action == null || action.equals("list")) {AllItems(request, response);}
		else if (action.equals("add")) {
			showAddItem(request, response);
		}
	}

	private void AllItems(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Item> itemlist = new ArrayList<Item>();
		try {
			itemlist = itemService.getAllItems();
			request.setAttribute("items", itemlist);
		} catch (SQLException e) {
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("AllItems.jsp").forward(request, response);
	}
	 private void showAddItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getRequestDispatcher("addItem.jsp").forward(request, response);
	    }

	// common post
	// method--------------------------------------------------------------------
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action.equals("add")) {
			addItems(request, response);
		}
		/*
		 * if (action.equals("edit")) { updateItem(request, response); }
		 */

	}

	private void addItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			       try {
			    	 
			        	String name = request.getParameter("name");
			        String descrip = request.getParameter("descrip");
			        double price = Double.valueOf(request.getParameter("price"));		        
					
					/*
					 * LocalDateTime now = LocalDateTime.now(); DateTimeFormatter formatter =
					 * DateTimeFormatter.ofPattern("yyMMddHHmm"); String formattedDateTime =
					 * now.format(formatter); Integer id = formattedDateTime.hashCode();
					 */
				/*	 
			        String imageCheck = request.getParameter("image");
			        
			        if (imageCheck != "" && !imageCheck.isEmpty())
			        {	  */      	
			        	
						
						  Part part = request.getPart("image"); 
						  if (part !=  null) {
							  InputStream imgInputStream = part.getInputStream(); 
						  byte[] image = new byte[imgInputStream.available()];
	                        imgInputStream.read(image);
						 
						  
				        	 Item item = new Item();
						        item.setName(name);
						        item.setDescription(descrip);
						        item.setPrice(price);
						       item.setImage(image);        
						        itemService.addItems(item);
						  }
								/*
								 * } else { Item item = new Item(); item.setName(name);
								 * item.setDescription(descrip); item.setPrice(price);
								 * itemService.addItems(item); }
								 */
					

							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					        response.sendRedirect("item?action=list");       
			    }
			 
				
			
}
