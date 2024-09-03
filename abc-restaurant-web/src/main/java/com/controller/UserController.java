package com.controller;

//import model.User;
import com.model.UserModel;
//import com.service.LoginService;
import com.service.UserService;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

@WebServlet("/user")
public class UserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UserService userService;
    
	public void init() throws ServletException {
		userService = UserService.getInstance();
    }
	// common get method ------------------------------------------------------
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
        	SystemUser(request, response);
        	
        } else if (action.equals("add")) {
        	showAddForm(request, response);
        }
        else if (action.equals("edit")) {
        	   String ID = request.getParameter("id");
        	   Integer id = Integer.valueOf(ID);
        	   showUpdateForm(request,response,id);
        }
         else if (action.equals("regis")) {
	     	showRegisForm(request, response);
	     }
         else if (action.equals("delete")) {
      	   String ID = request.getParameter("id");
      	   Integer id = Integer.valueOf(ID);
      	 deleteUser(request,response,id);
      }
        }
	
	
	
	 private void SystemUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
	    	List<UserModel> userlist = new ArrayList<UserModel>();
			try {
				userlist = userService.getAllUsers();
				request.setAttribute("users", userlist);
			} catch ( SQLException e) {
				request.setAttribute("errorMessage", e.getMessage());
	            request.getRequestDispatcher("error.jsp").forward(request, response);
	            return;
			}	    	
	        request.getRequestDispatcher("SystemUsers.jsp").forward(request, response);
	    }
	 
	 private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getRequestDispatcher("addUser.jsp").forward(request, response);
	    }
	 
	 private void showUpdateForm(HttpServletRequest request, HttpServletResponse response, int id) throws ServletException, IOException {
		 UserModel userlist2;
		try {
			userlist2 = userService.getUserByUsername(id);
			 request.setAttribute("user", userlist2);  
		} catch (SQLException e) {
			request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
		}		    	 
	        request.getRequestDispatcher("UpdateUser.jsp").forward(request, response);              
	    }
	 
	 private void showRegisForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getRequestDispatcher("regisUser.jsp").forward(request, response);
	    }
	  private void deleteUser(HttpServletRequest request, HttpServletResponse response , int Id ) throws ServletException, IOException {
		//	String ID = request.getParameter("Id");
			//Integer id = Integer.valueOf(ID);			
	        userService.deleteUser(Id);
	        response.sendRedirect("user?action=list");
		  }
	 
	 
	 //common post method--------------------------------------------------------------------
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			 String action = request.getParameter("action");
		        if (action.equals("add")) {
		        	addUser(request, response);
		        }				
				  if (action.equals("edit")) {
				  updateUser(request, response); 
				  }
				
				 
		}
		 private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        String username = request.getParameter("username");
		        String password = request.getParameter("password");
		        String usertype = request.getParameter("usertype");
		        
		        UserModel user = new UserModel();
		        user.setUserName(username);
		        user.setPassword(password);
		        user.setUserType(usertype);
		        userService.addUser(user);
		        response.sendRedirect("user?action=list");
		    }
		 
			
			  private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String ID = request.getParameter("Id");
				Integer id = Integer.valueOf(ID);
				String username = request.getParameter("username");
		        String password = request.getParameter("password");
		        String usertype = request.getParameter("usertype");
		        
		        UserModel user = new UserModel();
		        user.setId(id);
		        user.setUserName(username);
		        user.setPassword(password);
		        user.setUserType(usertype);
		        userService.updateUser(user);
		        response.sendRedirect("user?action=list");
			  }
			  

			 



}
