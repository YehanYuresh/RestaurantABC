package com.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServlet;


import com.dao.ItemDao;
import com.model.Item;
import com.model.UserModel;

public class ItemService extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private static ItemService instance;
    private ItemDao itemDao;

    private ItemService() {
        this.itemDao = new ItemDao();
    }

    public static ItemService getInstance() {
        if (instance == null) {
            synchronized (ItemService.class) {
                if (instance == null) {
                    instance = new ItemService();
                }
            }
        }
        return instance;
    }

	public void addItems(Item item) throws SQLException {
		itemDao.addItems(item);
	}
	
	public List<Item> getAllItems() throws SQLException {
		return itemDao.getAllItems();
	}
	
	 //Update an existing user 
    public void updateItem(Item item) {
    	itemDao.updateItem(item);
    	}
    public void updateItemNoImage(Item item) {
    	itemDao.updateItemNoImage(item);
    	}
    // Delete user
    public void deleteItem(int Id) {
    	itemDao.deleteItem(Id); }

	   public Item getItemById(int id) throws SQLException {
	    	Item x =  itemDao.getItemById(id); 
	 	   return x;
	    }
	   public List<Item> getOffer() throws SQLException {
			return itemDao.getOffer();
		}

	   public List<Item> searchInDatabase(String  searchQuery) throws SQLException {
	    	List<Item> x =  itemDao.searchInDatabase(searchQuery); 
	 	   return x;
	    }

	   public void addItemtoCart1 (int id, String Userid)   throws SQLException {
		   itemDao.addItemtoCart1(id, Userid);
	   }
		public List<Item> getAllRice() throws SQLException {
			return itemDao.getAllRice();
		}
		public List<Item> getAllBun() throws SQLException {
			return itemDao.getAllBun();
		}
		public List<Item> getAllPizza() throws SQLException {
			return itemDao.getAllPizza();
		}
		public List<Item> getAllBave() throws SQLException {
			return itemDao.getAllBave();
		}
		public List<Item> getAllDess() throws SQLException {
			return itemDao.getAllDess();
		}
		

}
