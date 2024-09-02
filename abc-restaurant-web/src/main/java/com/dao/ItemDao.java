package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Item;
import com.model.Product;

public class ItemDao {
	public void addItems(Item item) throws SQLException {
		 try 
	        {
		
		if (item.getImage() == null)
		{
			 String query = "INSERT INTO restaurantabc.menu (name, price, description) VALUES (?, ?, ?)";

	          Connection connection = DBConnectionFactory.getConnection();
	            PreparedStatement statement = connection.prepareStatement(query);
	            statement.setString(1, item.getName());
	            statement.setDouble(2, item.getPrice());
	            statement.setString(3, item.getDescription());
	            statement.executeUpdate();
		}
		else
		{
			 String query = "INSERT INTO restaurantabc.menu (name, price, description,image) VALUES (?, ?, ? , ?)";

	          Connection connection = DBConnectionFactory.getConnection();
	            PreparedStatement statement = connection.prepareStatement(query);
	            statement.setString(1, item.getName());
	            statement.setDouble(2, item.getPrice());
	            statement.setString(3, item.getDescription());
	            statement.setBytes(4, item.getImage());
	            statement.executeUpdate();
		}

        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }

    public List<Item> getAllItems() throws SQLException {
        List<Item> itemlist = new ArrayList<>();
        String query = "SELECT * FROM restaurantabc.menu";

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) 
        {
        	int id = resultSet.getInt("Id");
        	String name = resultSet.getString("Name");
        	String desc = resultSet.getString("description");
        	double price = resultSet.getDouble("price");
        byte[] image = resultSet.getBytes("image");
        	itemlist.add(new Item(id, name, desc, price,image));
        }

        return itemlist;
    }
}
