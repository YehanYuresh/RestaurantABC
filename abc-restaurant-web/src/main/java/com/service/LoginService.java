package com.service;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.UserDao;
import com.model.UserModel;

public class LoginService {

 	private static LoginService instance;
    private UserDao UserDAO;

    private LoginService() {
        this.UserDAO = new UserDao();
    }

    public static LoginService getInstance() {
        if (instance == null) {
            synchronized (LoginService.class) {
                if (instance == null) {
                    instance = new LoginService();
                }
            }
        }
        return instance;
    }
    
   	
    public boolean validateUser (String username,String password)  throws SQLException  {

    	return UserDAO.validateUser(username, password) ;
    }
}