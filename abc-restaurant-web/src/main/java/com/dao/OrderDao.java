package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDateTime;

import com.model.Order;

public class OrderDao {

    public List<Order> getPendingOrder() throws SQLException {
        List<Order> order = new ArrayList<>();
        String query = "SELECT * FROM restaurantabc.order where pending = 0 or pending is null ";

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) 
        {
        	int id = resultSet.getInt("Id");
        	LocalDateTime date = resultSet.getObject("date", LocalDateTime.class);
        	String item = resultSet.getString("item");
        	int qty = resultSet.getInt("qty");
        	double price = resultSet.getDouble("uprice");
        	double total = resultSet.getDouble("total");
        	order.add(new Order(id, date, item, qty ,price , total ));
        }
        return order;
    }
    
    public List<Order> getallOrder() throws SQLException {
        List<Order> order = new ArrayList<>();
        String query = "SELECT * FROM restaurantabc.order ";

        Connection connection = DBConnectionFactory.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) 
        {
        	int id = resultSet.getInt("Id");
        	LocalDateTime date = resultSet.getObject("date", LocalDateTime.class);
        	String item = resultSet.getString("item");
        	int qty = resultSet.getInt("qty");
        	double price = resultSet.getDouble("uprice");
        	double total = resultSet.getDouble("total");
        	boolean pending = resultSet.getBoolean("pending");
        	order.add(new Order(id, date, item, qty ,price , total, pending ));
        }
        return order;
    }
    
    // Order Complete update   
	public void orderComplete(int Id) {
        String query = "UPDATE restaurantabc.order SET pending = 1 WHERE Id = ?";
        try 
        {   Connection connection = DBConnectionFactory.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, Id);

            statement.executeUpdate();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }
}
