package com.service;

import java.sql.SQLException;
import java.util.List;

import com.dao.UserDao;
import com.model.UserModel;

public class UserService {

 	private static UserService instance;
    private UserDao UserDAO;

    private UserService() {
        this.UserDAO = new UserDao();
    }

    public static UserService getInstance() {
        if (instance == null) {
            synchronized (UserService.class) {
                if (instance == null) {
                    instance = new UserService();
                }
            }
        }
        return instance;
    }
    // Get all user 
    public List<UserModel> getAllUsers() throws SQLException {
        return UserDAO.getAllUsers();
    }
    
 // Add a new user 
    public void addUser(UserModel user) {
 	 UserDAO.addUser(user); }
    
 // Get user by username
    public UserModel getUserByUsername(int id) throws SQLException {
    	UserModel x =  UserDAO.getUserByUsername(id); 
 	   return x;
    }
    
    //Update an existing user 
    public void updateUser(UserModel user) {
    	UserDAO.updateUser(user);
    	}
    // Delete user
    public void deleteUser(int Id) {
    	UserDAO.deleteUser(Id); }


}