package com.controller;
//import com.dao.UserDao;
//import com.model.UserModel;
import com.service.LoginService;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;



@WebServlet("/login")
public class LoginControler extends HttpServlet {

	
	private LoginService loginService;
    
	public void init() throws ServletException {
		loginService = LoginService.getInstance();
    }
 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    	String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        boolean isValidUser;		
			isValidUser = loginService.validateUser(username, password);

        if (isValidUser) {
            // Redirect to a success page 
        	 request.getRequestDispatcher("main.jsp").forward(request, response);
        } else {
            // Forward back to login page with an error message
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    	} catch (SQLException e) {
    		  request.setAttribute("errorMessage", "Invalid username or password.");
              request.getRequestDispatcher("login.jsp").forward(request, response);
		}
    }
}