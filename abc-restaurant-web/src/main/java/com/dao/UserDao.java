package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.model.UserModel;



public class UserDao {	
	private List<UserModel> users;
	

	  // User Login Validation 
	  public boolean validateUser (String Username,String Password) throws 	  SQLException { 
		//  List<UserModel> userlist = new ArrayList<>(); 

		 String query =	"SELECT * FROM systemuser where UserName = ? and Password = ?";
		 
		   try (Connection connection = DBConnectionFactory.getConnection();
			         PreparedStatement statement = connection.prepareStatement(query)) {
			         
			        statement.setString(1, Username);
			        statement.setString(2, Password);
			        ResultSet resultSet = statement.executeQuery();
			      
			        // Check if the query returned any result
			        if (resultSet.next()) { 
			            return true;  // User found, valid credentials
			        } else {
			            return false; // No user found with these credentials
			        }
			    } catch (SQLException e) {
			        e.printStackTrace();
			        throw e; // Propagate the exception after logging it
			    }
		  
			/*
			 * Connection connection = DBConnectionFactory.getConnection();
			 * PreparedStatement statement = connection.prepareStatement(query);
			 * statement.setString(1, Username); statement.setString(2, Password); ResultSet
			 * resultSet = statement.executeQuery();
			 * 
			 * while (resultSet.next()) { int id = resultSet.getInt("Id"); String username =
			 * resultSet.getString("UserName"); String password =
			 * resultSet.getString("Password"); String usertype =
			 * resultSet.getString("UserType"); users.add(new UserModel(id, username,
			 * password, usertype)); }
			 * 
			 * if (users!=null) { return true; }else { return false; }
			 */
	  }

	 
	 


    // Get all users
    public List<UserModel> getAllUsers()  throws SQLException {
    	  List<UserModel> users = new ArrayList<>();
          String query = "SELECT * FROM systemuser";

          Connection connection = DBConnectionFactory.getConnection();
          Statement statement = connection.createStatement();
          ResultSet resultSet = statement.executeQuery(query);
          while (resultSet.next()) 
          {
          	int id = resultSet.getInt("Id");
          	String username = resultSet.getString("UserName");
          	String password = resultSet.getString("Password");
          	String usertype = resultSet.getString("UserType");
          	users.add(new UserModel(id, username, password, usertype));
          }
        return users;
    }
    
 // Add a new user
	public void addUser(UserModel user) {
        String query = "INSERT INTO systemuser (UserName, Password, UserType) VALUES (?, ?, ?)";
        try 
        {   Connection connection = DBConnectionFactory.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getUserType());
            statement.executeUpdate();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }

   // get id wise user
	   public UserModel getUserByUsername(int Id)  throws SQLException {
		   List<UserModel> users = new ArrayList<>(); 
			 String query =	"SELECT * FROM systemuser where id= ?";
			  
			  Connection connection = DBConnectionFactory.getConnection();
			  PreparedStatement statement = connection.prepareStatement(query);
			  statement.setInt(1, Id);
			  ResultSet resultSet = statement.executeQuery();
			  
			  while (resultSet.next()) { int id = resultSet.getInt("Id")
					  ; String username =  resultSet.getString("UserName"); 
					  String password =  resultSet.getString("Password");
					  String usertype =	  resultSet.getString("UserType");
					  users.add(new UserModel(id, username,	  password, usertype)); }
			  
			  for (UserModel u : users) {		           
		                return u;		           
		        }
		        return null;
		        }
	   
		public void updateUser(UserModel user) {
	        String query = "UPDATE systemuser SET UserName = ?, Password = ?, UserType = ? WHERE id = ?";
	        try 
	        {   Connection connection = DBConnectionFactory.getConnection();
	            PreparedStatement statement = connection.prepareStatement(query);
	            statement.setString(1, user.getUserName());
	            statement.setString(2, user.getPassword());
	            statement.setString(3, user.getUserType());
	            statement.setInt(4, user.getId());
	            statement.executeUpdate();
	        } 
	        catch (SQLException e) 
	        {
	            e.printStackTrace();
	        }
	    }
}
