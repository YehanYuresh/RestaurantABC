package com.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServlet;


import com.dao.ItemDao;
import com.model.Item;

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

}
