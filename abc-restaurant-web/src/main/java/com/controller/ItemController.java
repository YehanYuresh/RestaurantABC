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
import com.model.UserModel;
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
		if (action == null || action.equals("list"))		
		{AllItems(request, response);}
		
		else if (action.equals("add")) {
			showAddItem(request, response);
		}
		
		else if (action.equals("offer")) {
			AllOffers(request, response);
		}
		else if (action.equals("offermenu")) {
			AllOffersMenu(request, response);
		}
		 else if (action.equals("edit")) {
      	   String ID = request.getParameter("id");
      	   Integer id = Integer.valueOf(ID);
      	   showUpdateItem(request,response,id);
      }
		 else if (action.equals("OfferE")) {
	      	   String ID = request.getParameter("id");
	      	   Integer id = Integer.valueOf(ID);
	      	   showUpdateOffer(request,response,id);
	      }
		

       else if (action.equals("delete")) {
    	   String ID = request.getParameter("id");
    	   Integer id = Integer.valueOf(ID);
    	 deleteItem(request,response,id);
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
	 private void showUpdateItem(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException {
		 Item item;
		try {
			item = itemService.getItemById(id);
			 request.setAttribute("item", item);  
		} catch (SQLException e) {
			request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
		}		    	 
	        request.getRequestDispatcher("UpdateItem.jsp").forward(request, response);              
	    }
	 
	 private void showUpdateOffer(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException {
		 Item item;
		try {
			item = itemService.getItemById(id);
			 request.setAttribute("item", item);  
		} catch (SQLException e) {
			request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
		}		    	 
	        request.getRequestDispatcher("UpdateOffer.jsp").forward(request, response);              
	    }
	 
	 

	  private void deleteItem(HttpServletRequest request, HttpServletResponse response , int Id ) throws ServletException, IOException {
	
		  itemService.deleteItem(Id);
	        response.sendRedirect("item?action=list&remove=true");
		  }
	  
		private void AllOffers(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			List<Item> itemlist = new ArrayList<Item>();
			try {
				itemlist = itemService.getOffer();
				request.setAttribute("items", itemlist);
			} catch (SQLException e) {
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("error.jsp").forward(request, response);
				return;
			}
			request.getRequestDispatcher("offerList.jsp").forward(request, response);
		}
		
		private void AllOffersMenu(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			List<Item> itemlist = new ArrayList<Item>();
			try {
				itemlist = itemService.getOffer();
				request.setAttribute("items", itemlist);
			} catch (SQLException e) {
				request.setAttribute("errorMessage", e.getMessage());
				request.getRequestDispatcher("error.jsp").forward(request, response);
				return;
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
	

	// common post
	// method--------------------------------------------------------------------
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action.equals("add")) {
			addItems(request, response);
		}
		if (action.equals("edit")) {
			  updateItem(request, response); 
			  }
		if (action.equals("editO")) {
			  updateOffer(request, response); 
			  }
		else if (action.equals("offermenu")) {
			AllOffersMenu1(request, response);
		}
	}
	private void AllOffersMenu1(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Item> itemlist = new ArrayList<Item>();
		try {
			itemlist = itemService.getOffer();
			request.setAttribute("items", itemlist);
		} catch (SQLException e) {
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	

	private void addItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			       try {			    	 
			        	String name = request.getParameter("name");
			        	String category = request.getParameter("category");
			        String descrip = request.getParameter("descrip");
			        double price = Double.valueOf(request.getParameter("price"));		        	        	
						
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
						       item.setCategory(category);
						        itemService.addItems(item);
						  }					

							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					        response.sendRedirect("item?action=list&add=true");       
			    }
	
			
	  private void updateItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String ID = request.getParameter("Id");
		  Integer id = Integer.valueOf(ID);
		  String name = request.getParameter("name");
		  String category = request.getParameter("category");
	        String descrip = request.getParameter("descrip");
	        double price = Double.valueOf(request.getParameter("price"));		        	        	
					        

	        Part part = request.getPart("image"); 
			  if (part !=  null) {
				  InputStream imgInputStream = part.getInputStream(); 
			  byte[] image = new byte[imgInputStream.available()];
              imgInputStream.read(image);
			 
			  
	        	 Item item = new Item();
	        	 if (image.length == 0)
	        	 {
	        		 item.setId(id);
		        	 item.setName(name);
		        	 item.setDescription(descrip);
		        	 item.setPrice(price); 
		        	 item.setCategory(category);
		        	 itemService.updateItemNoImage(item);
	        	 }else
	        	 {
	        		 item.setId(id);
		        	 item.setName(name);
		        	 item.setDescription(descrip);
		        	 item.setPrice(price);
		        	 item.setImage(image); 
		        	 item.setCategory(category);
		        	 itemService.updateItem(item);
	        	 }
	        	
	        	 response.sendRedirect("item?action=list&update=true");
	     
	        	 }
			  } 
	  private void updateOffer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String ID = request.getParameter("Id");
		  Integer id = Integer.valueOf(ID);
		  String name = request.getParameter("name");
	        String descrip = request.getParameter("descrip");
	        double price = Double.valueOf(request.getParameter("price"));		        	        	
					        

	        Part part = request.getPart("image"); 
			  if (part !=  null) {
				  InputStream imgInputStream = part.getInputStream(); 
			  byte[] image = new byte[imgInputStream.available()];
              imgInputStream.read(image);
			 
			  
	        	 Item item = new Item();
	        	 if (image.length == 0)
	        	 {
	        		 item.setId(id);
		        	 item.setName(name);
		        	 item.setDescription(descrip);
		        	 item.setPrice(price); 
		        	 itemService.updateItemNoImage(item);
	        	 }else
	        	 {
	        		 item.setId(id);
		        	 item.setName(name);
		        	 item.setDescription(descrip);
		        	 item.setPrice(price);
		        	 item.setImage(image);   
		        	 itemService.updateItem(item);
	        	 }
	        	 response.sendRedirect("item?action=offer&update=true");
	     
	        	 }
			  } 
	  
			
}
