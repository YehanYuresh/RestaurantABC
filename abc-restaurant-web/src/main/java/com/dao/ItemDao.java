package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Item;
import com.model.Product;
import com.model.UserModel;

public class ItemDao {
	public void addItems(Item item) throws SQLException {
		 try 
	        {
		
		if (item.getImage() == null)
		{
			 String query = "INSERT INTO restaurantabc.menu (name, price, description, isdelete, category ) VALUES (?, ?, ?, 0 , ?)";

	          Connection connection = DBConnectionFactory.getConnection();
	            PreparedStatement statement = connection.prepareStatement(query);
	            statement.setString(1, item.getName());
	            statement.setDouble(2, item.getPrice());
	            statement.setString(3, item.getDescription());
	            statement.setString(4, item.getCategory());
	            statement.executeUpdate();
		}
		else
		{
			 String query = "INSERT INTO restaurantabc.menu (name, price, description,image,isdelete, category) VALUES (?, ?, ? , ?, 0 , ?)";

	          Connection connection = DBConnectionFactory.getConnection();
	            PreparedStatement statement = connection.prepareStatement(query);
	            statement.setString(1, item.getName());
	            statement.setDouble(2, item.getPrice());
	            statement.setString(3, item.getDescription());
	            statement.setBytes(4, item.getImage());
	            statement.setString(5, item.getCategory());
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
        String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null) and (isoffer = 0 or isoffer is null) ";

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
        String category = resultSet.getString("category");
        	itemlist.add(new Item(id, name, desc, price,image, category));
        }

        return itemlist;
    }
	
	 // Delete user	as update   
	public void deleteItem(int Id) {
        String query = "UPDATE restaurantabc.menu SET isdelete = 1 WHERE Id = ?";
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
	
	public void updateItem(Item item) {
        String query = " UPDATE restaurantabc.menu SET name = ?, price = ?, description = ? , image = ? , category = ? where Id = ? ";
        try 
        {   Connection connection = DBConnectionFactory.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, item.getName());
            statement.setDouble(2, item.getPrice());
            statement.setString(3, item.getDescription());
            statement.setBytes(4, item.getImage());
            statement.setString(5, item.getCategory());
            statement.setInt(6, item.getId());
            statement.executeUpdate();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }
	
	public void updateItemNoImage(Item item) {
        String query = " UPDATE restaurantabc.menu SET name = ?, price = ?, description = ? , category = ?  where Id = ? ";
        try 
        {   Connection connection = DBConnectionFactory.getConnection();
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, item.getName());
            statement.setDouble(2, item.getPrice());
            statement.setString(3, item.getDescription());
            statement.setString(4, item.getCategory());
            statement.setInt(5, item.getId());
            statement.executeUpdate();
        } 
        catch (SQLException e) 
        {
            e.printStackTrace();
        }
    }
	
	   public Item getItemById(int Id)  throws SQLException {
		   List<Item> item = new ArrayList<>(); 
			 String query =	"SELECT * FROM restaurantabc.menu  where Id= ?";
			  
			  Connection connection = DBConnectionFactory.getConnection();
			  PreparedStatement statement = connection.prepareStatement(query);
			  statement.setInt(1, Id);
			  ResultSet resultSet = statement.executeQuery();
			  
			  while (resultSet.next()) 
		        {
		        	int id = resultSet.getInt("Id");
		        	String name = resultSet.getString("Name");
		        	String desc = resultSet.getString("description");
		        	double price = resultSet.getDouble("price");
		        byte[] image = resultSet.getBytes("image");
		        String category = resultSet.getString("category");
		        item.add(new Item(id, name, desc, price,image, category));
		        }
			  
			  for (Item u : item) {		           
		                return u;		           
		        }
		        return null;
		        }
	
	   public List<Item> getOffer() throws SQLException {
	        List<Item> itemlist = new ArrayList<>();
	        String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null) and isoffer = 1 ";
	     //   String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null)  ";

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
	        String category = resultSet.getString("category");
	        itemlist.add(new Item(id, name, desc, price,image, category));
	        }

	        return itemlist;
	    }

	   public List<Item> searchInDatabase(String search)  throws SQLException {
		   List<Item> itemlist = new ArrayList<>();
		   
		   String str1 = search;
		   String str2 = search;
		   String query ="SELECT * FROM restaurantabc.menu where (name like  ? or description like ? ) and (isdelete=0 or isdelete is null)";
	       // String query = "SELECT * FROM restaurantabc.menu where  (isdelete=0 or isdelete is null) ";
				   
				/*   Connection connection = DBConnectionFactory.getConnection();
		     Statement statement = connection.createStatement();
		     ResultSet resultSet = statement.executeQuery(query);*/
try {
	
	  Connection connection = DBConnectionFactory.getConnection();
	  PreparedStatement statement = connection.prepareStatement(query);
	  statement.setString(1,"%"+ str1+ "%"); 
	  statement.setString(2,"%"+ str2+ "%"); 
	  ResultSet resultSet = statement.executeQuery();
	 
	
			 
	        while (resultSet.next()) 
	        {
	        	int id = resultSet.getInt("Id");
	        	String name = resultSet.getString("Name");
	        	String desc = resultSet.getString("description");
	        	double price = resultSet.getDouble("price");
	        byte[] image = resultSet.getBytes("image");
	        String category = resultSet.getString("category");
	        itemlist.add(new Item(id, name, desc, price,image, category));
	        }

	        return itemlist;
} 
catch (SQLException e) 
{
    e.printStackTrace();
}
return itemlist;
}
	    public void addItemtoCart1 (int id, String Userid)   throws SQLException {

				 LocalDateTime now = LocalDateTime.now();
			        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmssSSS");
			        String dateTimeCode = now.format(formatter);
			        try 
			        {   		        
				 String query = "INSERT INTO restaurantabc.order (Id, date, item, qty, uprice, total, orderby, payment,pending)\r\n"
				 		+ "SELECT ? ,now(), Name, 1, price, price, ? ,false, false\r\n"
				 		+ "FROM menu\r\n"
				 		+ "WHERE menu.id=?";
				 
		          Connection connection = DBConnectionFactory.getConnection();
		            PreparedStatement statement = connection.prepareStatement(query);
		            statement.setString(1, dateTimeCode);
		            statement.setString(2, Userid);
		            statement.setInt(3, id);
		            statement.executeUpdate();
	    } 
	    catch (SQLException e) 
	    {
	        e.printStackTrace();
	    }

	 }
	    
	    public List<Item> getAllRice() throws SQLException {
	        List<Item> itemlist = new ArrayList<>();
	        String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null) and (isoffer = 0 or isoffer is null) and category ='Rice & Biriyani'";

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
	        String category = resultSet.getString("category");
	        	itemlist.add(new Item(id, name, desc, price,image, category));
	        }

	        return itemlist;
	    }
	    public List<Item> getAllBun() throws SQLException {
	        List<Item> itemlist = new ArrayList<>();
	        String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null) and (isoffer = 0 or isoffer is null) and category ='Bun' ";

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
	        String category = resultSet.getString("category");
	        	itemlist.add(new Item(id, name, desc, price,image, category));
	        }

	        return itemlist;
	    }
	    public List<Item> getAllPizza() throws SQLException {
	        List<Item> itemlist = new ArrayList<>();
	        String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null) and (isoffer = 0 or isoffer is null) and category ='Pizza'";

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
	        String category = resultSet.getString("category");
	        	itemlist.add(new Item(id, name, desc, price,image, category));
	        }

	        return itemlist;
	    }
	    public List<Item> getAllBave() throws SQLException {
	        List<Item> itemlist = new ArrayList<>();
	        String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null) and (isoffer = 0 or isoffer is null) and category ='Beverage' ";

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
	        String category = resultSet.getString("category");
	        	itemlist.add(new Item(id, name, desc, price,image, category));
	        }

	        return itemlist;
	    }
	    public List<Item> getAllDess() throws SQLException {
	        List<Item> itemlist = new ArrayList<>();
	        String query = "SELECT * FROM restaurantabc.menu where  (isdelete = 0 or isdelete is null) and (isoffer = 0 or isoffer is null) and category ='Desserts' ";

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
	        String category = resultSet.getString("category");
	        	itemlist.add(new Item(id, name, desc, price,image, category));
	        }

	        return itemlist;
	    }
}
